package com.great.dao;

import java.util.List;
import java.util.Map;

import com.great.bean.School;

public interface SchoolMapper {
	//驾校申请
	public boolean addSchool(School school)throws Exception;
	public School login(Map<String, Object> map) throws Exception;
	public List<Map> schoolList(Map<String, Object> map) throws Exception;
}