package com.mw.tour.model;

public enum UserProfileType {
    EMPLOYEE("EMPLOYEE"),
    FINANCE("FINANCE"),
    MANAGER("MANAGER");
     
    String userProfileType;
     
    private UserProfileType(String userProfileType){
        this.userProfileType = userProfileType;
    }
     
    public String getUserProfileType(){
        return userProfileType;
    }
     
}