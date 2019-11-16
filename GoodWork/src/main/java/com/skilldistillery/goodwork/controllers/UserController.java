package com.skilldistillery.goodwork.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.goodwork.data.UserDAO;
import com.skilldistillery.goodwork.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path="updateUserForm.do", method = RequestMethod.GET)
	public String updateUserGet(Model model) {
		model.addAttribute("userForm", new User());
		return "updateUserForm";
	}
	
	@RequestMapping(path="updateUser.do", method = RequestMethod.POST)
	public String updateUserPost(@Valid User user, Model model) {
		User upUser = dao.updateUser(user);
		if(upUser == null) {
			return "fail";
		}
		model.addAttribute("user", upUser);
		return "profile";
	}
	
	@RequestMapping(path="deleteUser.do", method = RequestMethod.POST)
	public String deleteUser(Model model) {
		User u = (User) model.getAttribute("user");
		boolean success = dao.deleteUser(u.getId());
		if(success) {
			return "nav";
		} else {
			return "fail";
		}
	}
}
