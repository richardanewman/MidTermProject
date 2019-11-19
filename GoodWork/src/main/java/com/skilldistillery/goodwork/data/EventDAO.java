package com.skilldistillery.goodwork.data;

import java.util.List;

import com.skilldistillery.goodwork.entities.Category;
import com.skilldistillery.goodwork.entities.Event;
import com.skilldistillery.goodwork.entities.User;

public interface EventDAO {

	public Event findEventById(int id);

	public List<Event> findAll();

	public List<Event> findByKeyword(String keyword);

	public Event addEvent(Event event, User user, Category category);

	public Event updateEvent(Event event, int eventId, Category category);

	public boolean deleteEvent(int id, Event event);
	
	public Category findCategoryByName(String name);
	
	public List<Event> findByCategory(String keyword);

}
