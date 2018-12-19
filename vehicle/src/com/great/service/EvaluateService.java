package com.great.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.dao.EvaluateMapper;

@Service
public class EvaluateService {
	@Resource
	private EvaluateMapper evaluateMapper;
	public int addEvaluate(Map<String,Object> map) throws Exception{
		return evaluateMapper.addEvaluate(map);
	}
}
