package com.skilldistillery.goodwork.controllers;

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
	public String updateUserGet(@Valid User newUser, Model model) {
		model.addAttribute("newUser", dao.getUserById(newUser.getId()));
		return "updateUserForm";
	}
	
	@RequestMapping(path="updateUser.do", method = RequestMethod.POST)
	public String updateUserPost(@Valid User newUser, Model model) {
		System.out.println(newUser);
		model.addAttribute("newUser", dao.updateUser(newUser));
		return "profile";
	}
	
	@RequestMapping(path="disableUser.do", method = RequestMethod.POST)
	public String deleteUser(@Valid User newUser, Model model) {
		if(auth.validPassword(newUser.getId(), newUser.getPassword())) {
			dao.deleteUser(newUser.getId());
			return "index";
		}
		newUser = dao.getUserById(newUser.getId());
		model.addAttribute("newUser", newUser);
		return "profile";
	}
}
