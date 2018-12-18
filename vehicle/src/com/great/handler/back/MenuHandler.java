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
}
