package com.skilldistillery.goodwork.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "location_id")
	private int locationId;

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
	private int peopleNeeded;

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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
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

	public int getPeopleNeeded() {
		return peopleNeeded;
	}

	public void setPeopleNeeded(int peopleNeeded) {
		this.peopleNeeded = peopleNeeded;
	}

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
		StringBuilder builder = new StringBuilder();
		builder.append("Event [id=").append(id).append(", locationId=").append(locationId).append(", hostId=")
				.append(hostId).append(", eventName=").append(eventName).append(", description=").append(description)
				.append(", eventDate=").append(eventDate).append(", startTime=").append(startTime).append(", endTime=")
				.append(endTime).append(", peopleNeeded=").append(peopleNeeded).append(", dateCreated=")
				.append(dateCreated).append(", photoUrl=").append(photoUrl).append(", pointOfContact=")
				.append(pointOfContact).append(", pocPhone=").append(pocPhone).append(", pocEmail=").append(pocEmail)
				.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dateCreated == null) ? 0 : dateCreated.hashCode());
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + ((endTime == null) ? 0 : endTime.hashCode());
		result = prime * result + ((eventDate == null) ? 0 : eventDate.hashCode());
		result = prime * result + ((eventName == null) ? 0 : eventName.hashCode());
		result = prime * result + hostId;
		result = prime * result + id;
		result = prime * result + locationId;
		result = prime * result + peopleNeeded;
		result = prime * result + ((photoUrl == null) ? 0 : photoUrl.hashCode());
		result = prime * result + ((pocEmail == null) ? 0 : pocEmail.hashCode());
		result = prime * result + ((pocPhone == null) ? 0 : pocPhone.hashCode());
		result = prime * result + ((pointOfContact == null) ? 0 : pointOfContact.hashCode());
		result = prime * result + ((startTime == null) ? 0 : startTime.hashCode());
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
		if (locationId != other.locationId)
			return false;
		if (peopleNeeded != other.peopleNeeded)
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
		return true;
	}
	
	
	
	

}