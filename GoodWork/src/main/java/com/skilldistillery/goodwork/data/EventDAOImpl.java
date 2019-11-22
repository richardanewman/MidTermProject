package com.skilldistillery.goodwork.data;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.stereotype.Service;

import com.skilldistillery.goodwork.entities.Category;
import com.skilldistillery.goodwork.entities.Event;
import com.skilldistillery.goodwork.entities.MessageBoard;
import com.skilldistillery.goodwork.entities.User;
import com.skilldistillery.goodwork.entities.UserEvent;

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
		String sql = "select events from Event events where events.description like :keyword or events.eventName like :keyword";
		List<Event> eventSearch = em.createQuery(sql, Event.class).setParameter("keyword", "%" + keyword + "%")
				.getResultList();
		return eventSearch;
	}

	@Override
	public Event addEvent(Event event, User user, Category category) { // issue with location id coming in Null
		event.setDateCreated(LocalDate.now());
		event.setActive(true);
		// sessions
		user = em.find(User.class, user.getId());
		category = em.find(Category.class, category.getId());
		category.addEvent(event);
		user.addHostedEvent(event);
		System.err.println("In event creation " + event);
//		Location eventsLocation = new Location();
//		eventsLocation.setAddress(address);
//		event.setLocation(event.getLocation());
		em.persist(user);
		em.persist(event);
		em.persist(category);
		em.flush();
		return event;
	}

	@Override
	public Event updateEvent(Event updatedEvent, int eventId, Category category) {
		Event managed = em.find(Event.class, eventId);
		category = em.find(Category.class, category.getId());
		managed.getLocation().setAddress(updatedEvent.getLocation().getAddress());
		managed.removeCategory(managed.getCategories().get(0));
		managed.addCategory(category);
		managed.getLocation().setAddress2(updatedEvent.getLocation().getAddress2());
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
		em.persist(managed);
		em.persist(category);
		em.flush();
		return managed;
	}

	@Override
	public boolean deleteEvent(int id, Event event) {
		Event deleteEvent = em.find(Event.class, id);
		deleteEvent.setActive(false);
		return deleteEvent.getActive();

	}

	@Override
	public Category findCategoryByName(String name) {
		List<Category> catList = null;
		Category cat = null;
		String sql = "SELECT cat FROM Category cat WHERE cat.name = :name";
		catList = em.createQuery(sql, Category.class).setParameter("name", name).getResultList();
		if (catList != null && catList.size() == 1) {
			cat = catList.get(0);
			return cat;
		}
		return cat;
	}

	@Override
	public List<Event> findByCategory(String keyword) {
		String catSql = "SELECT cat FROM Category cat WHERE cat.name LIKE :keyword";
		List<Category> cat = null;
		Category category = null;
		List<Event> catSearch = null;
		cat = em.createQuery(catSql, Category.class).setParameter("keyword", "%" + keyword + "%").getResultList();

		if (cat != null && cat.size() > 0) {
			category = cat.get(0);
			String sql = "SELECT events FROM Event events WHERE :category MEMBER OF events.categories";
			catSearch = em.createQuery(sql, Event.class).setParameter("category", category).getResultList();
		}

		return catSearch;
	}

}
