package com.skilldistillery.goodwork.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

@Entity
public class Organization {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinColumn(name = "location_id")
	private Location location;
	
	@Column(name = "org_name")
	private String orgName;

	@Column(name="description")
	private String orgDescription;
	
	@Column(name = "org_type")
	private String orgType;
	
	@Column(name = "org_number")
	private String orgNum;
	
	@Column(name = "logo_url")
	private String logoURL;
	private String website;
	private boolean active;
	
	@ManyToMany(cascade = {CascadeType.PERSIST})
	@JoinTable(name = "organization_has_user", joinColumns = @JoinColumn(name = "organization_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> users;

	public int getId() {
		return id;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
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

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	
	public String getOrgDescription() {
		return orgDescription;
	}

	public void setOrgDescription(String orgDescription) {
		this.orgDescription = orgDescription;
	}

	public String getOrgType() {
		return orgType;
	}

	public void setOrgType(String orgType) {
		this.orgType = orgType;
	}

	public String getOrgNum() {
		return orgNum;
	}

	public void setOrgNum(String orgNum) {
		this.orgNum = orgNum;
	}

	public String getLogoURL() {
		return logoURL;
	}

	public void setLogoURL(String logoURL) {
		this.logoURL = logoURL;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public Organization(int id, Location location, String orgName, String orgType, String orgNum, String logoURL,
			String website) {
		super();
		this.id = id;
		this.location = location;
		this.orgName = orgName;
		this.orgType = orgType;
		this.orgNum = orgNum;
		this.logoURL = logoURL;
		this.website = website;
	}

	public Organization() {
		super();
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (active ? 1231 : 1237);
		result = prime * result + id;
		result = prime * result + ((location == null) ? 0 : location.hashCode());
		result = prime * result + ((logoURL == null) ? 0 : logoURL.hashCode());
		result = prime * result + ((orgDescription == null) ? 0 : orgDescription.hashCode());
		result = prime * result + ((orgName == null) ? 0 : orgName.hashCode());
		result = prime * result + ((orgNum == null) ? 0 : orgNum.hashCode());
		result = prime * result + ((orgType == null) ? 0 : orgType.hashCode());
		result = prime * result + ((users == null) ? 0 : users.hashCode());
		result = prime * result + ((website == null) ? 0 : website.hashCode());
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
		Organization other = (Organization) obj;
		if (active != other.active)
			return false;
		if (id != other.id)
			return false;
		if (location == null) {
			if (other.location != null)
				return false;
		} else if (!location.equals(other.location))
			return false;
		if (logoURL == null) {
			if (other.logoURL != null)
				return false;
		} else if (!logoURL.equals(other.logoURL))
			return false;
		if (orgDescription == null) {
			if (other.orgDescription != null)
				return false;
		} else if (!orgDescription.equals(other.orgDescription))
			return false;
		if (orgName == null) {
			if (other.orgName != null)
				return false;
		} else if (!orgName.equals(other.orgName))
			return false;
		if (orgNum == null) {
			if (other.orgNum != null)
				return false;
		} else if (!orgNum.equals(other.orgNum))
			return false;
		if (orgType == null) {
			if (other.orgType != null)
				return false;
		} else if (!orgType.equals(other.orgType))
			return false;
		if (users == null) {
			if (other.users != null)
				return false;
		} else if (!users.equals(other.users))
			return false;
		if (website == null) {
			if (other.website != null)
				return false;
		} else if (!website.equals(other.website))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Organization [id=").append(id).append(", location=").append(location).append(", orgName=")
				.append(orgName).append(", orgDescription=").append(orgDescription).append(", orgType=").append(orgType)
				.append(", orgNum=").append(orgNum).append(", logoURL=").append(logoURL).append(", website=")
				.append(website).append(", active=").append(active).append(", users=").append(users).append("]");
		return builder.toString();
	}
	
	public void addUser(User user) {
		if (users == null) {
			users = new ArrayList<>();
		}

		if (!users.contains(user)) {
			users.add(user);
			user.addOrganization(this);
		}
	}

	public void removeUser(User user) {
		if (users != null && users.contains(user)) {
			users.remove(user);
			user.removeOrganization(this);
		}
	}

}
