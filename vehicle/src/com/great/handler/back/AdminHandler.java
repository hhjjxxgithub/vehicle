package com.great.handler.back;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.tomcat.jni.File;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.great.service.CoachService;
import com.great.util.Result;
/**后台admin控制器
 * @author 
 *
 */
@Controller("backAdmin")
@RequestMapping("/back/admin")
public class AdminHandler {
	
	/** 后台用户登录  读取admin.xml 文件
	 * @param adminName
	 * @param adminPwd
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/adminLogin.handler")
	public @ResponseBody Result adminLogin(
			@RequestParam(value = "adminName",required=true) String adminName,
			@RequestParam(value = "adminPwd",required=true) String adminPwd,
			HttpServletRequest request
			) throws Exception {
		InputStream is = this.getClass().getResourceAsStream("/adminConfig.xml");
		Document document = new SAXReader().read(is);
		Element root = document.getRootElement();
		Element admins = (Element) root.elementIterator("admins").next();
		Iterator iterator =  admins.elementIterator("admin");
		while(iterator.hasNext()){
			Element action = (Element) iterator.next();
			String name = action.attributeValue("name");
			String pwd = action.attributeValue("pwd");
			if(adminName.equals(name) && adminPwd.equals(pwd)){
				request.getSession().setAttribute("admin", adminName);
				return Result.success(null);
			}
		}
		return Result.fail("账户密码错误");
	}
	
}
