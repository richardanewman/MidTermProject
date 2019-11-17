package com.skilldistillery.goodwork.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.goodwork.entities.User;

@Transactional
@Service
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User getUserById(int id) {
		return em.find(User.class, id);
	}
	
	public User updateUser(User user) {
		User upUser = em.find(User.class, user.getId());
		upUser.setBio(user.getBio());
		upUser.setEmail(user.getEmail());
		upUser.setFirstName(user.getFirstName());
		upUser.setLastName(user.getLastName());
		upUser.setPassword(user.getPassword());
		upUser.setPhotoURL(user.getPhotoURL());
		upUser.setUserName(user.getUserName());
		em.persist(upUser);
		em.flush();
		return upUser;
	}

	@Override
	public boolean deleteUser(int id) {
		User user = em.find(User.class, id);
		boolean success = false;

		if (!user.equals(null)) {
			em.remove(user);
			em.flush();
		}
		success = !em.contains(user);
		return success;
	}

	@Override
	public List<User> getAllUsers() {
		List<User> users = null;
		String sql = "SELECT user FROM User user ORDER BY user.firstName, user.lastName";
		users = em.createQuery(sql, User.class).getResultList();
		return users;
	}
	@Override
	public List<User> getActiveUsers() {
		List<User> users = null;
		String sql = "SELECT user FROM User user WHERE user.active = true";
		users = em.createQuery(sql, User.class).getResultList();
		return users;
	}

	@Override
	public User getUserByEmail(String email) {
		User u = null;
		String sql = "SELECT user FROM User user WHERE user.email LIKE :userMail";
		List<User> user = em.createQuery(sql, User.class).setParameter("userMail", email).getResultList();
		if (user != null && user.size() > 0) {
			u = user.get(0);
		}
		return u;
	}
	

}
