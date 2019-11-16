package com.skilldistillery.goodwork.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.goodwork.entities.Organization;
import com.sun.xml.bind.v2.TODO;

@Service
@Transactional
public class OrgDAOImpl implements OrgDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Organization> getAll() {
		List<Organization> organizationList = em.createQuery("select o from Organization o", Organization.class)
				.getResultList();
		em.flush();
		return organizationList;
	}

	@Override
	public Organization findById(int id) {
		return em.find(Organization.class, id);
	}

	@Override
	public Organization addNewOrg(Organization org) {
		em.persist(org);
		em.flush();
		return org;

	}
	
	@Override
	public boolean disableOrganization(int id) {
		if (em.find(Organization.class, id) != null) {
			Organization disableOrg = em.find(Organization.class, id);
//		TODO
			

			return true;
		} else

			return false;
	}

}
