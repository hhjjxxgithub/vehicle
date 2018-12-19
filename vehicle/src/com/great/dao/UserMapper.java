package com.great.dao;

import java.util.List;
import java.util.Map;

import com.great.bean.User;

public interface UserMapper {
    public User login(Map<String, Object> map) throws Exception;
    public int userAdd(User user)throws Exception;
    public int checkAccount(String userAccount) throws Exception;
    public List<Map> userList(Map<String, Object> map) throws Exception;
    public int deleteUser(Map<String, Object> map) throws Exception;
    public List<Map> userEnroll(Map<String, Object> map) throws Exception;
}