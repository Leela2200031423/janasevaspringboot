package com.klef.jfsd.project.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="report_table")
public class Report 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="report_id")
	private int id;
	@Column(name="report_title", nullable = false, length = 100)
	private String title;
	@Column(name="report_city", nullable = false)
	private String city;
	@Column(name="report_location", nullable = false)
	private String location;
	@Column(name="report_description", nullable = false, length = 100)
	private String description;
	@Column(name="report_pdf", nullable = false)
	private Blob pdf; // Store PDF as Blob
	@Column(name="report_status", nullable = false, length = 50)
	private String status;
	@ManyToOne
    @JoinColumn(name = "citizen_id", nullable = false)
    private Citizen citizen;

	@Override
	public String toString() {
		return "Report [id=" + id + ", title=" + title + ", city=" + city + ", location=" + location + ", description="
				+ description + ", pdf=" + pdf + ", status=" + status + ", citizen=" + citizen + "]";
	}
	// Getters and Setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Blob getPdf() {
		return pdf;
	}
	public void setPdf(Blob pdf) {
		this.pdf = pdf;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Citizen getCitizen() {
        return citizen;
    }

    public void setCitizen(Citizen citizen) {
        this.citizen = citizen;
    }
}
