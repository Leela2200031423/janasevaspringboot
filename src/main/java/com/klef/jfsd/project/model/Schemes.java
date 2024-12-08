package com.klef.jfsd.project.model;

import java.sql.Blob; 
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="scheme_table")
public class Schemes{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="scheme_id")
    private int id;
    
    @Column(name="scheme_title", nullable = false, length = 100)
    private String title;
    
    @Column(name="scheme_description", nullable = false, length = 255)
    private String description;
    
    @Column(name="scheme_eligibility", nullable = false)
    private String eligibility;
    
    @Column(name="scheme_benifits", nullable = false)
    private String benifits;
    
    @Column(name="scheme_image", nullable = false)
    private Blob image; // Store JPEG image as Blob
    
    @Column(name="scheme_date", nullable = false)
    private String date; // To track the date when the scheme was added
    
    @Column(name="scheme_status", nullable = false, length = 50)
    private String status;

	@Override
	public String toString() {
		return "Schemes [id=" + id + ", title=" + title + ", description=" + description + ", eligibility="
				+ eligibility + ", benifits=" + benifits + ", image=" + image + ", date=" + date + ", status=" + status
				+ "]";
	}

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEligibility() {
		return eligibility;
	}

	public void setEligibility(String eligibility) {
		this.eligibility = eligibility;
	}

	public String getBenifits() {
		return benifits;
	}

	public void setBenifits(String benifits) {
		this.benifits = benifits;
	}

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
    
    
    
}
