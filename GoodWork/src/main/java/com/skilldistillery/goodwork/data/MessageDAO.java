package com.skilldistillery.goodwork.data;

import java.util.List;

import com.skilldistillery.goodwork.entities.MessageBoard;
import com.skilldistillery.goodwork.entities.User;

public interface MessageDAO {
	
	List<MessageBoard> findMessagesByEventId(int id);
	MessageBoard addNewMessage(MessageBoard message, int id);
}
