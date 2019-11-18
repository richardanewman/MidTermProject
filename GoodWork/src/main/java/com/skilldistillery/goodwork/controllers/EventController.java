package com.skilldistillery.goodwork.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.goodwork.data.EventDAO;
import com.skilldistillery.goodwork.entities.Event;
import com.skilldistillery.goodwork.entities.Location;

@Controller
public class EventController {

	@Autowired
	private EventDAO eventDAO;
//	private int eventId;
	
	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String index(Model model) {
		return "index";
	}

	@RequestMapping(path = "getEvent.do", method = RequestMethod.GET)
	public String getEvent(Model model, int id) {
		model.addAttribute("event", eventDAO.findEventById(id));
		return "events/event"; 

	}

	@RequestMapping(path = "getEventList.do", method = RequestMethod.GET)
	public String eventList(Model model) {
		System.err.println("getEventList.do in controller");
		List<Event> events = eventDAO.findAll();
		System.err.println(events);
		model.addAttribute("eventList", events);
		return "events/eventList";
	}

	@RequestMapping(path = "createEvent.do", method = RequestMethod.POST)
	public String addEvent(Event event, Model model) {
		System.err.println("createEvent.do in controller ************" + event);
		model.addAttribute("newEvent", eventDAO.addEvent(event));
		return "result";
	}

	@RequestMapping(path = "createEventForm.do", method = RequestMethod.GET)
	public String addEventForm() {
		return "events/createEvent";
	}



	@RequestMapping(path = "updateEvent.do", method = RequestMethod.POST)
	public String updateEvent(Model model, Event updatedEvent, Integer id) {
		System.err.println("In controller************"+id);
		System.err.println();
		Event event = eventDAO.updateEvent(updatedEvent, id);
		model.addAttribute("updateEvent", event);
		return "events/event";
//		if (eventDAO.findEventById(id) == null) {
//			model.addAttribute("Something wrong, try again");
//			return "/";
//		}
//		else {
//			Event updatedEvent = eventDAO.findEventById(id);
//			model.addAttribute("updatedEvent", updatedEvent);
//			eventId = id;
//			return "events/event";
//		}
	}

	@RequestMapping(path = "deleteEvent.do", method = RequestMethod.POST)
	public String deleteEvent(int id, Event event) {
		eventDAO.deleteEvent(id, event);
		return "index";

	}

}
