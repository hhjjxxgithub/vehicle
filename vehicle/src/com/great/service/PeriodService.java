package com.great.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.bean.Period;
import com.great.dao.PeriodMapper;

@Service
public class PeriodService {
	@Resource
	private PeriodMapper periodMapper;
	
	public List<Map> userTime(Map<String, Object> map) throws Exception{
		return periodMapper.userTime(map);
	}
}
