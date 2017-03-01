package com.mw.tour.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.mw.tour.model.Tour;

@Repository("tourDao")
public class TourDaoImpl extends AbstractDao<Integer, Tour> implements TourDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Tour> findByStatusEmployee(String status) {
		Criteria criteria = getSession().createCriteria(Tour.class);
		//criteria.add(Restrictions.eq("approving_manager", manager).ignoreCase());
		criteria.add(Restrictions.eq("tour_status", status).ignoreCase());
		return criteria.list();
	}

	// private static final class TourMapper implements RowMapper<Tour> {
	//
	// public Tour mapRow(ResultSet rs, int rowNum) throws SQLException {
	// Tour tour = new Tour();
	//
	// tour.setTour_id(rs.getInt("tour_id"));
	// tour.setTour_purpose(rs.getString("tour_purpose"));
	// tour.setTravel_startdate(rs.getDate("tour_startdate"));
	// tour.setTravel_enddate(rs.getDate("tour_enddate"));
	// tour.setTicket_cost(rs.getBigDecimal("ticket_cost"));
	// tour.setTravel_mode(rs.getString("travel_mode"));
	// return tour;
	// }
	// }

	@Override
	public String saveUpdateTour(Tour tour) {

		getSession().saveOrUpdate(tour);
		return "Success";
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Tour> findAll() {
		return (List<Tour>) super.findAll(Tour.class);
	}

	@Override
	public List<Tour> findByManager(String manager, String status) {
		Criteria criteria = getSession().createCriteria(Tour.class);
		criteria.add(Restrictions.eq("approving_manager", manager).ignoreCase());
		criteria.add(Restrictions.eq("tour_status", status).ignoreCase());
		return criteria.list();
	}

}
