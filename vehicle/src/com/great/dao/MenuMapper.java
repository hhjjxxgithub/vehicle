package com.great.dao;

import java.util.List;

import com.great.bean.Menu;

public interface MenuMapper {
	public List queryAll() throws Exception;
	public List getByRole(Integer roleId) throws Exception;
	public List getParentByRole(Integer roleId) throws Exception;
	public List getParent() throws Exception;
	public Menu getById(Integer menuId) throws Exception;
	public int add (Menu menu) throws Exception;
	public int update (Menu menu) throws Exception;
	public int delete (Integer menuId) throws Exception;
	
}