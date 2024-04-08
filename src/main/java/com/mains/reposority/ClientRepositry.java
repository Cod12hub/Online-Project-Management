package com.mains.reposority;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mains.bin.ListingData;


public interface ClientRepositry extends JpaRepository<ListingData,Integer>  {
	 long countByStatus(String status);

	    @Query("SELECT p.department, COUNT(p), SUM(CASE WHEN p.status = 'Closed' THEN 1 ELSE 0 END) " +
	           "FROM ListingData p GROUP BY p.department")
	    List<Object[]> getDepartmentWiseCounts();
	}


