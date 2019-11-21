package com.skilldistillery.goodwork.data;

import java.util.List;

import com.skilldistillery.goodwork.entities.MessageBoard;

public interface MessageDAO {
	
	public List<MessageBoard> findMessagesByEventId(int id);

}
