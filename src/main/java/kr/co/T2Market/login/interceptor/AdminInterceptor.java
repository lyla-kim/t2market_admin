package kr.co.T2Market.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.T2Market.login.domain.AdminVO;


public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception{
		HttpSession session = req.getSession();
		
		AdminVO admin = (AdminVO)session.getAttribute("admin");
		
		if(admin == null || admin.getActive() !='Y') {
			res.sendRedirect("/login/login2");
			
			return false;
		}
		
		return true;
	}
}
