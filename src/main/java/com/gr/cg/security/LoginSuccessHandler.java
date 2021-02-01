package com.gr.cg.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.gr.cg.dto.EmployeeVO;

public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		User user = (User) authentication.getDetails();
		EmployeeVO loginUser = user.getEmpVO();
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", loginUser);
//		String rememberMe = request.getParameter("rememberMe");
//		String id = request.getParameter("id");
//		if(rememberMe != null && rememberMe.equals("check")) {
//			Cookie cookie = new Cookie("loginUser", id);
//			cookie.setMaxAge(3*24*60*60);
//			cookie.setPath("/");
//			response.addCookie(cookie);
//		}
		super.onAuthenticationSuccess(request, response, authentication);
	}
}
