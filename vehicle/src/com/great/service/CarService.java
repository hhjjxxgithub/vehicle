package com.great.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.dao.CarMapper;

@Service
public class CarService {

	@Resource
	private CarMapper carMapper;

	// 教练车数量
	public int carCount(int schoolId) throws Exception {
		return carMapper.carCount(schoolId);
	}

}
