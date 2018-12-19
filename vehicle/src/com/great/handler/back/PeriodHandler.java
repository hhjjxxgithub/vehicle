package com.great.handler.back;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.great.bean.Period;
import com.great.service.PeriodService;
import com.great.util.Result;

/**后端学时控制器
 * @author 
 *
 */
@Controller("periodBackHandler")
@RequestMapping("/back/period")
public class PeriodHandler {
	@Resource
	private PeriodService periodService;
	/**后端学员管理查看学员学时
	 * @param userAccount
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/studyTime.handler")
	public @ResponseBody Result  seeTime(Integer userId) throws Exception{
		Map<String,Object> map = new HashMap<>();
		map.put("userId", userId);
		List<Map> list = periodService.userTime(map);
		return Result.success(list);
	}
}
