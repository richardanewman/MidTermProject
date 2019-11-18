package com.skilldistillery.goodwork.data;

import java.util.List;

import com.skilldistillery.goodwork.entities.Organization;
import com.skilldistillery.goodwork.entities.User;

public interface OrgDAO {
	
	List<Organization> getAll();
	Organization findById(int id);
	Organization addNewOrg(Organization org, User user);
	boolean disableOrganization(int id);
	Organization updateOrganization(Organization orgData, int orgId);
	List<Organization> searchByKeyword(String keyword);
	

}
