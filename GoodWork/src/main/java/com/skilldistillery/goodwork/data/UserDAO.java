package com.skilldistillery.goodwork.data;

import java.util.List;

import com.skilldistillery.goodwork.entities.Event;
import com.skilldistillery.goodwork.entities.Organization;
import com.skilldistillery.goodwork.entities.User;
import com.skilldistillery.goodwork.entities.UserEvent;
import com.skilldistillery.goodwork.entities.UserEventId;

public interface UserDAO {
	
	public User getUserById(int id);
	public User updateUser(User user);
	public boolean deleteUser(int id);
	public List<User> getAllUsers();
	public List<User> getActiveUsers();
	public User getUserByEmail(String email);
	public List<User> getAllUsersByKeyword(String keyword);
	public boolean signedUpForEvent(Event event, User user);
	public boolean signedUpForOrg(Organization org, User user);
	public UserEvent getUserEvent(UserEventId ueId);
}
