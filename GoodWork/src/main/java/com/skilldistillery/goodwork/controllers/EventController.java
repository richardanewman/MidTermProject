package com.skilldistillery.goodwork.controllers;

import java.time.LocalDate;
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

	@RequestMapping(path = "getEvent.do", method = RequestMethod.GET)
	public String getEvent(Model model, int id) {
		model.addAttribute("event", eventDAO.findEventById(id));
		return "result"; 

	}

	@RequestMapping(path = "getEventList.do", method = RequestMethod.GET)
	public String eventList(Model model) {
		List<Event> events = eventDAO.findAll();
		model.addAttribute("eventList", events);
		return "eventList";
	}

	@RequestMapping(path = "createEventForm.do", method = RequestMethod.GET)
	public String addEventForm() {
//		Event newEvent = new Event();
//		model.addAttribute("newEvent", newEvent);
		return "createEvent";
	}

	@RequestMapping(path = "createEvent.do", method = RequestMethod.POST)
	public String addEvent(Event event, Model model) {
		System.err.println("createEvent.do in controller ************" + event);
//		event.setEventDate(LocalDate.parse(event.getDateString())); // trying to work with date rejection from jsp
		model.addAttribute("newEvent", eventDAO.addEvent(event));
		return "result";
	}

	@RequestMapping(path = "updateEvent.do", method = RequestMethod.POST)
	public String updateEvent(Model model, Event updatedEvent, Integer id) {
		model.addAttribute("event", eventDAO.updateEvent(updatedEvent, id));
		return "result";
	}

	@RequestMapping(path = "deleteEvent.do", method = RequestMethod.POST)
	public String deleteEvent(Model model, int id) {
		eventDAO.deleteEvent(id);
		return "result";

	}

}
