package com.skilldistillery.goodwork.data;

import java.util.List;

import com.skilldistillery.goodwork.entities.UserEvent;

public interface UserEventDAO {
	
	UserEvent findByUserID(int userId);

}
