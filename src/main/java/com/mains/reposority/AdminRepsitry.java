package com.mains.reposority;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mains.bin.ListingData;

public interface AdminRepsitry extends JpaRepository<ListingData,Integer>   {

}
