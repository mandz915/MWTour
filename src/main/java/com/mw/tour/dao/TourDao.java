package com.mw.tour.dao;

import java.util.List;

import com.mw.tour.model.Tour;

public interface TourDao {
	
	List<Tour> findAll();
	
	List<Tour> findByStatusEmployee(String status);
	
	String saveUpdateTour(Tour tour);

	List<Tour> findByManager(String manager, String Status);	

}
