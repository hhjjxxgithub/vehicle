package com.great.dao;

import java.util.List;
import java.util.Map;

import com.great.bean.Coach;

public interface CoachMapper {
	public Coach login(Map<String,Object> map) throws Exception;
	public List<Map> queryAll() throws Exception;
	public Coach getById(Integer coachId) throws Exception;
	public int accountExist (String coachAccount) throws Exception;
	public int cardExist (String coachCard) throws Exception;
	public int add (Coach coach) throws Exception;
	public int update (Coach coach) throws Exception;
	public int delete (Integer coachId) throws Exception;
}