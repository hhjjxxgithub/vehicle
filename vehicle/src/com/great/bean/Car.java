package com.great.bean;

import java.util.Date;
import java.util.List;

public class Car {
    private Integer carId;

    private String carNum;

    private Integer carState;

    private Date carDate;

    private Integer schoolId;

    private Integer coachId;
    

    public Integer getCarId() {
        return carId;
    }

    public void setCarId(Integer carId) {
        this.carId = carId;
    }

    public String getCarNum() {
        return carNum;
    }

    public void setCarNum(String carNum) {
        this.carNum = carNum == null ? null : carNum.trim();
    }

    public Integer getCarState() {
        return carState;
    }

    public void setCarState(Integer carState) {
        this.carState = carState;
    }

    public Date getCarDate() {
        return carDate;
    }

    public void setCarDate(Date carDate) {
        this.carDate = carDate;
    }

    public Integer getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }

    public Integer getCoachId() {
        return coachId;
    }

    public void setCoachId(Integer coachId) {
        this.coachId = coachId;
    }

    
    
}