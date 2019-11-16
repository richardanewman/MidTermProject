package com.skilldistillery.goodwork.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.goodwork.data.EventDAO;
import com.skilldistillery.goodwork.entities.Event;

@Controller
public class EventController {
	
	@Autowired
	private EventDAO eventDAO;
	
	@RequestMapping(path="getEvent.do", method = RequestMethod.GET)
	public String getEvent(Model model, int eid) {
		model.addAttribute("id", eventDAO.findEventById(eid));
		return "event";
		
	}
	
	@RequestMapping(path="getEventList.do", method = RequestMethod.GET)
	public String eventList(Model model) {
		List<Event> events = eventDAO.findAll();
		model.addAttribute("eventList", events);
		return "eventList";
	}
	
	
}
