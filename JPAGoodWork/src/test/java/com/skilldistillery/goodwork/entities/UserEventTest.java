package com.skilldistillery.goodwork.entities;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

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
		Event e = em.find(Event.class, 1);
		User u = em.find(User.class, 1);
		UserEventId id = new UserEventId(u.getId(), e.getId());
		userEvent = em.find(UserEvent.class, id);
	}

	@AfterEach
	void tearDown() throws Exception {
		userEvent = null;
		em.close();
	}
	
	@Test
	@DisplayName("Test UserEvent entity connection")
	void test() {
		assertEquals(LocalDate.parse("2019-11-15"), userEvent.getDateSignedUp());
	}
	
	@Test
	@DisplayName("Testing for entity connection to user")
	void testUser() {
		assertEquals("Bobby", userEvent.getUser().getFirstName());
		assertTrue(userEvent.getUser().getActive());
	}
	
	@Test
	@DisplayName("Testing for entity connection to event")
	void testEvent() {
		assertEquals("Neighborhood Clean-Up", userEvent.getEvent().getEventName());
		assertEquals("Help Bobby Bushay clean up all the trash around 5th and Central Ave this Saturday.", userEvent.getEvent().getDescription());
	}
	
	@Test
	@DisplayName("Testing UserEvent specific fields")
	void testUserEvent() {
		assertTrue(userEvent.getActive());
		assertFalse(userEvent.getAttended());
		assertEquals(LocalDate.parse("2019-11-15"), userEvent.getDateSignedUp());
		assertNull(userEvent.getRating());
		assertEquals("host", userEvent.getRole());
	}
	

}
