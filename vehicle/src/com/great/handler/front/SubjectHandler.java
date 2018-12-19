package com.great.handler.front;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.great.bean.Page;
import com.great.bean.User;
import com.great.service.SubjectService;

/**前台科目控制器
 * @author 
 *
 */
@Controller
@RequestMapping("/front/subject")
public class SubjectHandler {
	@Resource
	private SubjectService subjectService;
	
	/**前端用户科目一考试
	 * @param userAccount
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/subjectOne.handler")
	public ModelAndView subjectOne(ModelAndView mav,HttpServletRequest req,Integer now) throws Exception {
//		User user = (User) req.getSession().getAttribute("login");
//		int levelId = user.getUserLevel().intValue();
		int levelId = 20;
		if(levelId==20){
			List<Map> subjectList = subjectService.subjectOne(levelId);
			now = now == 0?1:now;
			PageHelper.startPage(now, 10);//10是条数
			PageInfo p = new PageInfo(subjectList);
			int count = p.getSize();
			Page page = new Page(count,now, subjectList);
			mav.addObject("page", page);
			mav.setViewName("/front/one_test");
		}else {
			mav.setViewName("/front/500");
		}
		return mav;
	}
	

}
