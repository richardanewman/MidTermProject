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

class MessageBoardTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private MessageBoard mb;

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
		mb = em.find(MessageBoard.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		mb = null;
		em.close();
	}

	@Test
	@DisplayName("Testing MessageBoard entity getId")
	void test1() {
		assertNotNull(mb);
		assertEquals(1, mb.getId());
		
	}
	@Test
	@DisplayName("Testing MessageBoard entity getEvent.getEventName")
	void test2() {
		assertNotNull(mb);
		assertEquals("Neighborhood Clean-Up", mb.getEvent().getEventName());
		
	}
	@Test
	@DisplayName("Testing MessageBoard entity getUser.getFirstName")
	void test3() {
		assertNotNull(mb);
		assertEquals("Bobby", mb.getUser().getFirstName());
		
	}
	@Test
	@DisplayName("Testing MessageBoard entity getDatePosted")
	void test4() {
		assertNotNull(mb);
		assertEquals(LocalDate.parse("2019-11-14"), mb.getDatePosted());
		
	}
	@Test
	@DisplayName("Testing MessageBoard entity getContent")
	void test5() {
		assertNotNull(mb);
		assertEquals("Somebody better sign up and me clean. Please.", mb.getContent());
		
	}
	
}
