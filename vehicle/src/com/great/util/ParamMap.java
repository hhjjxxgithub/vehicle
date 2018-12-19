package com.great.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.great.bean.Parameter;
import com.great.service.ParameterService;

/**携带参数的对象
 * @author 
 *
 */
public class ParamMap {
	
	private Map map = new HashMap<>();
	@Resource
	private  ParameterService parameterService;
	
	public  Map getMap(String mark) {
		if(map.get(mark) == null){
			map.put(mark, initMap(mark));
		}
		return (Map) map.get(mark);
	}

	/**
	 * 重新加载参数
	 */
	public  void reInit(String mark){
		map.put(mark, initMap(mark));
	}
	
	/**
	 *加载参数表至内存
	 */
	private Map initMap(String mark){
		try {
			List<Parameter> list = parameterService.queryAll(mark);
			Map m = new HashMap<>();
			for(Parameter p: list){
				m.put(p.getParameterState(),p.getParameterName());
			}
			return m;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
