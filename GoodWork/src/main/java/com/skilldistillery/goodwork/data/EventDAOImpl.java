package com.skilldistillery.goodwork.data;

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
		return em.createQuery(
				"SELECT events FROM Event events ORDER BY events.eventDate",
				Event.class).getResultList();
	}

	@Override
	public List<Event> findByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Event addEvent(Event event) {
		em.persist(event);
		return null;
	}

	@Override
	public Event updateEvent(Event event, int eventId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean deleteEvent(int eid) {
		// TODO Auto-generated method stub
		return null;
	}

}
