package com.skilldistillery.goodwork.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.goodwork.data.AuthDAO;
import com.skilldistillery.goodwork.data.EventDAO;
import com.skilldistillery.goodwork.data.OrgDAO;
import com.skilldistillery.goodwork.data.UserDAO;
import com.skilldistillery.goodwork.entities.Event;
import com.skilldistillery.goodwork.entities.Organization;
import com.skilldistillery.goodwork.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO dao;
	@Autowired
	private AuthDAO auth;
	@Autowired
	private OrgDAO orgDAO;
	@Autowired
	private EventDAO eventDAO;
	
	@RequestMapping(path="updateUserForm.do", method = RequestMethod.GET)
	public String updateUserGet(Model model, HttpSession session) {
		User old = (User) session.getAttribute("newUser");
		model.addAttribute("user", old);
		return "userJSP/updateUserForm";
	}
	
	@RequestMapping(path="updateUser.do", method = RequestMethod.POST)
	public String updateUserPost(@Valid User user, Model model, HttpSession session) {
		System.out.println(user);
		session.setAttribute("newUser", dao.updateUser(user));
		model.addAttribute("user", new User());
		return "userJSP/profile";
	}
	
	@RequestMapping(path="disableUser.do", method = RequestMethod.POST)
	public String deleteUser(Model model, HttpSession session) {
		User delU = (User) session.getAttribute("newUser");
		if(auth.validPassword(delU.getId(), delU.getPassword())) {
			dao.deleteUser(delU.getId());
			session.removeAttribute("newUser");
			return "index";
		}
		delU = dao.getUserById(delU.getId());
		model.addAttribute("user", new User());
		return "userJSP/profile";
	}
	
	@RequestMapping(path="logout.do", method = RequestMethod.GET)
	public String logoutUser(Model model, HttpSession session) {
		if(session.getAttribute("newUser") != null) {
			session.removeAttribute("newUser");
			return "index";
		}
		return "index";
	}
	
	@RequestMapping(path="search.do", method = RequestMethod.GET)
	public String navSearch(Model model, @RequestParam("keyword") String keyword) {
		if (keyword == null | keyword.equals("")){
			model.addAttribute("oops", "Looks like we didn't find anything. Please try anothe keyword.");
			return "fail";
		} else {
			List<User> users = dao.getAllUsersByKeyword(keyword);
			List<Organization> orgs = orgDAO.searchByKeyword(keyword);
			List<Event> events = eventDAO.findByKeyword(keyword);
			if(users != null) {
			model.addAttribute("users", users);
			}
			if(orgs != null) {
			model.addAttribute("displayAll", orgs);
			}
			if(events != null) {
			model.addAttribute("events", events);
			}
		return "result";
			
		}
 	}
}
