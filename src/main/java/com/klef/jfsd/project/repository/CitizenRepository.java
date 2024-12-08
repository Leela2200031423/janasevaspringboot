package com.klef.jfsd.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import jakarta.transaction.Transactional;

import com.klef.jfsd.project.model.Citizen;

public interface CitizenRepository extends JpaRepository<Citizen, Integer> {
    
    @Query("select c from Citizen c where c.email=?1 and c.password=?2 and c.status='Accepted'")
    public Citizen checkcitizenlogin(String cemail, String cpwd);
    
    @Query("update Citizen c set c.status=?1 where c.id=?2")
	@Modifying //DML
	@Transactional // to enable auto commit
	public int updateCitizenStatus(String status , int cid );
}
