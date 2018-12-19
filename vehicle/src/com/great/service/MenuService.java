package com.great.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.bean.Menu;
import com.great.dao.MenuMapper;
@Service
public class MenuService {
	@Resource 
	private MenuMapper menuMapper;
	/**查询二级菜单
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	public List qgetByRole(Integer roleId) throws Exception{
		return menuMapper.getByRole(roleId);
	}
	/**查询一级菜单
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	public List getParentByRole(Integer roleId) throws Exception{
		return menuMapper.getParentByRole(roleId);
	}
	/**获取所有一级菜单
	 * @return
	 * @throws Exception
	 */
	public List getParent() throws Exception{
		return menuMapper.getParent();
	}
	/**查询所有
	 * @return
	 * @throws Exception
	 */
	public List queryAll() throws Exception{
		return menuMapper.queryAll();
	}
	/**通过id获取
	 * @param menuId
	 * @return
	 * @throws Exception
	 */
	public Menu getById(Integer menuId) throws Exception{
		return menuMapper.getById(menuId);
	}
	/**添加
	 * @param menu
	 * @return
	 * @throws Exception
	 */
	public boolean add (Menu menu) throws Exception{
		return menuMapper.add(menu) > 0;
	}
	/**更新
	 * @param menu
	 * @return
	 * @throws Exception
	 */
	public boolean update (Menu menu) throws Exception{
		return menuMapper.update(menu) > 0;
	}
	/**删除
	 * @param menuId
	 * @return
	 * @throws Exception
	 */
	public boolean delete (Integer menuId) throws Exception{
		return menuMapper.delete(menuId) > 0;
	}
	
	public List getFrontMenu(Integer menuId) throws Exception{
		return menuMapper.getFrontMenu(menuId);
	}
}
