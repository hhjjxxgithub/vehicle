package com.great.handler.back;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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

/**后端教练车
 * @author 
 *
 */
@Controller("carBackHandler")
@RequestMapping("/back/car")
public class CarHandler {
	@Resource
	private CarService carService;
	
	
	/**后端教练车管理
	 * @param userAccount
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/carList.handler")
	public ModelAndView carList(
			ModelAndView mav
			) throws Exception {
		List<Map> carList =  carService.carList(null);
		mav.getModel().put("carList", carList);
		mav.setViewName("back/car_back");;
		return mav;
	}
	

	/**后端教练车管理删除教练车
	 * @param userAccount
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteCar.handler")
	public ModelAndView deleteCar(
			ModelAndView mav,Integer carId
			) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("carId", carId);
		map.put("carState", 99);
		int counts = carService.deleteCar(map);
		if(counts>0){
			List<Map> carList =  carService.carList(null);
			mav.getModel().put("carList", carList);
			mav.setViewName("back/car_back");
			return mav;
		}else {
			mav.setViewName("back/car_back");
			return mav;
		}
	}
	
	@RequestMapping(value = "/carAdd.handler")
	public @ResponseBody Result carAdd(
			@RequestBody Car car
			) throws Exception {
		//先写教练看看
		int count = carService.carAdd(car);
		if(count>0){
			return Result.success("注册成功");
		}else {
			return Result.fail("注册失败");
		}
	}
}
