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

class UserEventTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private UserEvent userEvent;

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
		userEvent = em.find(UserEvent.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		userEvent = null;
		em.close();
	}
	
	@Test
	void test() {
		fail("Not yet implemented");
	}
	
	@Test
	@DisplayName("Test UserEvent entity connection")
	void test2() {
		assertEquals(2019-11-15, userEvent.getDateSignedUp());
	}

}
