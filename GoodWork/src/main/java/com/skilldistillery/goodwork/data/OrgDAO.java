package com.skilldistillery.goodwork.data;

import java.util.List;

import com.skilldistillery.goodwork.entities.Organization;

public interface OrgDAO {
	
	List<Organization> getAll();
	Organization findById(int id);
	Organization addNewOrg(Organization org);
	boolean disableOrganization(int id);
	Organization updateOrganization(Organization orgData, int orgId);
	List<Organization> searchByKeyword(String keyword);
	

}
