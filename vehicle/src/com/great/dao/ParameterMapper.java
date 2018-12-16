package com.great.dao;

import java.util.List;
import java.util.Map;

import com.great.bean.Parameter;


public interface ParameterMapper {
	public List<Parameter> queryAll(String mark) throws Exception;
	public List<Parameter> all() throws Exception;
	public int exist(Parameter parameter) throws Exception;
	public Parameter getById(Integer parameterId) throws Exception;
	public int add(Parameter parameter) throws Exception;
	public int update(Parameter parameter) throws Exception;
	public int delete(Integer parameterId) throws Exception;
}