package com.mw.tour.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mw.tour.model.Tour;
import com.mw.tour.model.TourModel;
import com.mw.tour.service.TourService;

@Controller
@SessionAttributes
public class MWLoginController {

	@Autowired
	private TourService tourService;

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String homePageDefault(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		//List tourList = tourService.findAll();
		List<?> tourList = tourService.findByStatusEmployee("DRAFT");
		model.addAttribute("tours", tourList);
		model.addAttribute("tour", new Tour());
		return "welcome";
	}
	
	@RequestMapping(value = { "/changeStatus" }, method = RequestMethod.GET, params={"tour_statusDropdown"})
	public String homePage(ModelMap model, @RequestParam("tour_statusDropdown") String statusType) {		
		model.addAttribute("user", getPrincipal());
		List<?> tourList = tourService.findByStatusEmployee(statusType);
		model.addAttribute("tours", tourList);
		model.addAttribute("statusSelected", statusType);
		model.addAttribute("tour", new Tour());
		return "welcome";
	}

	@RequestMapping(value = "/changeStatusManager", method = RequestMethod.GET, params={"tour_status"})
	public String managerPage(ModelMap model, @RequestParam("tour_status") String statusType) {
		model.addAttribute("user", getPrincipal());
		List<Tour> tourList = tourService.findByManager(getPrincipal(), statusType);		
		model.addAttribute("tours", tourList);
		model.addAttribute("statusSelected", statusType);
		model.addAttribute("tour", new Tour());
		return "manager";
	}
	
	@RequestMapping(value = "/manager", method = RequestMethod.GET)
	public String managerPage(ModelMap model) {	
		model.addAttribute("user", getPrincipal());
		List<Tour> tourList = tourService.findByManager(getPrincipal(), "SUBMITTED");		
		model.addAttribute("tours", tourList);
		model.addAttribute("tour", new Tour());
		return "manager";
	}	

	@RequestMapping(value = "/finance", method = RequestMethod.GET)
	public String financePage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		List<Tour> tourList = tourService.findByStatusEmployee("SUBMITFINANCE");		
		model.addAttribute("tours", tourList);
		model.addAttribute("tour", new Tour());
		System.out.println("ffgfgf");
		return "finance";
	}

	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "accessDenied";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

	@RequestMapping(value = { "/addTour" }, method = RequestMethod.POST)
	public String homePageSubmit(@ModelAttribute("tour") Tour tour) {
		tourService.saveOrUpdate(tour);
		return "redirect:/";
		
	}
	
	@RequestMapping(value = { "/managerSubmit" }, method = RequestMethod.POST)
	public String managerAction(@ModelAttribute("tour") Tour tour) {
		tourService.saveOrUpdate(tour);
		return "redirect:/manager";
	}
	
	@RequestMapping(value = { "/submitFinance" }, method = RequestMethod.POST)
	public String financeAction(@ModelAttribute("tour") Tour tour) {
		tourService.saveOrUpdate(tour);
		System.out.println("ekkkk");
		return "redirect:/finance";
	}

	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

}
