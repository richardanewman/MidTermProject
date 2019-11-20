package com.skilldistillery.goodwork.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.goodwork.entities.UserEvent;

@Transactional
@Service
public class UserEventDAOImpl implements UserEventDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public UserEvent findByUserAndEventId(int userId, int eventId) {
		UserEvent userEvent = em.find(UserEvent.class, userId);
		return userEvent;
	}

	public UserEvent userAttended(int userId, int eventId) {
		UserEvent userEvent = findByUserAndEventId(userId, eventId);
		userEvent.setAttended(true);
		
		
		
		
		return userEvent;
		
		
	}
	
	

}
