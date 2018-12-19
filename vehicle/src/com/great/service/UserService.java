package com.great.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.bean.User;
import com.great.dao.UserMapper;

@Service
public class UserService {
	@Resource
	private UserMapper userMapper;
	//前端用户登录
	public User login(Map<String, Object> map) throws Exception{
		return userMapper.login(map);
	}
	//前端学员注册
	public int userAdd(User user)throws Exception{
		return userMapper.userAdd(user);
	}
	//前端学员注册账号检查
	public int checkAccount(String userAccount) throws Exception{
		return userMapper.checkAccount(userAccount);
	}
	//后端学员管理学员列表
	public List<Map> userList(Map<String, Object> map) throws Exception{
		return userMapper.userList(map);
	}
	//后端学员管理删除学员
	public int deleteUser(Map<String, Object> map) throws Exception{
		 return userMapper.deleteUser(map);
	}
	//学员报名申请
	public List<Map> userEnroll(Map<String, Object> map) throws Exception{
		return userMapper.userEnroll(map);
	} 
}
