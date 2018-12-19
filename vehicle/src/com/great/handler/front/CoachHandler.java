package com.great.handler.front;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.User;
import com.great.service.CoachService;
import com.great.service.UserService;
import com.great.util.Result;

/**前端教练控制器
 * @author 
 *
 */
@Controller("coachFrontHandler")
@RequestMapping("/front/coach")
public class CoachHandler {
	@Resource
	private CoachService coachService;
	@Resource
	private UserService userService;

	/**前端教练评价获取信息
	 * @param userAccount
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/coachEvaluateOne.handler")
	public ModelAndView coachEvaluateOne(
			ModelAndView mav,HttpServletRequest req
			) throws Exception{
		User user = (User) req.getSession().getAttribute("login");
		int userId = user.getUserId().intValue();
		if(userId>0){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			List<Map> userList = userService.userList(map); 
			int schoolId = ((BigDecimal)userList.get(0).get("SCHOOL_ID")).intValue();
			map.put("schoolId", schoolId);
			List<Map> coachList = coachService.coachList(map);
			mav.addObject("userList", userList);
			mav.addObject("coachList", coachList);
			mav.setViewName("/front/coach_evaluate");
		}
		return mav;
	}
	
	/**前端报名审核分配教练获取教练列表
	 * @param schoolId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/frontAllotCoachList.handler")
	public @ResponseBody Result frontAllotCoachList(Integer schoolId) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schoolId", schoolId);
		List<Map> coachList = coachService.coachList(map);
		return Result.success(coachList);
	}
	
}
