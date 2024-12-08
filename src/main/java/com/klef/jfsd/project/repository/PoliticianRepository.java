package com.klef.jfsd.project.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.project.model.Politician;
import com.klef.jfsd.project.model.Report;

import jakarta.transaction.Transactional;

public interface PoliticianRepository extends JpaRepository<Politician, Integer>
{
	@Query("select p from Politician p where p.email=?1 and p.password=?2 and p.status='Active'")  //positional parameter
	public Politician checkpoliticianlogin(String pemail, String ppwd);
	
	@Query("update Politician p set p.status=?1 where p.id=?2")
	@Modifying //DML
	@Transactional // to enable auto commit
	public int updatePoliticianStatus(String status , int pid );
	
}
