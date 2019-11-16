package com.skilldistillery.goodwork.entities;

import java.time.LocalDate;

import javax.persistence.*;

@Entity
@Table(name = "user_event")
public class UserEvent {
	
	
	@EmbeddedId
	private UserEventId id;

	private boolean active;

	@Column(name = "date_signed_up")
	private LocalDate dateSignedUp;

	@Column(name = "event_role")
	private String role;

	private boolean attended;

	private Integer rating;

	@Column(name = "review_description")
	private String review;
	
	@ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinColumn(name = "user_id")
	@MapsId(value = "userId")
	private User user;
	
	@ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinColumn(name = "event_id")
	@MapsId(value = "eventId")
	private Event event;

	public UserEvent() {
		super();
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public UserEventId getId() {
		return id;
	}

	public void setId(UserEventId id) {
		this.id = id;
	}

	public boolean getActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public LocalDate getDateSignedUp() {
		return dateSignedUp;
	}

	public void setDateSignedUp(LocalDate dateSignedUp) {
		this.dateSignedUp = dateSignedUp;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean getAttended() {
		return attended;
	}

	public void setAttended(boolean attended) {
		this.attended = attended;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	@Override
	public String toString() {
		return "UserEvent [id=" + id + ", active=" + active + ", dateSignedUp=" + dateSignedUp + ", role=" + role
				+ ", attended=" + attended + ", rating=" + rating + ", review=" + review + ", user=" + user + ", event="
				+ event + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (active ? 1231 : 1237);
		result = prime * result + (attended ? 1231 : 1237);
		result = prime * result + ((dateSignedUp == null) ? 0 : dateSignedUp.hashCode());
		result = prime * result + ((event == null) ? 0 : event.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((rating == null) ? 0 : rating.hashCode());
		result = prime * result + ((review == null) ? 0 : review.hashCode());
		result = prime * result + ((role == null) ? 0 : role.hashCode());
		result = prime * result + ((user == null) ? 0 : user.hashCode());
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
		UserEvent other = (UserEvent) obj;
		if (active != other.active)
			return false;
		if (attended != other.attended)
			return false;
		if (dateSignedUp == null) {
			if (other.dateSignedUp != null)
				return false;
		} else if (!dateSignedUp.equals(other.dateSignedUp))
			return false;
		if (event == null) {
			if (other.event != null)
				return false;
		} else if (!event.equals(other.event))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (rating == null) {
			if (other.rating != null)
				return false;
		} else if (!rating.equals(other.rating))
			return false;
		if (review == null) {
			if (other.review != null)
				return false;
		} else if (!review.equals(other.review))
			return false;
		if (role == null) {
			if (other.role != null)
				return false;
		} else if (!role.equals(other.role))
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}

}
