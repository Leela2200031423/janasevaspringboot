package com.klef.jfsd.project.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="politician_table")
public class Politician 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="politician_id")
	private int id;
	@Column(name="politician_name",nullable=false,length = 50)
	private String name;
	@Column(name="politician_dob",nullable=false,length = 20)
	private String dataofbirth;
	@Column(name="politician_gender",nullable=false,length = 20)
	private String gender;
	@Column(name="politician_email",nullable=false,unique = true,length = 50)
	private String email;
	@Column(name="politician_pwd",nullable=false,length = 50)
	private String password;
	@Column(name="politician_constituency",nullable=false,length = 50)
	private String constituency;
	@Column(name="politician_category",nullable=false,length = 50)
	private String category;
	@Column(name="politician_party",nullable=false,length = 50)
	private String party;
	@Column(name="politician_contact",nullable=false,unique = true,length = 20)
	private String contact;
	@Column(name="politician_status",nullable=false,length = 50)
	 private String status;
	@Override
	public String toString() {
		return "Politician [id=" + id + ", name=" + name + ", dataofbirth=" + dataofbirth + ", gender=" + gender
				+ ", email=" + email + ", password=" + password + ", constituency=" + constituency + ", category="
				+ category + ", party=" + party + ", contact=" + contact + ", status=" + status + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDataofbirth() {
		return dataofbirth;
	}
	public void setDataofbirth(String dataofbirth) {
		this.dataofbirth = dataofbirth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConstituency() {
		return constituency;
	}
	public void setConstituency(String constituency) {
		this.constituency = constituency;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getParty() {
		return party;
	}
	public void setParty(String party) {
		this.party = party;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	
}
