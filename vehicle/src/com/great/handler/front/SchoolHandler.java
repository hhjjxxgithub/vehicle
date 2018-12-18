package com.great.handler.front;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.great.bean.School;
import com.great.service.SchoolService;
import com.great.util.Result;

@Controller("frontSchool")
@RequestMapping("/front/school")
public class SchoolHandler {
	@Resource
	private SchoolService schoolService;

	@RequestMapping(value = "/addSchool.handler")
	public @ResponseBody Result addSchool(@RequestBody School school) throws Exception {
		boolean flag = false;
		flag = schoolService.addSchool(school);
		if (flag == true) {
			return Result.success(null);
		} else {
			return Result.fail(null);
		}
	}

}
