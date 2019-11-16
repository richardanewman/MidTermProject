package com.skilldistillery.goodwork.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {
	
	@Autowired
	private EventDAO eventDAO;
	
	@RequestMapping(path="getEvent" method = RequestMethod.GET)
	public String 
}
