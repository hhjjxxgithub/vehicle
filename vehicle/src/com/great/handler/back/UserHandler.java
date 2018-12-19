package com.great.handler.back;

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
import com.great.bean.Page;
import com.great.bean.User;
import com.great.service.CoachService;
import com.great.service.UserService;
import com.great.util.Result;
/**后端学员控制器
 * @author 
 *
 */
@Controller("userBackHandler")
@RequestMapping("/back/user")
public class UserHandler {
	@Resource
	private UserService userService;
	@Resource
	private CoachService coachService;
	
	/**后端学员管理
	 * @param userAccount
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/userList.handler")
	public @ResponseBody List userList() throws Exception {
		List<Map> user = userService.userList(null);
		return user;
	}
	
	/**后端学员管理删除学员
	 * @param userAccount
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteUser.handler")
	public @ResponseBody Result deleteUser(
			ModelAndView mav,Integer userId
			) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userState", 99);
		int counts = userService.deleteUser(map);
		if(counts>0){
			return Result.success("删除成功");
		}else {
			return Result.fail("删除失败");
		}
	}
	

	/**后端学员管理分配教练
	 * @param userAccount
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/allotCoach.handler")
	public @ResponseBody Result allotCoach(
			@RequestParam(value = "userId",required=true) Integer userId,
			@RequestParam(value = "coachId",required=true) Integer coachId
			) throws Exception {
		//先写教练看看
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

	/**后端学员管理分配教练获取教练列表
	 * @param schoolId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/allotCoachOne.handler")
	public @ResponseBody Result allotCoachOne(Integer userId) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		List<Map> userList = userService.userList(map);
		if(userList.size()>0){
			return Result.success(userList);
		}else {
			return Result.fail();
		}
	}
		
}
