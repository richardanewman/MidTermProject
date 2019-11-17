package com.skilldistillery.goodwork.data;

import com.skilldistillery.goodwork.entities.User;

public interface AuthDAO {
	
	public boolean validUserName(String userName);
	public boolean validPassword(int userId, String password);
	public User loginUser(String userName, String password);
	public User registerUser(User user);
	
}
