package com.great.handler.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.great.bean.Menu;
import com.great.service.MenuService;
import com.great.util.Result;

@Controller("frontMenuHandler")
@RequestMapping("/front/menu")
public class MenuHandler {
	@Resource
	private MenuService menuService;
	@RequestMapping("/getMenu.handler")
	public @ResponseBody Result getMenu(HttpSession session) throws Exception{
		if(session.getAttribute("login") == null ){
			return Result.fail();
		}else{
			return Result.success(menuService.getFrontMenu((Integer)session.getAttribute("roleId")));
		}
	}
}
