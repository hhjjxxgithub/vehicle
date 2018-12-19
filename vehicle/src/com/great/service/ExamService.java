package com.great.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.dao.ExamMapper;

@Service
public class ExamService {
	@Resource
	private ExamMapper examMapper;
	public List<Map> examList(Map<String,Object> map) throws Exception{
		return examMapper.examList(map);
	}
}
