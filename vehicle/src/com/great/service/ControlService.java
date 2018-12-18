package com.great.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.bean.Control;
import com.great.dao.ControlMapper;

@Service
public class ControlService {
	@Resource
	private ControlMapper controlMapper;
	
	public Control login(Map<String, Object> map) throws Exception{
		return controlMapper.login(map);
	}
}
