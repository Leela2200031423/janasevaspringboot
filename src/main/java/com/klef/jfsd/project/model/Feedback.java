package com.klef.jfsd.project.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "feedback_table")
public class Feedback {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "feedback_id")
  private int id;

  @Column(name = "citizen_name", nullable = false)
  private String citizenname;

  @Column(name = "citizen_constituency", nullable = false)
  private String constituency;

  @Column(name = "issue_description", nullable = false)
  private String issue;

  @Column(name = "rating", nullable = false)
  private int rating;

  @Column(name = "suggestions", nullable = true)  // You can set nullable to false if suggestions are required
  private String suggestions;

@Override
public String toString() {
	return "Feedback [id=" + id + ", citizenname=" + citizenname + ", constituency=" + constituency + ", issue=" + issue
			+ ", rating=" + rating + ", suggestions=" + suggestions + "]";
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getCitizenname() {
	return citizenname;
}

public void setCitizenname(String citizenname) {
	this.citizenname = citizenname;
}

public String getConstituency() {
	return constituency;
}

public void setConstituency(String constituency) {
	this.constituency = constituency;
}

public String getIssue() {
	return issue;
}

public void setIssue(String issue) {
	this.issue = issue;
}

public int getRating() {
	return rating;
}

public void setRating(int rating) {
	this.rating = rating;
}

public String getSuggestions() {
	return suggestions;
}

public void setSuggestions(String suggestions) {
	this.suggestions = suggestions;
}
  
 


}
