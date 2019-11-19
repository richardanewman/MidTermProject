package com.skilldistillery.goodwork.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.goodwork.data.AuthDAO;
import com.skilldistillery.goodwork.entities.User;

@Controller
public class AuthController {

	@Autowired
	private AuthDAO dao;

	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public String loginForm(Model model, HttpSession session) {
		if (session.getAttribute("newUser") != null) {
			model.addAttribute("user", new User());
			return "userJSP/profile";
		}
		model.addAttribute("user", new User());
		return "authJSP/loginForm";
	}

	@RequestMapping(path = "enter.do", method = RequestMethod.GET)
	public String loginUser(User user, Model model, HttpSession session) {
		User userLog = dao.loginUser(user.getUserName(), user.getPassword());
		if (userLog == null) {
			model.addAttribute("oops", "Invalid Username or Password, please try again");
			return "fail";
//			return "authJSP/loginForm";
		}
		model.addAttribute("user", new User());
		session.setAttribute("newUser", userLog);
		return "userJSP/profile";
	}

	@RequestMapping(path = "register.do", method = RequestMethod.GET)
	public String registerUser(Model model) {
		model.addAttribute("user", new User());
		return "authJSP/registerForm";
	}

	@RequestMapping(path = "addNewUser.do", method = RequestMethod.POST)
	public String addUser(@Valid User newUser, Model model, HttpSession session) {
		if (!dao.validUserName(newUser.getUserName())) {
			model.addAttribute("oops", "Looks like that username is already taken, sorry for the inconvenience.");
			return "fail";
		}
		User u = dao.registerUser(newUser);
		session.setAttribute("newUser", u);
		model.addAttribute("user", new User());
		return "userJSP/profile";
	}

	@RequestMapping(path = "about.do", method = RequestMethod.GET)
	public String goToAbout(Model model) {
		return "contactAndAbout/about";
	}

	@RequestMapping(path = "contact.do", method = RequestMethod.GET)
	public String goToContact(Model model) {
		return "contactAndAbout/contact";
	}

}
