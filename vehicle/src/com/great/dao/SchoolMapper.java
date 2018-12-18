package com.great.dao;

import java.util.List;
import java.util.Map;

import com.great.bean.School;

public interface SchoolMapper {
	// 驾校申请
	public int addSchool(School school) throws Exception;

	// 驾校登录
	public School login(Map<String, Object> map) throws Exception;

	// 无条件驾校列表
	public List<Map<String, Object>> schoolList() throws Exception;

	// 校验帐号
	public int checkAccount(String schoolAccount) throws Exception;

	// 校验名称
	public int checkName(String schoolName) throws Exception;

	// 校验营业执照
	public int checkLicense(String schoolLicense) throws Exception;

	// 驾校审核修改状态
	public int updateState(School school) throws Exception;

	// 首页查询驾校
	public List<Map<String, Object>> schoolListByName(School school) throws Exception;

	// 已开通驾校列表
	public List<Map<String, Object>> openingSchool() throws Exception;
}