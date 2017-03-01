package com.mw.tour.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="TOUR_DETAILS")
public class Tour implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6454083468997899991L;

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int tour_id;
	
	public int getTour_id() {
		return tour_id;
	}

	public void setTour_id(int tour_id) {
		this.tour_id = tour_id;
	}

	public String getTour_purpose() {
		return tour_purpose;
	}

	public void setTour_purpose(String tour_purpose) {
		this.tour_purpose = tour_purpose;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public java.util.Date getTravel_startdate() {
		return travel_startdate;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public void setTravel_startdate(java.util.Date travel_startdate) {
		this.travel_startdate = travel_startdate;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd")
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

	@Column(name="TOUR_PURPOSE", nullable=true)
    private String tour_purpose;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private java.util.Date travel_startdate;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private java.util.Date travel_enddate;
	
	@Column(name="TICKET_COST", nullable=true)
    private BigDecimal ticket_cost;
	
	@Column(name="TRAVEL_MODE", nullable=true)
    private String travel_mode;	
	
	@Column(name="CAB_HOME", nullable=true)
    private BigDecimal cab_home;
	
	@Column(name="CAB_DEST", nullable=true)
    private BigDecimal cab_dest;
	
	@Column(name="HOTEL_COST", nullable=true)
    private BigDecimal hotel_cost;
	
	@Column(name="LOCAL_CONVEY", nullable=true)
    private String local_convey;
	
	@Column(name="APPROVING_MANAGER", nullable=true)
    private String approving_manager;
	
	@Column(name="TOUR_STATUS", nullable=false)
    private String tour_status;	
	
	@Column(name="TOUR_INFORMATION", nullable=true)
    private String tour_information;

	public String getTour_information() {
		return tour_information;
	}

	public void setTour_information(String tour_information) {
		this.tour_information = tour_information;
	}

}
