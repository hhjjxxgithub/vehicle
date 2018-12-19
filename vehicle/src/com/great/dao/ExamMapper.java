package com.great.dao;

import java.util.List;
import java.util.Map;

import com.great.bean.Exam;

public interface ExamMapper {
	public List<Map> examList(Map<String,Object> map) throws Exception;
}