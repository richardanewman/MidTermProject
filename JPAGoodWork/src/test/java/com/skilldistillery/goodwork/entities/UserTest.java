package com.skilldistillery.goodwork.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class UserTest {
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	@DisplayName("Testing for any kind of information pulled back from the database")
	void test() {
		assertNotNull(user);
		assertEquals("waterboy", user.getUserName());
	}
	
	@Test
	@DisplayName("Testing for correct login info is pulled from the database")
	void testLogin() {
		assertEquals("waterboy", user.getUserName());
		assertEquals("12345", user.getPassword());
	}
	
	@Test
	@DisplayName("Testing for correct user name pulled from the database")
	void testUserName() {
		assertEquals("Bobby", user.getFirstName());
		assertEquals("Bushay", user.getLastName());
	}
	
	@Test
	@DisplayName("Testing for correct user email and active state pulled from the data base")
	void testActiveAndEmail() {
		assertEquals("bobbyB@gmail.com", user.getEmail());
		assertTrue(user.getActive());
	}
	
	@Test
	@DisplayName("Testing for correct bio and photo url pulled from the database")
	void testPhotoAndBio() {
		assertEquals("https://miro.medium.com/max/1914/1*nPRQgbNeVv1PqgXV-HibXg.jpeg", user.getPhotoURL());
		assertEquals("Serving drinks and kicking ass.", user.getBio());
	}

}
