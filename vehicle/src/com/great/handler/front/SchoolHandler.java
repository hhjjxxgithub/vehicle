package com.great.handler.front;

import java.util.ArrayList;
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
import com.great.service.CarService;
import com.great.service.SchoolService;
import com.great.util.Result;

@Controller
@RequestMapping("/front/school")
public class SchoolHandler {
	@Resource
	private SchoolService schoolService;

	@Resource
	private CarService carService;

	// 驾校申请
	@RequestMapping(value = "/addSchool.handler")
	public @ResponseBody Result addSchool(@RequestBody School school) throws Exception {
		int flag = 0;
		flag = schoolService.addSchool(school);
		if (flag > 0) {
			return Result.success(null);
		} else {
			return Result.fail(null);
		}
	}

	// 帐号校验
	@RequestMapping(value = "/checkAccount.handler", produces = "text/html;charset=utf-8")
	public @ResponseBody String checkAccount(@RequestParam(value = "param", required = true) String schoolAccount)
			throws Exception {
		int flag = 0;
		flag = schoolService.checkAccount(schoolAccount);
		if (flag == 0) {
			return "y";
		} else {
			return "帐号已存在！请重试！";
		}
	}

	// 名称校验
	@RequestMapping(value = "/checkName.handler", produces = "text/html;charset=utf-8")
	public @ResponseBody String checkName(@RequestParam(value = "param", required = true) String schoolName)
			throws Exception {
		int flag = 0;
		flag = schoolService.checkName(schoolName);
		if (flag == 0) {
			return "y";
		} else {
			return "名称已存在！请重试！";
		}
	}

	// 营业执照校验
	@RequestMapping(value = "/checkLicense.handler", produces = "text/html;charset=utf-8")
	public @ResponseBody String checkLicense(@RequestParam(value = "param", required = true) String schoolLicense)
			throws Exception {
		int flag = 0;
		flag = schoolService.checkLicense(schoolLicense);
		if (flag == 0) {
			return "y";
		} else {
			return "营业执照已存在！请重试！";
		}
	}

	// 首页驾校列表
	@RequestMapping(value = "/schoolList.handler")
	public String schoolListByName(HttpServletRequest request, School school) throws Exception {
		String schoolName = request.getParameter("schoolName");
		school.setSchoolName(schoolName);
		List<Map<String, Object>> schoolList = schoolService.schoolListByName(school);
		request.setAttribute("schoolList", schoolList);
		return "forward:/front/school_list.jsp";
	}

}