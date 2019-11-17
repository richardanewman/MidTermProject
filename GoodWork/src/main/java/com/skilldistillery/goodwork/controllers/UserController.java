package com.skilldistillery.goodwork.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.goodwork.data.AuthDAO;
import com.skilldistillery.goodwork.data.UserDAO;
import com.skilldistillery.goodwork.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO dao;
	@Autowired
	private AuthDAO auth;
	
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
}
