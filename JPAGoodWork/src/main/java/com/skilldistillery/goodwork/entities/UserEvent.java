package com.skilldistillery.goodwork.entities;

import java.time.LocalDate;

import javax.persistence.*;

@Entity
public class UserEvent {

	@Column(name = "user_id")
	private int userId;

	@Column(name = "event_id")
	private int eventId;

	private int active;

	@Column(name = "date_signed_up")
	private LocalDate dateSignedUp;

	@Column(name = "event_role")
	private String role;

	private int attended;

	private int rating;

	@Column(name = "review_description")
	private String review;

	public int getUserId() {
		return userId;
	}

	public int getEventId() {
		return eventId;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
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

	public int getAttended() {
		return attended;
	}

	public void setAttended(int attended) {
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
		return "UserEvent [userId=" + userId + ", eventId=" + eventId + ", active=" + active + ", dateSignedUp="
				+ dateSignedUp + ", role=" + role + ", attended=" + attended + ", rating=" + rating + ", review="
				+ review + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + active;
		result = prime * result + attended;
		result = prime * result + ((dateSignedUp == null) ? 0 : dateSignedUp.hashCode());
		result = prime * result + eventId;
		result = prime * result + rating;
		result = prime * result + ((review == null) ? 0 : review.hashCode());
		result = prime * result + ((role == null) ? 0 : role.hashCode());
		result = prime * result + userId;
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
		if (eventId != other.eventId)
			return false;
		if (rating != other.rating)
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
		if (userId != other.userId)
			return false;
		return true;
	}

}
