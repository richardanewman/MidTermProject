package com.skilldistillery.goodwork.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.goodwork.entities.MessageBoard;

@Service
@Transactional
public class MessageDAOImpl implements MessageDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<MessageBoard> findMessagesByEventId(int id) {
		String sql = "select m from MessageBoard m where m.event.id= :id";
		List<MessageBoard> messages = em.createQuery(sql, MessageBoard.class).setParameter("id", id).getResultList();
		
		return messages;
	}

}
