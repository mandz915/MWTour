package com.mw.tour.service;

import java.util.List;

import com.mw.tour.model.Tour;
import com.mw.tour.model.User;

public interface TourService {
	
	User findById(Integer id);

	List<Tour> findAll();
	
	List<Tour> findByStatusEmployee(String status);

	void delete(int id);

	void saveOrUpdate(Tour tour);

	List<Tour> findByManager(String manager, String status);	
}
