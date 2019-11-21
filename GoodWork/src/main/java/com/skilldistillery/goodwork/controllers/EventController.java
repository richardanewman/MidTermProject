package com.skilldistillery.goodwork.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.goodwork.data.EventDAO;
import com.skilldistillery.goodwork.data.MessageDAO;
import com.skilldistillery.goodwork.data.UserDAO;
import com.skilldistillery.goodwork.entities.Category;
import com.skilldistillery.goodwork.entities.Event;
import com.skilldistillery.goodwork.entities.MessageBoard;
import com.skilldistillery.goodwork.entities.User;

@Controller
public class EventController {

	@Autowired
	private EventDAO eventDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired 
	private MessageDAO messDAO;
//	private int eventId;

	@RequestMapping(path = {"/" , "index.do"}, method = RequestMethod.GET)
	public String index(Model model) {
		return "index";
	}

	@RequestMapping(path = "getEvent.do", method = RequestMethod.GET)
	public String getEvent(Model model, int id) {
		model.addAttribute("event", eventDAO.findEventById(id));
		model.addAttribute("messages", messDAO.findMessagesByEventId(id));
		model.addAttribute("userMessage", new MessageBoard());
		return "events/event";

	}

	@RequestMapping(path = "eventKeyword.do")
	public String findByKeyword(@Valid String keyword, Model model) {
		List<Event> eventSearch = eventDAO.findByKeyword(keyword);
		model.addAttribute("eventList", eventSearch);
		return "events/eventList";
	}
	
	@RequestMapping(path = "eventCategory.do")
	public String findByCategory(@Valid String keyword, Model model) {
		List<Event> catSearch = eventDAO.findByCategory(keyword);
		model.addAttribute("events", catSearch);
		return "result";
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
	public String addEvent(Event event, Model model, HttpSession session, @RequestParam("name") String cat) {
		if(session.getAttribute("newUser") != null) {
			Category category = eventDAO.findCategoryByName(cat);
			User newUser = (User) session.getAttribute("newUser");
			model.addAttribute("event", eventDAO.addEvent(event, newUser, category));
		
			model.addAttribute("userMessage", new MessageBoard());
			newUser = userDAO.getUserById(newUser.getId());
			session.removeAttribute("newUser");
			session.setAttribute("newUser", newUser);
			return "events/event";
		}
		return "index";
	}

	@RequestMapping(path = "createEventForm.do", method = RequestMethod.GET)
	public String addEventForm() {
		return "events/createEvent";
	}

	@RequestMapping(path = "updateEvent.do", method = RequestMethod.POST)
	public String updateEvent(Model model, Event updatedEvent, Integer id, @RequestParam("name") String catName, HttpSession session) {
		if(session.getAttribute("newUser") != null) {
			Category cat = eventDAO.findCategoryByName(catName);
			Event originalEventForDate = eventDAO.findEventById(id);
			User user = (User) session.getAttribute("newUser");
			
			updatedEvent.setDateCreated(originalEventForDate.getDateCreated());
			Event event = eventDAO.updateEvent(updatedEvent, id, cat);
			event = eventDAO.findEventById(event.getId());
			user = userDAO.getUserById(user.getId());
			model.addAttribute("userMessage", new MessageBoard());
			model.addAttribute("messages", event.getMessBoards());
			session.removeAttribute("newUser");
			session.setAttribute("newUser", user);
			model.addAttribute("event", event);
			return "events/event";
		}
		return "index";
	}

	@RequestMapping(path = "deleteEvent.do", method = RequestMethod.POST)
	public String deleteEvent(int id, Event event) {
		eventDAO.deleteEvent(id, event);
		return "index";

	}
	
	@RequestMapping(path = "goToUpdateEvent.do", method = RequestMethod.GET)
	public String goToUpdateForm(Event event, Model model) {
		event = eventDAO.findEventById(event.getId());
		model.addAttribute("event", event);
		return "events/updateEvent";
	}
}
