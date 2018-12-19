package com.great.handler.front;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.great.bean.User;
import com.great.service.ScoreService;
import com.great.util.Result;

/**后台coach控制器
 * @author 
 *
 */
@Controller
@RequestMapping("/front/score")
public class ScoreHandler {
	@Resource
	private ScoreService scoreService;
	
	@RequestMapping(value = "/testResult.handler")
	public @ResponseBody Result testResult(
			HttpServletRequest req,@RequestParam(value = "score",required=true) Integer score
			) throws Exception{
		User user = (User) req.getSession().getAttribute("login");
		int levelId = user.getUserLevel().intValue();
		int userId = user.getUserId().intValue();
		Map<String,Object> map = new HashMap<>();
		map.put("score", score);
		map.put("levelId", levelId);
		map.put("userId", userId); 
		int count = scoreService.testResult(map);
		if(count>0){
			return Result.success("考试提交成功");
		}else{
			return Result.fail("考试提交失败");
		}
	}
}
