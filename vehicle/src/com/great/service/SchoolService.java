package com.great.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.bean.School;
import com.great.dao.SchoolMapper;

@Service
public class SchoolService {
	@Resource
	private SchoolMapper schoolMapper;
	//驾校登录
	public School login(Map<String, Object> map) throws Exception{
		return schoolMapper.login(map);
	}
	// 驾校申请
	public boolean addSchool(School school) throws Exception {
		return schoolMapper.addSchool(school);
	}
	//驾校列表
	public List<Map> schoolList(Map<String, Object> map) throws Exception{
		return schoolMapper.schoolList(map);
	}
}
