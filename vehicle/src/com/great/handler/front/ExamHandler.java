package com.great.handler.front;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.User;
import com.great.service.ExamService;

/**前端考试情况控制器
 * @author 
 *
 */
@Controller
@RequestMapping("/front/exam")
public class ExamHandler {
	@Resource
	private ExamService examService;
	
	//学员门户考试情况
	@RequestMapping(value = "/examDetail.handler")
	public ModelAndView examDetail(ModelAndView mav,HttpServletRequest req) throws Exception {
		User user = (User) req.getSession().getAttribute("login");
		int userId = user.getUserId().intValue();
		Map<String,Object> map = new HashMap<>();
		map.put("userId", userId);
		List<Map> examList = examService.examList(map);
		mav.addObject("examList", examList);
		mav.setViewName("/front/exam_detail");
		return mav;
	}
}
