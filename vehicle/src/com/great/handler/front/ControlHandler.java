package com.great.handler.front;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.School;
import com.great.service.SchoolService;
import com.great.util.Result;

import freemarker.core.ReturnInstruction.Return;

@Controller
@RequestMapping("/front/control")
public class ControlHandler {
	@Resource
	private SchoolService schoolService;

	// 驾校审核列表
	@RequestMapping(value = "/schoolList.handler")
	public ModelAndView schoolList(ModelAndView mv) throws Exception {
		List<Map<String, Object>> schoolList = schoolService.schoolList();
		mv.addObject("schoolList", schoolList);
		mv.setViewName("front/school_add_check");
		return mv;
	}

	// 驾校审核
	@RequestMapping(value = "/updateState.handler")
	public String updateState(HttpServletRequest request) throws Exception {
		int schoolId = Integer.parseInt(request.getParameter("schoolId"));
		int schoolState = Integer.parseInt(request.getParameter("schoolState"));
		School school = new School();
		school.setSchoolId(schoolId);
		school.setSchoolState(schoolState);
		int flag = 0;
		flag = schoolService.updateState(school);
		if (flag > 0) {
			return "forward:/front/control/schoolList.handler";
		} else {
			return null;
		}
	}

	// 驾校处罚列表
	@RequestMapping(value = "/schoolPunishList.handler")
	public ModelAndView schoolPunishList(ModelAndView mv) throws Exception {
		List<Map<String, Object>> schoolList = schoolService.openingSchool();
		mv.addObject("schoolList", schoolList);
		mv.setViewName("front/school_punish");
		return mv;
	}

	// 驾校处罚
	@RequestMapping(value = "/updatePunishState.handler")
	public @ResponseBody Result updatePunishState(HttpServletRequest request,
			@RequestParam(value = "schoolId", required = true) int schoolId,
			@RequestParam(value = "schoolState", required = true) int schoolState) throws Exception {
		School school = new School();
		school.setSchoolId(schoolId);
		school.setSchoolState(schoolState);
		int flag = 0;
		flag = schoolService.updateState(school);
		if (flag > 0) {
			return Result.success("操作成功！");
		} else {
			return Result.fail("操作失败，请重试！");
		}
	}
}
