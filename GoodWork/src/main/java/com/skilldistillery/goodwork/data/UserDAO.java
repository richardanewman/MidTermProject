package com.skilldistillery.goodwork.data;

import java.util.List;

import com.skilldistillery.goodwork.entities.User;

public interface UserDAO {
	
	public User getUserById(int id);
	public User updateUser(User user);
	public boolean deleteUser(int id);
	public List<User> getAllUsers();
	public List<User> getActiveUsers();
	public User getUserByEmail(String email);
}
