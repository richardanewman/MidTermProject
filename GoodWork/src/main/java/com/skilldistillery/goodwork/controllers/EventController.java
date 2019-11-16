package com.skilldistillery.goodwork.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.goodwork.data.EventDAO;

@Controller
public class EventController {
	
	@Autowired
	private EventDAO eventDAO;
	
	@RequestMapping(path="getEvent.do", method = RequestMethod.GET)
	public String getEvent(Model model) {
		model.addAttribute("id", eventDAO.);
		return "event";
		
	}
	
	@RequestMapping(path="getEventList.do", method = RequestMethod.GET)
	public String eventList(Model model) {
		model.addAttribute("eventList", eventDAO.);
		return 
	}
}
