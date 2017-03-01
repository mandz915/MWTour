package com.mw.tour.service;

import com.mw.tour.model.User;

public interface UserService {
	 
    User findById(int id);
     
    User findBySso(String sso);
    
}
  
