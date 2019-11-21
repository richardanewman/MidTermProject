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
import com.skilldistillery.goodwork.data.UserEventDAO;
import com.skilldistillery.goodwork.entities.Event;
import com.skilldistillery.goodwork.entities.Organization;
import com.skilldistillery.goodwork.entities.User;
import com.skilldistillery.goodwork.entities.UserEvent;
import com.skilldistillery.goodwork.entities.UserEventId;

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
	@Autowired
	private UserEventDAO ueDAO;
	
	@RequestMapping(path="updateUserForm.do", method = RequestMethod.GET)
	public String updateUserGet(Model model, HttpSession session) {
		User old = (User) session.getAttribute("newUser");
		model.addAttribute("userProfile", old);
		return "userJSP/updateUserForm";
	}
	
	@RequestMapping(path="updateUser.do", method = RequestMethod.POST)
	public String updateUserPost(@Valid User user, Model model, HttpSession session) {
		if(user == null) {
			model.addAttribute("oops", "Looks like something went wrong with updating your profile, try again later");
			return "fail";
		}
		User upUser = dao.updateUser(user);
		if(upUser == null) {
			model.addAttribute("oops", "Looks like something went wrong with updating your profile, try again later");
			return "fail";
		}
		session.setAttribute("newUser", dao.updateUser(user));
		model.addAttribute("userProfile", upUser);
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
		model.addAttribute("oops", "Looks like something went wrong, maybe its a wrong password?");
		return "fail";
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
			model.addAttribute("oops", "Looks like we didn't find anything. Please try another keyword.");
			return "fail";
		} else {
			
			List<User> users = dao.getAllUsersByKeyword(keyword);
			List<Organization> orgs = orgDAO.searchByKeyword(keyword);
			List<Event> events = eventDAO.findByKeyword(keyword);
			List<Event> eventCat = eventDAO.findByCategory(keyword);
			
			if(users == null & events == null & orgs == null & eventCat == null) {
				model.addAttribute("oops", "Looks like we couldn't find anything matching that keyword, please try another");
				return "fail";
			} else {
				if(users != null) {
					model.addAttribute("users", users);
				}
				if(orgs != null) {
					model.addAttribute("displayAll", orgs);
				}
				if(events != null) {
					model.addAttribute("events", events);
				}
				if(eventCat != null) {
					model.addAttribute("eventsByCat", eventCat);
				}
				return "result";
			}
			
		}
 	}
	
	@RequestMapping(path = "categorySearch.do", method = RequestMethod.GET)
	public String categorySearch(Model model, @RequestParam("keyword") String keyword) {
		if (keyword == null | keyword.equals("")) {
			model.addAttribute("oops", "Looks like we didnt find anything. Please try another keyword.");
			return "fail";
		}
		
		List<Event> eventCat = eventDAO.findByCategory(keyword);
		
		if(eventCat != null) {
			model.addAttribute("eventsByCat", eventCat);
			return "result";
		}
		
		model.addAttribute("oops", "Looks like we couldn't find any events matching that category search, please try another keyword or try again later");
		return "fail";
	}
	
	@RequestMapping(path="signUpForEvent.do", method = RequestMethod.GET)
	public String signUpForEvent(Event event, Model model, HttpSession session) {
		User user = (User) session.getAttribute("newUser");
		boolean success = dao.signedUpForEvent(event, user);
		if(success) {
			UserEventId ueId = new UserEventId(user.getId(), event.getId());
			UserEvent ue = dao.getUserEvent(ueId);
			
			ue.getEvent().getUsers().size();
			ue.getEvent().getCategories().size();
			ue.getEvent().getMessBoards().size();
			
			user = dao.getUserById(user.getId());
			session.removeAttribute("newUser");
			session.setAttribute("newUser", user);
			model.addAttribute("userProfile", user);
			return "userJSP/profile";
		}
		model.addAttribute("oops", "Looks like something went wrong when signing up for this event, please try again later.");
		return "fail";
	}
	
	@RequestMapping(path="goToUnRegisterEvent.do", method = RequestMethod.GET)
	public String unRegisterEvent(Event event, HttpSession session, Model model) {
		User user = (User) session.getAttribute("newUser");
		boolean success = dao.unRegisterFromEvent(user, event);
		if(success) {
			user = dao.getUserById(user.getId());
			session.removeAttribute("newUser");
			session.setAttribute("newUser", user);
			model.addAttribute("userProfile", user);
			return "userJSP/profile";
		}
		model.addAttribute("oops", "Looks like something went wrong when un-registering from this event, please try again");
		return "fail";
	}
	
	@RequestMapping(path="signUpForOrg.do", method = RequestMethod.GET)
	public String signUpForOrg(Model model, HttpSession session, @RequestParam("oId") int orgId) {
		User user = (User) session.getAttribute("newUser");
		Organization org = orgDAO.findById(orgId);
		boolean success = dao.signedUpForOrg(org, user);
		if(success) {
			user = dao.getUserById(user.getId());
			session.removeAttribute("newUser");
			session.setAttribute("newUser", user);
			org = orgDAO.findById(orgId);
			model.addAttribute("org", org);
			return "orgs/orgProfile";
		}
		model.addAttribute("oops", "Looks like something went wrong when signing up for this organization, please try again later.");
		return "fail";
	}
	
	@RequestMapping(path = "goToUnRegisterOrg.do", method = RequestMethod.GET)
	public String unRegisterOrg(@RequestParam("oId") int orgId, HttpSession session, Model model) {
		User user = (User) session.getAttribute("newUser");
		Organization org = orgDAO.findById(orgId);
		boolean success = dao.unRegisterFromOrg(user, org);
		if(success) {
			user = dao.getUserById(user.getId());
			session.removeAttribute("newUser");
			session.setAttribute("newUser", user);
			model.addAttribute("userProfile", user);
			return "userJSP/profile";
		}
		model.addAttribute("oops", "Looks like something went wrong when un-registering from this organization, please try again later");
		return "fail";
	}

	@RequestMapping(path = "findUserById.do", method = RequestMethod.GET)
	public String diplayUser(int id, Model model) {
		if (dao.getUserById(id) == null) {
			model.addAttribute("oops", "Looks like something went wrong. Please check your ID number and try again.");
			return "fail";
		} else {

	
			model.addAttribute("userProfile", dao.getUserById(id));


			return "userJSP/profile";
		}
	}
	
}
