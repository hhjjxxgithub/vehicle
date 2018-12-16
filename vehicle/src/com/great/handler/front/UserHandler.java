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

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.great.bean.User;
import com.great.service.UserService;
import com.great.util.Result;
/**学员控制器
 * @author 
 *
 */
@Controller("frontUser")
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
	
	/**用户名检测
	 * @param userAccount
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/checkAccount.handler")
	public @ResponseBody Result checkAccount(
			@RequestParam(value = "userAccount",required=true) String userAccount
			) throws Exception {
		int count = userService.checkAccount(userAccount);
		if(count>0){
			return Result.success("注册成功");
		}else {
			return Result.fail("注册失败");
		}
	}
	
	/**学员管理
	 * @param userAccount
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/userList.handler")
	public ModelAndView userList(
			ModelAndView mav,Integer now
			) throws Exception {
		now = now == 0?1:now;
		int start = (now-1)*5;
		int end =  now*5;
		List<User> user = userService.userList(null);
		PageHelper.startPage(now, 5);//5是条数
		PageInfo p = new PageInfo(user);
		int count = p.getSize();
//		Page page = new Page(count,now, user);
//		mav.getModel().put("page", page);
		mav.setViewName("/back/user_list");
		return mav;
	}
	
	@RequestMapping(value = "/deleteUser.handler")
	public ModelAndView deleteUser(
			ModelAndView mav,Integer now,Integer userId
			) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userState", 99);
		int counts = userService.deleteUser(map);
		if(counts>0){
			now = now == 0?1:now;
			int start = (now-1)*5;
			int end =  now*5;
			List<User> user = userService.userList(null);
			PageHelper.startPage(now, 5);//5是条数
			PageInfo p = new PageInfo(user);
			int count = p.getSize();
//			Page page = new Page(count,now, user);
//			mav.getModel().put("page", page);
			mav.setViewName("/back/user_list");
			return mav;
		}else {
			mav.setViewName("/back/user_list");
			return mav;
		}
		
	}
}
