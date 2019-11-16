package com.skilldistillery.goodwork.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.goodwork.entities.User;

@Transactional
@Service
public class AuthDAOImpl implements AuthDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public boolean validUserName(String userName) {
		List<User> users = null;
		String sql = "SELECT user FROM User user WHERE user.userName = :uName";
		users = em.createQuery(sql, User.class).setParameter("uName", userName).getResultList();
		if (users == null || users.size() > 0) {
			return false;
		}
		return true;
	}

	@Override
	public boolean validPassword(int userId, String password) {
		User user = em.find(User.class, userId);
		if(user.getPassword().equals(password)) {
			return true;
		}
		return false;
	}

	@Override
	public User loginUser(String userName, String password) {
		User u = null;
		List<User> user = null;
		String sql = "SELECT user FROM User user WHERE user.userName = :uName AND user.password = :uPass";
		user = em.createQuery(sql, User.class).setParameter("uName", userName).setParameter("uPass", password).getResultList();
		
		if(user != null && user.size() < 2) {
			u = user.get(0);
			return u;
		}
		return u;
	}

	@Override
	public User registerUser(User user) {
		user.setActive(true);
		em.persist(user);
		em.flush();
		return user;
	}

}
