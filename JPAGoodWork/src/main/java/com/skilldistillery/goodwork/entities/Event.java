package com.skilldistillery.goodwork.entities;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@OneToOne
	@JoinColumn(name = "location_id")
	private Location location;

	@Column(name = "host_id")
	private int hostId;

	@Column(name = "event_name")
	private String eventName;

	private String description;
	@Column(name = "event_date")
	private LocalDate eventDate;

	@Column(name = "start_time")
	private String startTime;

	@Column(name = "end_time")
	private String endTime;

	@Column(name = "people_needed")
	private Integer peopleNeeded;

	@Column(name = "date_created")
	private LocalDate dateCreated;

	@Column(name = "photo_url")
	private String photoUrl;

	@Column(name = "point_of_contact")
	private String pointOfContact;

	@Column(name = "poc_phone")
	private String pocPhone;

	@Column(name = "poc_email")
	private String pocEmail;

	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.REMOVE }, mappedBy = "events")
	private List<Category> categories;

	@OneToMany(mappedBy = "event", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private List<MessageBoard> messBoards;

	@OneToMany(mappedBy = "event", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private List<UserEvent> users;

	public List<UserEvent> getUsers() {
		return users;
	}

	public void setUsers(List<UserEvent> users) {
		this.users = users;
	}

	public List<MessageBoard> getMessBoards() {
		return messBoards;
	}

	public void setMessBoards(List<MessageBoard> messBoards) {
		this.messBoards = messBoards;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public int getHostId() {
		return hostId;
	}

	public void setHostId(int hostId) {
		this.hostId = hostId;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDate getEventDate() {
		return eventDate;
	}

	public void setEventDate(LocalDate eventDate) {
		this.eventDate = eventDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public Integer getPeopleNeeded() {
		return peopleNeeded;
	}

	public void setPeopleNeeded(int peopleNeeded) {
		this.peopleNeeded = peopleNeeded;
	}

//	public void setPeopleNeeded(Integer peopleNeeded) {
//		this.peopleNeeded = peopleNeeded;
//	}

	public LocalDate getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDate dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public String getPointOfContact() {
		return pointOfContact;
	}

	public void setPointOfContact(String pointOfContact) {
		this.pointOfContact = pointOfContact;
	}

	public String getPocPhone() {
		return pocPhone;
	}

	public void setPocPhone(String pocPhone) {
		this.pocPhone = pocPhone;
	}

	public String getPocEmail() {
		return pocEmail;
	}

	public void setPocEmail(String pocEmail) {
		this.pocEmail = pocEmail;
	}

	public Event() {
		super();
	}

	@Override
	public String toString() {
		return "Event [id=" + id + ", location=" + location + ", hostId=" + hostId + ", eventName=" + eventName
				+ ", description=" + description + ", eventDate=" + eventDate + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", peopleNeeded=" + peopleNeeded + ", dateCreated=" + dateCreated
				+ ", photoUrl=" + photoUrl + ", pointOfContact=" + pointOfContact + ", pocPhone=" + pocPhone
				+ ", pocEmail=" + pocEmail + ", categories=" + categories + ", messBoards=" + messBoards + ", users="
				+ users + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((categories == null) ? 0 : categories.hashCode());
		result = prime * result + ((dateCreated == null) ? 0 : dateCreated.hashCode());
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + ((endTime == null) ? 0 : endTime.hashCode());
		result = prime * result + ((eventDate == null) ? 0 : eventDate.hashCode());
		result = prime * result + ((eventName == null) ? 0 : eventName.hashCode());
		result = prime * result + hostId;
		result = prime * result + id;
		result = prime * result + ((location == null) ? 0 : location.hashCode());
		result = prime * result + ((messBoards == null) ? 0 : messBoards.hashCode());
		result = prime * result + ((peopleNeeded == null) ? 0 : peopleNeeded.hashCode());
		result = prime * result + ((photoUrl == null) ? 0 : photoUrl.hashCode());
		result = prime * result + ((pocEmail == null) ? 0 : pocEmail.hashCode());
		result = prime * result + ((pocPhone == null) ? 0 : pocPhone.hashCode());
		result = prime * result + ((pointOfContact == null) ? 0 : pointOfContact.hashCode());
		result = prime * result + ((startTime == null) ? 0 : startTime.hashCode());
		result = prime * result + ((users == null) ? 0 : users.hashCode());
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
		Event other = (Event) obj;
		if (categories == null) {
			if (other.categories != null)
				return false;
		} else if (!categories.equals(other.categories))
			return false;
		if (dateCreated == null) {
			if (other.dateCreated != null)
				return false;
		} else if (!dateCreated.equals(other.dateCreated))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (endTime == null) {
			if (other.endTime != null)
				return false;
		} else if (!endTime.equals(other.endTime))
			return false;
		if (eventDate == null) {
			if (other.eventDate != null)
				return false;
		} else if (!eventDate.equals(other.eventDate))
			return false;
		if (eventName == null) {
			if (other.eventName != null)
				return false;
		} else if (!eventName.equals(other.eventName))
			return false;
		if (hostId != other.hostId)
			return false;
		if (id != other.id)
			return false;
		if (location == null) {
			if (other.location != null)
				return false;
		} else if (!location.equals(other.location))
			return false;
		if (messBoards == null) {
			if (other.messBoards != null)
				return false;
		} else if (!messBoards.equals(other.messBoards))
			return false;
		if (peopleNeeded == null) {
			if (other.peopleNeeded != null)
				return false;
		} else if (!peopleNeeded.equals(other.peopleNeeded))
			return false;
		if (photoUrl == null) {
			if (other.photoUrl != null)
				return false;
		} else if (!photoUrl.equals(other.photoUrl))
			return false;
		if (pocEmail == null) {
			if (other.pocEmail != null)
				return false;
		} else if (!pocEmail.equals(other.pocEmail))
			return false;
		if (pocPhone == null) {
			if (other.pocPhone != null)
				return false;
		} else if (!pocPhone.equals(other.pocPhone))
			return false;
		if (pointOfContact == null) {
			if (other.pointOfContact != null)
				return false;
		} else if (!pointOfContact.equals(other.pointOfContact))
			return false;
		if (startTime == null) {
			if (other.startTime != null)
				return false;
		} else if (!startTime.equals(other.startTime))
			return false;
		if (users == null) {
			if (other.users != null)
				return false;
		} else if (!users.equals(other.users))
			return false;
		return true;
	}

	public void addCategory(Category cat) {
		if (categories == null) {
			categories = new ArrayList<>();
		}

		if (!categories.contains(cat)) {
			categories.add(cat);
			cat.addEvent(this);
		}
	}

	public void removeCategory(Category cat) {
		if (categories != null && categories.contains(cat)) {
			categories.remove(cat);
			cat.removeEvent(this);
		}
	}

	public void addMessageBoard(MessageBoard messBoard) {
		if (messBoards == null) {
			messBoards = new ArrayList<>();
		}

		if (!messBoards.contains(messBoard)) {
			messBoards.add(messBoard);
			if (messBoard.getEvent() != null) {
				messBoard.getEvent().getMessBoards().remove(messBoard);
			}
			messBoard.setEvent(this);
		}
	}

	public void removeMessageBoard(MessageBoard messBoard) {
		messBoard.setEvent(null);
		if (messBoards != null) {
			messBoards.remove(messBoard);
		}
	}

	public void addUserEvent(UserEvent userEvent) {
		if (users == null) {
			users = new ArrayList<>();
		}

		if (!users.contains(userEvent)) {
			users.add(userEvent);
			if (userEvent.getUser() != null) {
				userEvent.getEvent().getUsers().remove(userEvent);
			}
			userEvent.setEvent(this);
		}
	}

	public void removeUserEvent(UserEvent userEvent) {
		userEvent.setUser(null);
		if (users != null) {
			users.remove(userEvent);
		}
	}

}
