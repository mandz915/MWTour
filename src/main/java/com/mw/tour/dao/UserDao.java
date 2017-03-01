package com.mw.tour.dao;

import com.mw.tour.model.User;;

public interface UserDao {
 
    User findById(int id);
     
    User findBySSO(String sso);
     
}
