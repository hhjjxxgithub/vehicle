package com.great.dao;

import java.util.List;
import java.util.Map;

import com.great.bean.Coach;
import com.great.bean.Subject;


public interface SubjectMapper {
	public int upload(Map map) throws Exception;
	public int add (Subject subject) throws Exception;
	public int update (Subject subject) throws Exception;
	public int delete (Integer subjectId) throws Exception;
	public int reset (Integer subjectId) throws Exception;
	public List queryAll() throws Exception;
	public Subject getById(Integer subjectId) throws Exception;
	public List<Map> subjectOne(int levelId) throws Exception;
}