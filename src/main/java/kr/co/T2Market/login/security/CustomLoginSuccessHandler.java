package kr.co.T2Market.login.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub

		log.warn("Login Success");
		
		List<String> roleNames = new ArrayList<>();
		
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("Role Names: "+roleNames);
		
		if(roleNames.contains("20100")) {
			response.sendRedirect("/admin/admin");
			return;
		}
		if(roleNames.contains("20200")) {
			response.sendRedirect("/admin/admin");
			return;
		}
		if(roleNames.contains("20300")) {
			response.sendRedirect("/admin/admin");
			return;
		}
		
		response.sendRedirect("/");
		
	}

}
