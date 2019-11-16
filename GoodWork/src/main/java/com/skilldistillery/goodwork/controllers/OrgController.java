package com.skilldistillery.goodwork.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.goodwork.data.OrgDAO;
import com.skilldistillery.goodwork.entities.Organization;

@Controller
public class OrgController {
	
	@Autowired
	private OrgDAO orgDAO;
	
		
	@RequestMapping(path="getAllOrgs.do", method = RequestMethod.GET)
	public String diplayAllOrgs(Model model) {
		List<Organization> organizationList = orgDAO.getAll();
		model.addAttribute("displayAll", organizationList);
		
		return "result";
		
	}
	
	@RequestMapping(path="findById.do", method = RequestMethod.GET)
	public String diplayOrg(int id, Model model) {
		if (orgDAO.findById(id) == null) {
			model.addAttribute("oops", "Looks like something went wrong. Please check your ID number and try again.");
			return "fail";
		}else {
			
		model.addAttribute("org", orgDAO.findById(id));
		
		return "result";
		}
	}

}
