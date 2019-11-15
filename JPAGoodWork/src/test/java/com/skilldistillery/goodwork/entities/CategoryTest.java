package com.skilldistillery.goodwork.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class CategoryTest {
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Category cat;

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
		cat = em.find(Category.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		cat = null;
	}

	@Test
	@DisplayName("Testing for all info pulled from database for category")
	void testAll() {
		assertNotNull(cat);
		assertEquals("Community", cat.getName());
		assertEquals(1, cat.getId());
	}
	
	@Test
	@DisplayName("Testing for correct information being pulled for category from the database for its event relationship")
	void testEventsForCat() {
		assertEquals("Help Bobby Bushay clean up all the trash around 5th and Central Ave this Saturday.", cat.getEvents().get(0).getDescription());
		assertEquals("Neighborhood Clean-Up", cat.getEvents().get(0).getEventName());
		assertEquals("Mamma Bushay", cat.getEvents().get(0).getPointOfContact());
	}

}
