package com.great.handler.back;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.great.bean.Coach;
import com.great.bean.Parameter;
import com.great.service.CoachService;
import com.great.util.ParamMap;
import com.great.util.Result;
/**后台coach控制器
 * @author 
 *
 */
@Controller("backCoach")
@RequestMapping("/back/coach")
public class CoachHandler {
	@Resource
	private CoachService coachService;
	@Resource
	private ParamMap paramMap;
	/**查询教练列表
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/coachList.handler")
	public String coachList(HttpServletRequest request) throws Exception {
//		request.setAttribute("coachList",coachService.queryAll());
//		request.setAttribute("param",paramMap.getMap("coach"));
		ObjectMapper o= new ObjectMapper();
		request.setAttribute("param", o.writeValueAsString(paramMap.getMap("coach")));
		return "forward:/WEB-INF/back/coach_list.jsp";
	}
	@RequestMapping(value = "/getBySchool.handler")
	public @ResponseBody List getBySchool() throws Exception {
		return coachService.queryAll();
	}
	/**通过ID获取信息
	 * @param coachId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getById.handler")
	public @ResponseBody Result getById(
			@RequestParam(value="coachId",required=true) Integer coachId
			) throws Exception {
		Coach coach = coachService.getById(coachId);
		if(coach != null){
			return Result.success(coach);
		}else{
			return Result.fail();
		}
	}
	
	/**账户存在校验
	 * @param coachAccount
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/accountExist.handler",produces="text/html;charset=utf-8")
	public @ResponseBody String accountExist(
			@RequestParam(value="param",required=true) String coachAccount
			) throws Exception {
		if(!coachService.accountExist(coachAccount)){
			return "y";
		}else{
			return "账户已经存在";
		}
	}
	/**身份证存在验证
	 * @param coachCard
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/cardExist.handler",produces="text/html;charset=utf-8")
	public @ResponseBody String cardExist(
			@RequestParam(value="param",required=true) String coachCard
			) throws Exception {
		if(!coachService.cardExist(coachCard)){
			return "y";
		}else{
			return "身份证已经存在";
		}
	}
	/**新增教练
	 * @param coach
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/add.handler")
	public @ResponseBody Result add(
			@RequestBody Coach coach
			) throws Exception {
		if(coachService.add(coach)){
			return Result.success(null);
		}else{
			return Result.fail();
		}
	}
	/**更新
	 * @param coach
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/update.handler")
	public @ResponseBody Result update(
			@RequestBody Coach coach
			) throws Exception {
		if(coachService.update(coach)){
			return Result.success(null);
		}else{
			return Result.fail();
		}
	}
	@RequestMapping(value = "/delete.handler")
	public @ResponseBody Result delete(
			@RequestParam(value="coachId",required=true) Integer coachId
			) throws Exception {
		if(coachService.delete(coachId)){
			return Result.success(null);
		}else{
			return Result.fail();
		}
	}
}
