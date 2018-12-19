package com.great.bean;

import java.util.Date;
import java.util.List;

public class Period {
    private Integer periodId;

    private String levelId;

    private Integer userId;

    private Integer periodState;

    private Date periodDate;

    private String periodBegin;

    private String periodEnd;

    private String periodLength;
    

    public Integer getPeriodId() {
        return periodId;
    }

    public void setPeriodId(Integer periodId) {
        this.periodId = periodId;
    }

    public String getLevelId() {
        return levelId;
    }

    public void setLevelId(String levelId) {
        this.levelId = levelId == null ? null : levelId.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getPeriodState() {
        return periodState;
    }

    public void setPeriodState(Integer periodState) {
        this.periodState = periodState;
    }

    public Date getPeriodDate() {
        return periodDate;
    }

    public void setPeriodDate(Date periodDate) {
        this.periodDate = periodDate;
    }

    public String getPeriodBegin() {
        return periodBegin;
    }

    public void setPeriodBegin(String periodBegin) {
        this.periodBegin = periodBegin == null ? null : periodBegin.trim();
    }

    public String getPeriodEnd() {
        return periodEnd;
    }

    public void setPeriodEnd(String periodEnd) {
        this.periodEnd = periodEnd == null ? null : periodEnd.trim();
    }

    public String getPeriodLength() {
        return periodLength;
    }

    public void setPeriodLength(String periodLength) {
        this.periodLength = periodLength == null ? null : periodLength.trim();
    }

    
    
}