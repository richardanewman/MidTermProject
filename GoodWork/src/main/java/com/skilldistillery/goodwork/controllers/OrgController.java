package com.skilldistillery.goodwork.controllers;

import java.util.List;

import javax.validation.Valid;

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

	@RequestMapping(path = "getAllOrgs.do", method = RequestMethod.GET)
	public String diplayAllOrgs(Model model) {
		List<Organization> organizationList = orgDAO.getAll();
		model.addAttribute("displayAll", organizationList);

		return "result";

	}

	@RequestMapping(path = "findById.do", method = RequestMethod.GET)
	public String diplayOrg(int id, Model model) {
		if (orgDAO.findById(id) == null) {
			model.addAttribute("oops", "Looks like something went wrong. Please check your ID number and try again.");
			return "fail";
		} else {

			model.addAttribute("org", orgDAO.findById(id));

			return "result";
		}
	}

///////////////////////////////////////////////////////////////////////

//Add new organization to database //////////////////////////////////

	@RequestMapping(path = "createOrgForm.do", method = RequestMethod.GET)
	public String getOrgForm(Model model) {
		Organization newOrg = new Organization();
		model.addAttribute("newOrg", newOrg);
		return "newOrg";

	}

	@RequestMapping(path = "addNewOrg.do", method = RequestMethod.POST)
	public String addOrg(@Valid Organization newOrg, Model model) {
		model.addAttribute("newOrg", orgDAO.addNewOrg(newOrg));

		return "org";

	}

///////////////////////////////////////////////////////////////////////

//Disable organization   //////////////////////////////////////////////

	@RequestMapping(path = "disableOrg.do", method = RequestMethod.POST)
	public String disableOrg(@Valid int id, Model model) {
		if (orgDAO.disableOrganization(id)) {
			model.addAttribute("successfulDelete", "Looks like we successfully deleted your organization!");
			return "result";
		} else {
			model.addAttribute("oops", "Looks like something went wrong. Please check your ID number and try again.");
			return "fail";

		}

	}
///////////////////////////////////////////////////////////////////////

//Update organization  ////////////////////////////////////////////////

	@RequestMapping(path = "updateOrgForm.do", method = RequestMethod.GET)
	public String updateTxForm(@Valid int id, Model model) {
		if (orgDAO.findById(id) == null) {
			model.addAttribute("oops", "Looks like something went wrong. Please check your ID number and try again.");
			return "fail";
		} else {
			Organization orgData = orgDAO.findById(id);
			model.addAttribute("orgData", orgData);
//orgId = id;

			return "updateOrgForm";
		}

	}

	@RequestMapping(path = "updateOrg.do", method = RequestMethod.POST)
	public String updateTx(@Valid Organization orgData, Model model) {
		Organization updatedOrg = orgDAO.updateOrganization(orgData);
		model.addAttribute("successfulUpdate", updatedOrg);
		model.addAttribute("successful", "You successfully updated your organization!");

		return "org";

	}

}
