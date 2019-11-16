package com.skilldistillery.goodwork.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class OrganizationTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Organization org;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("GoodWork");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		org = em.find(Organization.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		org = null;
	}

	@Test
	@DisplayName("Testing for a viable object returned from the entity")
	void testNull() {
		assertNotNull(org);
	}

	@Test
	@DisplayName("Testing for correct org name and type and number pulled from the database")
	void testNameAndType() {
		assertEquals("Mamma's Helpers", org.getOrgName());
		assertEquals("Group", org.getOrgType());
		assertEquals(null, org.getOrgNum());
	}

	@Test
	@DisplayName("Testing for correct id and website pulled from the database")
	void testIdAndWeb() {
		assertEquals(1, org.getId());
		assertEquals(null, org.getWebsite());
	}

	@Test
	@DisplayName("Testing location from org one to one")
	void testOneToOneLocation() {
		assertEquals("FL", org.getLocation().getState());
	}

	@Test
	@DisplayName("Testing users from org many to many")
	void testManyToMany() {
//		assertEquals(0, org.getUsers().size());
		assertEquals("Bobby", org.getUsers().get(0).getFirstName());
		
	}
}
