package com.great.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**后台转发拦截器 
 * @author 
 *
 */
public class BackGo extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        if(request.getSession().getAttribute("admin") != null){
            String path = request.getServletPath();
            String jsp = path.substring(path.lastIndexOf("/")+1,path.indexOf("."));
            request.getRequestDispatcher("/WEB-INF/back/"+jsp+".jsp").forward(request,response);
//        }else {
//            request.getRequestDispatcher("/admin_login.jsp").forward(request,response);
//        }
        return  false;
    }
}
