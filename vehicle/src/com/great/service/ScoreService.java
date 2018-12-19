package com.great.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.dao.ScoreMapper;

@Service
public class ScoreService {
	@Resource
	private ScoreMapper scoreMapper;
	public int testResult(Map<String,Object> map) throws Exception{
		return scoreMapper.testResult(map);
	}
}
