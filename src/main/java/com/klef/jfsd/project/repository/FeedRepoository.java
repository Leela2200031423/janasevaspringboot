package com.klef.jfsd.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.klef.jfsd.project.model.Feedback;

public interface FeedRepoository extends JpaRepository<Feedback, Integer>
{
	 @Query("SELECT f FROM Feedback f WHERE f.constituency = :constituency")
	   List<Feedback> findByConstituency(@Param("constituency") String constituency);
	 
	 
	 
}
