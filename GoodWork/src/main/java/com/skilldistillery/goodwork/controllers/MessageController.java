package com.skilldistillery.goodwork.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.goodwork.data.EventDAO;
import com.skilldistillery.goodwork.data.MessageDAO;
import com.skilldistillery.goodwork.entities.Event;
import com.skilldistillery.goodwork.entities.MessageBoard;

@Controller
public class MessageController {
	
	@Autowired
	private MessageDAO messDAO;
	@Autowired
	private EventDAO eventDAO;
	
	@RequestMapping(path = "findMessagesByEventId.do", method = RequestMethod.GET)
	public String diplayMessages(int id, Model model) {
		if (messDAO.findMessagesByEventId(id) == null) {
			model.addAttribute("oops", "Looks like something went wrong. Sorry about that mistake.");
			return "fail";
		} else {

			model.addAttribute("messages", messDAO.findMessagesByEventId(id));

			return "events/event";
		}
	}
	
	@RequestMapping(path="reply.do", method=RequestMethod.POST)
		public String reply(MessageBoard content, @RequestParam("eId") int eId, Model model) {
			MessageBoard message = new MessageBoard();
			Event event = eventDAO.findEventById(eId);
			message = messDAO.addNewMessage(content, eId);
			event.getMessBoards().size();
			List<MessageBoard> messages = messDAO.findMessagesByEventId(eId);
			model.addAttribute("userMessage", message);
			model.addAttribute("event", event);
			model.addAttribute("messages", messages);
			return "events/event";
		}
	}


