package com.klef.jfsd.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.klef.jfsd.project.model.Report;

import jakarta.transaction.Transactional;

public interface ReportRepository extends JpaRepository<Report, Integer>
{
	@Query("update Report r set r.status=?1 where r.id=?2")
	@Modifying //DML
	@Transactional // to enable auto commit
	public int updateReportStatus(String status , int rid );
	
	List<Report> findByCity(String city);
	
	@Query("SELECT COUNT(r) FROM Report r WHERE r.city = :city")
    long countByCity(@Param("city") String city);

    @Query("SELECT COUNT(r) FROM Report r WHERE r.city = :city AND r.status = :status")
    long countByCityAndStatus(@Param("city") String city, @Param("status") String status);
    
    @Query("SELECT r FROM Report r WHERE r.citizen.id = :citizenId")
    List<Report> findAllByCitizenId(@Param("citizenId") int citizenId);
    
    @Query("SELECT COUNT(r) FROM Report r WHERE r.citizen.id = :citizenId")
    long countReportsByCitizenId(@Param("citizenId") int citizenId);

}
