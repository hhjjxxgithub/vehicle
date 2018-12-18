package com.great.handler.back;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.great.bean.Menu;
import com.great.service.MenuService;
import com.great.util.Result;

@Controller("backMenuHandler")
@RequestMapping("/back/menu")
public class MenuHandler {
	@Resource
	private ParameterHandler parameterHandler;
	@Resource
	private MenuService menuService;
	
	/**获取菜单栏
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getMenu.handler")
	public @ResponseBody Result getMenu(
			@RequestParam(value="roleId",required=true) Integer roleId
			) throws Exception{
		Object[] array = new Object[2];
		array[0] = menuService.getParentByRole(roleId);
		array[1] = menuService.qgetByRole(roleId);
		return Result.success(array);
	}
	
	/**获取所有一级菜单
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getParent.handler")
	public @ResponseBody Result getParent() throws Exception{
		List list = menuService.getParent();
		if(list != null){
			return Result.success(list);
		}else{
			return Result.fail();
		}
	}
	
	/**菜单列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/menuList.handler")
	public @ResponseBody List menuList() throws Exception{
		return menuService.queryAll();
	}
	/**参数
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/menu.handler")
	public String subject(HttpServletRequest request) throws Exception {
		ObjectMapper o= new ObjectMapper();
		request.setAttribute("param", o.writeValueAsString(parameterHandler.getMap("menu")));
		return "forward:/WEB-INF/back/menu_list.jsp";
	}
	/**添加
	 * @param menu
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/add.handler")
	public @ResponseBody Result add(
			@RequestBody Menu menu
			) throws Exception {
		if(menuService.add(menu)){
			return Result.success(null);
		}else{
			return Result.fail();
		}
	}
	/**修改
	 * @param menuId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getById.handler")
	public @ResponseBody Result getById(
			@RequestParam(value="menuId",required=true) Integer menuId
			) throws Exception{
		Menu menu = menuService.getById(menuId);
		if(menu != null){
			return Result.success(menu);
		}else{
			return Result.fail();
		}
	}
	
	/**修改
	 * @param menu
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/update.handler")
	public @ResponseBody Result update(
			@RequestBody Menu menu
			) throws Exception {
		if(menuService.update(menu)){
			return Result.success(null);
		}else{
			return Result.fail();
		}
	}
	
	/**删除
	 * @param menuId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete.handler")
	public @ResponseBody Result delete(
			@RequestParam(value="menuId",required=true) Integer menuId
			) throws Exception{
		if(menuService.delete(menuId)){
			return Result.success(null);
		}else{
			return Result.fail();
		}
	}
}
