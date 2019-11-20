package com.skilldistillery.goodwork.data;

import java.util.List;

import com.skilldistillery.goodwork.entities.UserEvent;

public interface UserEventDAO {
	
	List<UserEvent> findByUserId(int userId);
	public UserEvent userAttended(int userId, int eventId);

}
