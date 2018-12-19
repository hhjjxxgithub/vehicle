package com.great.handler.back;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.Car;
import com.great.bean.School;
import com.great.service.SchoolService;
import com.great.util.Result;

@Controller
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
	
	/**后端教练车管理添加教练车的驾校列表
	 * @param userAccount
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/schoolList.handler")
	public ModelAndView carList(
			ModelAndView mav
			) throws Exception {
		List<Map> schoolList =  schoolService.schoolList(null);
		mav.getModel().put("schoolList", schoolList);
		mav.setViewName("back/car_add");;
		return mav;
	}
	

}
