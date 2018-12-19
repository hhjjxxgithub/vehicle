package com.great.dao;

import java.util.List;
import java.util.Map;

import com.great.bean.Period;

public interface PeriodMapper {
	public List<Map> userTime(Map<String,Object> map) throws Exception;
}