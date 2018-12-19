package com.great.handler.front;

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

@Controller("schoolFrontHandler")
@RequestMapping("/back/school")
public class SchoolHandler {
	@Resource
	private SchoolService schoolService;

	
	/**前端教练车查看教练车的驾校列表
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
		mav.setViewName("/front/car_see");
		return mav;
	}
	

}
