package com.great.dao;

import java.util.List;
import java.util.Map;

import com.great.bean.Subject;

public interface SubjectMapper {
	public List<Map> subjectOne(int levelId) throws Exception;
}