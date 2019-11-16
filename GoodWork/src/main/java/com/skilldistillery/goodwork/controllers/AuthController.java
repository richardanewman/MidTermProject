package com.skilldistillery.goodwork.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.goodwork.data.AuthDAO;
import com.skilldistillery.goodwork.entities.User;

@Controller
public class AuthController {

	@Autowired
	private AuthDAO dao;
	
	@RequestMapping(path="login.do", method = RequestMethod.GET)
	public String loginForm(Model model) {
		model.addAttribute("user", new User());
		return "loginForm";
	}
	
	@RequestMapping(path="enter.do", method = RequestMethod.GET)
	public String loginUser(@RequestParam("userName") String userName, @RequestParam("password") String password, Model model) {
		model.addAttribute("user", dao.loginUser(userName, password));
		return "profile";
	}
	
	@RequestMapping(path="register.do", method = RequestMethod.GET)
	public String registerUser(Model model) {
		model.addAttribute("newUser", new User());
		return "registerForm";
	}
	
	@RequestMapping(path="addNewUser.do", method = RequestMethod.POST)
	public String addUser(@Valid User newUser, Model model) {
		if(!dao.validUserName(newUser.getUserName())) {
			model.addAttribute("newUser", new User());
			return "registerForm";
		}
		model.addAttribute("newUser", dao.registerUser(newUser));
		return "profile";
	}

}
