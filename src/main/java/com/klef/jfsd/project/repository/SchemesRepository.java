package com.klef.jfsd.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.project.model.Schemes;

import jakarta.transaction.Transactional;

public interface SchemesRepository extends JpaRepository<Schemes, Integer>
{
	@Query("update Schemes s set s.status=?1 where s.id=?2")
	@Modifying //DML
	@Transactional // to enable auto commit
	public int updateSchemesStatus(String status , int sid );
}
