package com.great.handler.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.great.bean.School;
import com.great.bean.User;
import com.great.service.UserService;
import com.great.util.Result;
/**前端学员控制器
 * @author 
 *
 */
@Controller("userFrontHandler")
@RequestMapping("/front/user")
public class UserHandler {
	@Resource
	private UserService userService;
	
	/**学员注册 s+a+j
	 * @param userAccount
	 * @param userPwd
	 * @param roleId
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/userAdd.handler")
	public @ResponseBody Result userAdd(
			@RequestBody User user,
			HttpSession session
			) throws Exception {
		//先写教练看看
		int count = userService.userAdd(user);
		if(count>0){
			return Result.success("注册成功");
		}else {
			return Result.fail("注册失败");
		}
	}
	
	/**前端用户注册用户名检测
	 * @param userAccount
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/checkAccount.handler",produces="text/html;charset=utf-8")
	public @ResponseBody String checkAccount(
			@RequestParam(value = "param",required=true) String userAccount
			) throws Exception {
		int count = userService.checkAccount(userAccount);
		if(count>0){
			return "已被使用";
		}else {
			return "y";
		}
	}
	
	/**前端报名审核列表
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/userEnroll.handler")
public @ResponseBody  List userEnroll(HttpServletRequest req) throws Exception{
		School school = (School) req.getSession().getAttribute("login");
		int schoolId = school.getSchoolId().intValue();
		Map<String,Object> map = new HashMap<>();
		map.put("schoolId", schoolId);
		map.put("userState", 1);
		List<Map> enrollList = userService.userEnroll(map);
		return enrollList;
	}
	
	/**前端分配教练的学员信息
	 * @param schoolId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/frontAllot.handler")
	public @ResponseBody Result frontAllot(Integer userId) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		List<Map> userList = userService.userList(map);
		if(userList.size()>0){
			return Result.success(userList);
		}else {
			return Result.fail();
		}
	}
	
	/**前端学员报名审核的分配教练
	 * @param userId
	 * @param schoolId
	 * @param coachId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/frontAllotCoach.handler")
	public @ResponseBody Result frontAllotCoach(
			Integer userId,Integer coachId
			) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("coachId", coachId);
		int count = userService.deleteUser(map);
		if(count>0){
			return Result.success("分配成功");
		}else {
			return Result.fail("分配失败");
		}
	}
	
	/**前端报名审核通过
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/enrollPass.handler")
	public @ResponseBody Result enrollPass(
			Integer userId
			) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userState", 2);
		int count = userService.deleteUser(map);
		if(count>0){
			return Result.success("审核通过");
		}else {
			return Result.fail("审核失败，请重新审核");
		}
	}
	
	
}
