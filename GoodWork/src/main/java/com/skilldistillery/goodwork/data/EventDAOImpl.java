package com.skilldistillery.goodwork.data;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.goodwork.entities.Event;

@Transactional // Spring automatically start a transaction for each DAO method
@Service // allow Spring Boot to create the D A O bean
public class EventDAOImpl implements EventDAO {

	@PersistenceContext // allows Spring Boot to a u to wire this EntityManager
	private EntityManager em;

	@Override
	public Event findEventById(int id) {
		return em.find(Event.class, id);
	}

	@Override
	public List<Event> findAll() {
		return em.createQuery("SELECT events FROM Event events ORDER BY events.eventDate", Event.class).getResultList();
	}

	@Override
	public List<Event> findByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Event addEvent(Event event) { // issue with location id coming in Null
		event.setDateCreated(LocalDate.now());
		event.setLocation(event.getLocation());
		em.persist(event);
		return event;
	}

	@Override
	public Event updateEvent(Event updatedEvent, int eventId) {
		Event managed = em.find(Event.class, eventId);
//		Event managed = em.find(Event.class, updatedEvent.getId());
		
		System.err.println("In method******************************"+updatedEvent);
		System.out.println("updated event");
		System.out.println(managed);

		managed.getLocation().setAddress(updatedEvent.getLocation().getAddress());
		managed.getLocation().setAddress(updatedEvent.getLocation().getAddress2());
		managed.getLocation().setCity(updatedEvent.getLocation().getCity());
		managed.getLocation().setState(updatedEvent.getLocation().getState());
		managed.setEventName(updatedEvent.getEventName());
		managed.setDescription(updatedEvent.getDescription());
		managed.setEventDate(updatedEvent.getEventDate());
		managed.setStartTime(updatedEvent.getStartTime());
		managed.setEndTime(updatedEvent.getEndTime());
		managed.setPeopleNeeded(updatedEvent.getPeopleNeeded());
		managed.setDateCreated(updatedEvent.getDateCreated());
		managed.setPhotoUrl(updatedEvent.getPhotoUrl());
		managed.setPointOfContact(updatedEvent.getPointOfContact());
		managed.setPocPhone(updatedEvent.getPocPhone());
		managed.setPocEmail(updatedEvent.getPocEmail());

		return managed;
	}

	@Override
	public boolean deleteEvent(int id, Event event) {
		Event deleteEvent = em.find(Event.class, id);
		em.remove(deleteEvent);
		return (em.find(Event.class, id) == null);
		
	}

}
