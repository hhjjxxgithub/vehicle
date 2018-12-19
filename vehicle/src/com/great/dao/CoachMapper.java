package com.great.dao;

import java.util.List;
import java.util.Map;

import com.great.bean.Coach;

public interface CoachMapper {
	public Coach login(Map<String,Object> map) throws Exception;
	public List<Map> queryAll() throws Exception;
	public List<Map> coachList(Map<String,Object> map) throws Exception;
	
}