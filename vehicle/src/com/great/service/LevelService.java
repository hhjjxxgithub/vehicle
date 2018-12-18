package com.great.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.bean.Level;
import com.great.dao.LevelMapper;

@Service
public class LevelService {
	@Resource
	private  LevelMapper levelMapper;
	/**查询所有科目
	 * @return
	 * @throws Exception
	 */
	public List queryAll() throws Exception{
		return levelMapper.queryAll();
	}
}
