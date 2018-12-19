package com.great.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.bean.Car;
import com.great.dao.CarMapper;

@Service
public class CarService {
	@Resource
	private CarMapper carMapper;
	public List<Map> carList(Map<String,Object> map) throws Exception{
		return carMapper.carList(map);
	}
	public int deleteCar(Map<String,Object> map) throws Exception{
		return carMapper.deleteCar(map);
	}
	public int carAdd(Car car) throws Exception{
		return carMapper.carAdd(car);
	}
}
