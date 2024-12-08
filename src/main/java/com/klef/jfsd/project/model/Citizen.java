package com.klef.jfsd.project.model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="citizen_table")
public class Citizen 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="citizen_id")
	private int id;
	@Column(name="citizen_name", nullable=false, length = 50)
	private String name;
	@Column(name="citizen_dob", nullable=false, length = 20)
	private String dataofbirth;
	@Column(name="citizen_gender", nullable=false, length = 20)
	private String gender;
	@Column(name="citizen_email", nullable=false, unique = true, length = 50)
	private String email;
	@Column(name="citizen_pwd", nullable=false, length = 50)
	private String password;
	@Column(name="citizen_aadhaarno", nullable=false, unique = true, length = 20)
	private String aadhaarnumber;
	@Column(name="citizen_contact", nullable=false, unique = true, length = 20)
	private String contact;
	@Column(name="citizen_status", nullable=false, length = 50)
	private String status;
	@OneToMany(mappedBy = "citizen", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Report> reports;
	@Override
	public String toString() {
		return "Citizen [id=" + id + ", name=" + name + ", dataofbirth=" + dataofbirth + ", gender=" + gender
				+ ", email=" + email + ", password=" + password + ", aadhaarnumber=" + aadhaarnumber + ", contact="
				+ contact + ", status=" + status + ", reports=" + reports + "]";
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
	public String getAadhaarnumber() {
		return aadhaarnumber;
	}
	public void setAadhaarnumber(String aadhaarnumber) {
		this.aadhaarnumber = aadhaarnumber;
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
	public List<Report> getReports() {
		return reports;
	}
	public void setReports(List<Report> reports) {
		this.reports = reports;
	}

	
	
	
	
}
