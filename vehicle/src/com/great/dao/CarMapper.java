package com.great.dao;

import java.util.List;
import java.util.Map;

import com.great.bean.Car;

public interface CarMapper {
	public List<Map> carList(Map<String,Object> map) throws Exception;
	public int deleteCar(Map<String,Object> map) throws Exception;
	public int carAdd(Car car) throws Exception;
}