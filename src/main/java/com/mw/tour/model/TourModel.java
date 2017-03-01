package com.mw.tour.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class TourModel implements Serializable  {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 6079219188029939571L;
	private String tour_purpose;
	private java.util.Date travel_startdate;	
	private java.util.Date travel_enddate;
    private BigDecimal ticket_cost;
	private String travel_mode;	
	private BigDecimal cab_home;
	private BigDecimal cab_dest;
	private BigDecimal hotel_cost;
	private String local_convey;
	private String approving_manager;
	private String tour_status;
	
	public TourModel() {
    }
	
	public String getTour_purpose() {
		return tour_purpose;
	}
	public void setTour_purpose(String tour_purpose) {
		this.tour_purpose = tour_purpose;
	}
	public java.util.Date getTravel_startdate() {
		return travel_startdate;
	}
	public void setTravel_startdate(java.util.Date travel_startdate) {
		this.travel_startdate = travel_startdate;
	}
	public java.util.Date getTravel_enddate() {
		return travel_enddate;
	}
	public void setTravel_enddate(java.util.Date travel_enddate) {
		this.travel_enddate = travel_enddate;
	}
	public BigDecimal getTicket_cost() {
		return ticket_cost;
	}
	public void setTicket_cost(BigDecimal ticket_cost) {
		this.ticket_cost = ticket_cost;
	}
	public String getTravel_mode() {
		return travel_mode;
	}
	public void setTravel_mode(String travel_mode) {
		this.travel_mode = travel_mode;
	}
	public BigDecimal getCab_home() {
		return cab_home;
	}
	public void setCab_home(BigDecimal cab_home) {
		this.cab_home = cab_home;
	}
	public BigDecimal getCab_dest() {
		return cab_dest;
	}
	public void setCab_dest(BigDecimal cab_dest) {
		this.cab_dest = cab_dest;
	}
	public BigDecimal getHotel_cost() {
		return hotel_cost;
	}
	public void setHotel_cost(BigDecimal hotel_cost) {
		this.hotel_cost = hotel_cost;
	}
	public String getLocal_convey() {
		return local_convey;
	}
	public void setLocal_convey(String local_convey) {
		this.local_convey = local_convey;
	}
	public String getApproving_manager() {
		return approving_manager;
	}
	public void setApproving_manager(String approving_manager) {
		this.approving_manager = approving_manager;
	}
	public String getTour_status() {
		return tour_status;
	}
	public void setTour_status(String tour_status) {
		this.tour_status = tour_status;
	}
}
