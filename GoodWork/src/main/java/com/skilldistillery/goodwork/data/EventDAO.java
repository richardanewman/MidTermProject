package com.skilldistillery.goodwork.data;

import java.time.LocalDate;
import java.util.List;

import com.skilldistillery.goodwork.entities.Event;
import com.skilldistillery.goodwork.entities.Location;

public interface EventDAO {

	public Event findEventById(int id);

	public List<Event> findAll();

	public List<Event> findByKeyword(String keyword);

	public Event addEvent(Event event);

	public Event updateEvent(Event event, int eventId);

	public boolean deleteEvent(int id, Event event);

}
