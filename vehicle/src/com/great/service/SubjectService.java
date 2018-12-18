package com.great.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.dao.SubjectMapper;

@Service
public class SubjectService {
	@Resource
	private SubjectMapper subjectMapper;
	
	public List<Map> subjectOne(int levelId) throws Exception{
		return subjectMapper.subjectOne(levelId);
	}
}
