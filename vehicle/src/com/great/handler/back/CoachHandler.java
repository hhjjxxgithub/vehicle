package com.great.handler.back;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.great.bean.Page;
import com.great.bean.User;
import com.great.service.CoachService;
import com.great.util.Result;
/**后台coach控制器
 * @author 
 *
 */
@Controller
@RequestMapping("/back/coach")
public class CoachHandler {
	@Resource
	private CoachService coachService;
	@RequestMapping(value = "/coachList.handler")
	public String adminLogin(HttpServletRequest request) throws Exception {
		request.setAttribute("coachList",coachService.queryAll());
		return "forward:/WEB-INF/back/coach_list.jsp";
	}
	
	/**后端教练车添加教练列表
	 * @param userAccount
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/coachAddList.handler")
	public @ResponseBody Result coachAddList(
			@RequestParam(value = "schoolId",required=true) Integer schoolId
			) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schoolId", schoolId);
		List<Map> coachAddList = coachService.coachList(map);
		return Result.success(coachAddList);
	}
	
	/**后端学员管理分配教练获取教练列表
	 * @param schoolId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/frontAllotCoach.handler")
	public @ResponseBody Result frontAllotCoach(Integer schoolId) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schoolId", schoolId);
		List<Map> coachList = coachService.coachList(map);
		return Result.success(coachList);
	}
	
	
}
