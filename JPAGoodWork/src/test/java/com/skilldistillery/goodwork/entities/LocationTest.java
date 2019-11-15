package com.skilldistillery.goodwork.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class LocationTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Location location;

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
		location = em.find(Location.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		location = null;
		em.close();
	}

	@Test
	@DisplayName("Testing Location entity state")
	void state() {
		assertEquals("FL", location.getState());
	}

	@Test
	@DisplayName("Testing Location entity city")
	void city() {
		assertEquals("Tallahassee", location.getCity());
	}

	@Test
	@DisplayName("Testing Location entity zipcode")
	void zipCode() {
		assertEquals(32301, location.getZipCode());
	}

	@Test
	@DisplayName("Testing Location entity address ")
	void address() {
		assertEquals("1255 Crocodile Lane", location.getAddress());
	}

}

//@Id
//@GeneratedValue(strategy = GenerationType.IDENTITY)
//private int id;
//
//private String address;
//
//private String address2;
//
//private String city;
//
//private String state;
//
//@Column(name = "zip_code")
//private int zipCode;
