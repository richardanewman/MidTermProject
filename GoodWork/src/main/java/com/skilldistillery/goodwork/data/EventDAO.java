package com.skilldistillery.goodwork.data;

import java.util.List;

import com.skilldistillery.goodwork.entities.Event;

public interface EventDAO {
		
	public Event findEventById(int eid);
	
	public List<Event> findAll();
	
	public List<Event> findByKeyword(String keyword);
	
	public Event addEvent(Event event);
	
	public Event updateEvent(Event event, int eventId);
	
	public Boolean deleteEvent(int eid);
	
	
}
