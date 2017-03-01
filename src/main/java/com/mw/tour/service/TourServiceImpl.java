package com.mw.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mw.tour.dao.TourDao;
import com.mw.tour.model.Tour;
import com.mw.tour.model.User;

@Service("tourService")
@Transactional
public class TourServiceImpl implements TourService {

	@Autowired
	TourDao tourDao;

	@Autowired
	public void setTourDao(TourDao tourDao) {
		this.tourDao = tourDao;
	}

	@Override
	public User findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Tour> findAll() {

		return tourDao.findAll();
	}

	@Override
	public void saveOrUpdate(Tour tour) {
		tourDao.saveUpdateTour(tour);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Tour> findByStatusEmployee(String status) {
		return tourDao.findByStatusEmployee(status);
	}

	@Override
	public List<Tour> findByManager(String manager, String status) {
		return tourDao.findByManager(manager, status);
	}
	
}
