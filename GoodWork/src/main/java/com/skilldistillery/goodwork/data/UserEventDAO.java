package com.skilldistillery.goodwork.data;

import com.skilldistillery.goodwork.entities.UserEvent;

public interface UserEventDAO {
	
	UserEvent findByUserAndEventId(int userId, int eventId);
	public UserEvent userAttended(int userId, int eventId);

}
