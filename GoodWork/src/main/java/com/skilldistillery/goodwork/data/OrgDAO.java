package com.skilldistillery.goodwork.data;

import java.util.List;

import com.skilldistillery.goodwork.entities.Organization;

public interface OrgDAO {
	
	List<Organization> getAll();
	Organization findById(int id);
	

}
