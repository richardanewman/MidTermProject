package com.skilldistillery.goodwork.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.goodwork.entities.Organization;

@Service
@Transactional
public class OrgDAOImpl implements OrgDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Organization> getAll() {
		List<Organization> organizationList = em.createQuery("select o from Organization o", Organization.class).getResultList();
		em.flush();
		return organizationList;
	}

	@Override
	public Organization findById(int id) {
		return em.find(Organization.class, id);
	}

}
