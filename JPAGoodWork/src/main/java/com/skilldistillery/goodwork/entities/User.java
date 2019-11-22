package com.skilldistillery.goodwork.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "username")
	private String userName;
	private String password;
	private Boolean active;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
	private String email;
	private String bio;
	@Column(name = "photo_url")
	private String photoURL;
	@OneToMany(mappedBy = "user", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private List<MessageBoard> messBoards;
	@OneToMany(mappedBy = "user", cascade = { CascadeType.PERSIST, CascadeType.REMOVE }, fetch=FetchType.EAGER)
	private List<UserEvent> attendedEvents;
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.REMOVE }, mappedBy="users")
	private List<Organization> orgs;
	@OneToMany(mappedBy = "host", cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	private List<Event> hostedEvents;

	public User(int id, String userName, String password, Boolean active, String firstName, String lastName,
			String email, String bio, String photoURL) {
		super();
		this.id = id;
		this.userName = userName;
		this.password = password;
		this.active = active;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.bio = bio;
		this.photoURL = photoURL;
	}

	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public List<Event> getHostedEvents() {
		return hostedEvents;
	}

	public void setHostedEvents(List<Event> hostedEvents) {
		this.hostedEvents = hostedEvents;
	}

	public List<UserEvent> getAttendedEvents() {
		return attendedEvents;
	}

	public void setAttendedEvents(List<UserEvent> events) {
		this.attendedEvents = events;
	}

	public List<MessageBoard> getMessBoards() {
		return messBoards;
	}

	public void setMessBoards(List<MessageBoard> messBoards) {
		this.messBoards = messBoards;
	}

	public List<Organization> getOrgs() {
		return orgs;
	}

	public void setOrgs(List<Organization> orgs) {
		this.orgs = orgs;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public String getPhotoURL() {
		return photoURL;
	}

	public void setPhotoURL(String photoURL) {
		this.photoURL = photoURL;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((active == null) ? 0 : active.hashCode());
		result = prime * result + ((attendedEvents == null) ? 0 : attendedEvents.hashCode());
		result = prime * result + ((bio == null) ? 0 : bio.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + ((hostedEvents == null) ? 0 : hostedEvents.hashCode());
		result = prime * result + id;
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result + ((messBoards == null) ? 0 : messBoards.hashCode());
		result = prime * result + ((orgs == null) ? 0 : orgs.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((photoURL == null) ? 0 : photoURL.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (active == null) {
			if (other.active != null)
				return false;
		} else if (!active.equals(other.active))
			return false;
		if (attendedEvents == null) {
			if (other.attendedEvents != null)
				return false;
		} else if (!attendedEvents.equals(other.attendedEvents))
			return false;
		if (bio == null) {
			if (other.bio != null)
				return false;
		} else if (!bio.equals(other.bio))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (hostedEvents == null) {
			if (other.hostedEvents != null)
				return false;
		} else if (!hostedEvents.equals(other.hostedEvents))
			return false;
		if (id != other.id)
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (messBoards == null) {
			if (other.messBoards != null)
				return false;
		} else if (!messBoards.equals(other.messBoards))
			return false;
		if (orgs == null) {
			if (other.orgs != null)
				return false;
		} else if (!orgs.equals(other.orgs))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (photoURL == null) {
			if (other.photoURL != null)
				return false;
		} else if (!photoURL.equals(other.photoURL))
			return false;
		if (userName == null) {
			if (other.userName != null)
				return false;
		} else if (!userName.equals(other.userName))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password=" + password + ", active=" + active
				+ ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", bio=" + bio
				+ ", photoURL=" + photoURL + "]";
	}

	public void addMessageBoard(MessageBoard messBoard) {
		if (messBoards == null) {
			messBoards = new ArrayList<>();
		}

		if (!messBoards.contains(messBoard)) {
			messBoards.add(messBoard);
			if (messBoard.getUser() != null) {
				messBoard.getUser().getMessBoards().remove(messBoard);
			}
			messBoard.setUser(this);
		}
	}

	public void removeMessageBoard(MessageBoard messBoard) {
		messBoard.setUser(null);
		if (messBoards != null) {
			messBoards.remove(messBoard);
		}
	}

	public void addUserEvent(UserEvent userEvent) {
		if (attendedEvents == null) {
			attendedEvents = new ArrayList<>();
		}

		if (!attendedEvents.contains(userEvent)) {
			attendedEvents.add(userEvent);
			if (userEvent.getUser() != null) {
				userEvent.getUser().getAttendedEvents().remove(userEvent);
			}
			userEvent.setUser(this);
		}
	}

	public void removeUserEvent(UserEvent userEvent) {
		userEvent.setUser(null);
		if (attendedEvents != null) {
			attendedEvents.remove(userEvent);
		}
	}

	public void addOrganization(Organization org) {
		if (orgs == null) {
			orgs = new ArrayList<>();
		}

		if (!orgs.contains(org)) {
			orgs.add(org);
			org.addUser(this);
		}
	}

	public void removeOrganization(Organization org) {
		if (orgs != null && orgs.contains(org)) {
			orgs.remove(org);
			org.removeUser(this);
		}
	}
	
	public void addHostedEvent(Event event) {
		if (hostedEvents == null) {
			hostedEvents = new ArrayList<>();
		}

		if (!hostedEvents.contains(event)) {
			hostedEvents.add(event);
			if (event.getHost() != null) {
				event.getHost().getHostedEvents().remove(event);
			}
			event.setHost(this);
		}
	}

	public void removeHostedEvent(Event event) {
			event.setHost(null);
		if (hostedEvents != null) {
			hostedEvents.remove(event);
		}
	}
}