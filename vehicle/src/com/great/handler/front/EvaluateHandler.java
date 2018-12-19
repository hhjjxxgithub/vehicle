package com.great.handler.front;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.great.service.EvaluateService;
import com.great.util.Result;

/**前端教练评价控制器
 * @author 
 *
 */
@Controller
@RequestMapping("/front/evaluate")
public class EvaluateHandler {
	@Resource
	private EvaluateService evaluateService;
	
	/**前端教练评价
	 * @param context
	 * @param userId
	 * @param coachId
	 * @param schoolId
	 * @return
	 */
	@RequestMapping(value = "/coachEvaluate.handler")
	public @ResponseBody Result coachEvaluate(
			@RequestParam(value = "context",required=true) String context,
			@RequestParam(value = "userId",required=true) Integer userId,
			@RequestParam(value = "coachId",required=true) Integer coachId,
			@RequestParam(value = "schoolId",required=true) Integer schoolId,
			@RequestParam(value = "state",required=true) Integer state
			) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		if(state==2){
			map.put("userId", 0);
		}else {
			map.put("userId", userId);
		}
		map.put("evaluateContent", context);
		map.put("coachId", coachId);
		map.put("schoolId", schoolId);
		int count = evaluateService.addEvaluate(map);
		if(count>0){
			return Result.success("评价提交成功");
		}else{
			return Result.fail("提交失败，请重新提交");
		}
	}
}
