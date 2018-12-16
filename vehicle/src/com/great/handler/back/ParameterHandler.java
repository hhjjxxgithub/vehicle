package com.great.handler.back;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.apache.logging.log4j.core.tools.picocli.CommandLine.Parameters;
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
import com.great.service.ParameterService;
import com.great.util.ParamMap;
import com.great.util.Result;
/**后台coach控制器
 * @author 
 *
 */
@Controller("backParameter")
@RequestMapping("/back/parameter")
public class ParameterHandler {
	@Resource
	private ParameterService parameterService;
	/**参数列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/parameterList.handler")
	public @ResponseBody List all() throws Exception {
		return parameterService.all();
	}
	/**存在验证
	 * @param parameterState
	 * @param parameterMark
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/exist.handler")
	public @ResponseBody Result exist(
			@RequestParam(value="parameterState",required=true) Integer parameterState,
			@RequestParam(value="parameterMark",required=true) String parameterMark
			) throws Exception {
		Parameter parameter = new Parameter();
		parameter.setParameterState(parameterState);
		parameter.setParameterMark(parameterMark);
		if(!parameterService.exist(parameter)){
			return Result.success(null);
		}else{
			return Result.fail();
		}
	}
	/**通过ID获取
	 * @param parameterId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getById.handler")
	public @ResponseBody Result getById(
			@RequestParam(value="parameterId",required=true) Integer parameterId
			) throws Exception {
		Parameter parameter = parameterService.getById(parameterId);
		if(parameter != null){
			return Result.success(parameter);
		}else{
			return Result.fail();
		}
	}
	/**添加参数
	 * @param parameter
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/add.handler")
	public @ResponseBody Result add(
			@RequestBody Parameter parameter
			) throws Exception {
		if(parameterService.add(parameter)){
			return Result.success(null);
		}else{
			return Result.fail();
		}
	}
	/**更新
	 * @param parameter
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/update.handler")
	public @ResponseBody Result update(
			@RequestBody Parameter parameter
			) throws Exception {
		if(parameterService.update(parameter)){
			return Result.success(null);
		}else{
			return Result.fail();
		}
	}
	/**删除
	 * @param parameterId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete.handler")
	public @ResponseBody Result delete(
			@RequestParam(value="parameterId",required=true) Integer parameterId
			) throws Exception {
		if(parameterService.delete(parameterId)){
			return Result.success(null);
		}else{
			return Result.fail();
		}
	}
}
