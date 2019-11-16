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


class EventTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Event event;

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
		event = em.find(Event.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		event = null;
		em.close();
	}

	@Test
	@DisplayName("Testing Event entity getId")
	void test1() {
		assertNotNull(event);
		assertEquals(1, event.getId());
		
	}
	@Test
	@DisplayName("Testing Event entity getLocationId")
	void test2() {
		assertNotNull(event);
		assertEquals("FL", event.getLocation().getState());
		
	}
	@Test
	@DisplayName("Testing Event entity getHostId")
	void test3() {
		assertNotNull(event);
		assertEquals(1, event.getHostId());
		
	}
	@Test
	@DisplayName("Testing Event entity getEventName")
	void test4() {
		assertNotNull(event);
		assertEquals("Neighborhood Clean-Up", event.getEventName());
		
	}
	@Test
	@DisplayName("Testing Event entity getDescription")
	void test5() {
		assertNotNull(event);
		assertEquals("Help Bobby Bushay clean up all the trash around 5th and Central Ave this Saturday.", event.getDescription());
		
	}
	@Test
	@DisplayName("Testing Event entity getEventDate")
	void test6() {
		assertNotNull(event);
		assertEquals(LocalDate.parse("2019-11-16"), event.getEventDate());
		
	}
	@Test
	@DisplayName("Testing Event entity getStartTime")
	void test7() {
		assertNotNull(event);
		assertEquals("12:00:00", event.getStartTime());
		
	}
	@Test
	@DisplayName("Testing Event entity getEndTime")
	void test8() {
		assertNotNull(event);
		assertEquals("14:00:00", event.getEndTime());
		
	}
	@Test
	@DisplayName("Testing Event entity getPeopleNeeded")
	void test9() {
		assertNotNull(event);
		assertEquals(5, event.getPeopleNeeded());
		
	}
	@Test
	@DisplayName("Testing Event entity getDateCreated")
	void test10() {
		assertNotNull(event);
		assertEquals(LocalDate.parse("2019-11-14"), event.getDateCreated());
		
	}
	@Test
	@DisplayName("Testing Event entity getPhotoUrl")
	void test11() {
		assertNotNull(event);
		assertEquals(null, event.getPhotoUrl());
		
	}
	@Test
	@DisplayName("Testing Event entity getPointOfContact")
	void test12() {
		assertNotNull(event);
		assertEquals("Mamma Bushay", event.getPointOfContact());
		
	}
	@Test
	@DisplayName("Testing Event entity getPointOfContact")
	void test13() {
		assertNotNull(event);
		assertEquals("850-334-9876", event.getPocPhone());
		
	}
	@Test
	@DisplayName("Testing Event entity getPointOfContact")
	void test14() {
		assertNotNull(event);
		assertEquals("mammasemail@gmail.com", event.getPocEmail());
		
	}
	@Test
	@DisplayName("Testing Event entity OneToOne on location_id")
	void test15() {
		assertNotNull(event);
		assertEquals("FL", event.getLocation().getState());
		
	}
	@Test
	@DisplayName("Testing Event entity ManyToMany on categories")
	void test16() {
		assertNotNull(event);
		assertEquals("Community", event.getCategories().get(0).getName());
		
	}
	@Test
	@DisplayName("Testing Event entity OneToMany on message boards")
	void test17() {
		assertNotNull(event);
		assertEquals("Somebody better sign up and help me clean. Please.", event.getMessBoards().get(0).getContent());
		
	}
	@Test
	@DisplayName("Testing Event entity OneToMany on users")
	void test18() {
		assertNotNull(event);
		assertEquals("Bobby", event.getUsers().get(0).getUser().getFirstName());
		
	}


}
