package com.great.handler.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.great.bean.Coach;
import com.great.bean.Control;
import com.great.bean.School;
import com.great.bean.User;
import com.great.service.CoachService;
import com.great.service.ControlService;
import com.great.service.SchoolService;
import com.great.service.UserService;
import com.great.util.Result;
import com.sun.org.glassfish.gmbal.ParameterNames;

/**
 * 前台登录控制器
 * 
 * @author
 *
 */
@Controller
@RequestMapping("/front/login")
public class LoginHandler {
	@Resource
	private UserService userService;
	@Resource
	private CoachService coachService;
	@Resource
	private SchoolService schoolService;
	@Resource
	private ControlService controlService;

	/**
	 * 前端登录 s+a+j
	 * 
	 * @param userAccount
	 * @param userPwd
	 * @param roleId
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/frontLogin.handler")
	public @ResponseBody Result frontLogin(@RequestParam(value = "userAccount", required = true) String userAccount,
			@RequestParam(value = "userPwd", required = true) String userPwd, Integer roleId, HttpSession session)
			throws Exception {
		// 先写教练看看
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("account", userAccount);
		map.put("pwd", userPwd);
		if (roleId == 1) {
			User user = userService.login(map);
			return select(user, session);
		} else if (roleId == 2) {
			Coach coach = coachService.login(map);
			return select(coach, session);
		} else if (roleId == 3) {
			School school = schoolService.login(map);
			return select(school, session);
		} else if (roleId == 4) {
			Control control = controlService.login(map);
			return select(control, session);
		}
		return Result.fail();
	}

	private Result select(Object object, HttpSession session) {
		if (object != null) {
			session.setAttribute("login", object);
			return Result.success("登录成功");
		} else {
			return Result.fail("账户密码错误");
		}
	}
	@RequestMapping(value = "/exit.handler")
	public @ResponseBody Result exit(HttpSession session) throws Exception {
		session.invalidate();
		return Result.success(null);
	}
}
