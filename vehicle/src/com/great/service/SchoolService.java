package com.great.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.bean.School;
import com.great.dao.SchoolMapper;

@Service
public class SchoolService {
	@Resource
	private SchoolMapper schoolMapper;

	/**
	 * 驾校登录
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public School login(Map<String, Object> map) throws Exception {
		return schoolMapper.login(map);
	}

	// 驾校申请
	public int addSchool(School school) throws Exception {
		return schoolMapper.addSchool(school);
	}

	// 驾校列表
	public List<Map<String, Object>> schoolList() throws Exception {
		return schoolMapper.schoolList();
	}

	// 校验帐号
	public int checkAccount(String schoolAccount) throws Exception {
		return schoolMapper.checkAccount(schoolAccount);
	}

	// 校验帐号
	public int checkName(String schoolName) throws Exception {
		return schoolMapper.checkName(schoolName);
	}

	// 校验帐号
	public int checkLicense(String schoolLicense) throws Exception {
		return schoolMapper.checkLicense(schoolLicense);
	}

	// 驾校审核修改状态
	public int updateState(School school) throws Exception {
		return schoolMapper.updateState(school);
	}

	// 首页查询驾校
	public List<Map<String, Object>> schoolListByName(School school) throws Exception {
		return schoolMapper.schoolListByName(school);
	}

	// 已开通驾校列表
	public List<Map<String, Object>> openingSchool() throws Exception {
		return schoolMapper.openingSchool();
	}
}
