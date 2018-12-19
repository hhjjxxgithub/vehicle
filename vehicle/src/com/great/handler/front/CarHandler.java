package com.great.handler.front;

import java.math.BigDecimal;
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
import com.great.bean.Car;
import com.great.bean.Page;
import com.great.bean.School;
import com.great.bean.User;
import com.great.service.CarService;
import com.great.util.Result;

/**前端教练车
 * @author 
 *
 */
@Controller
@RequestMapping("/front/car")
public class CarHandler {
	@Resource
	private CarService carService;
	
	
	/**前端驾校教练车查看
	 * @param userAccount
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/carList.handler")
	public @ResponseBody Result carList(
			@RequestParam(value = "schoolId",required=true) Integer schoolId
			) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schoolId", schoolId);
		List<Map> carList =  carService.carList(map);
		return Result.success(carList);
	}
}
