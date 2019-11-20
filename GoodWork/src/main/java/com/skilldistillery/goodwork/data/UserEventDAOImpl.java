package com.skilldistillery.goodwork.data;

import java.util.List;

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
	public List<UserEvent> findByUserId(int userId) {
		String sql = "SELECT ue FROM UserEvent ue WHERE ue.userId = :userId";
		List<UserEvent> userEvent = null;
		
		userEvent = em.createQuery(sql, UserEvent.class).setParameter("userId", userId).getResultList();
		
		return userEvent;
	}

	public UserEvent userAttended(int userId, int eventId) {
		UserEvent userEvent = null;
		
		
		
		
		
		return userEvent;
		
		
	}
	
	

}
