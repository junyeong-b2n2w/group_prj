package com.gr.cg.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler{
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(exception instanceof CredentialsExpiredException) {
			System.out.println();
			out.println("<script>");
			out.println("alert('비밀번호를 변경해 주세요')");
			out.println("location.href='"+request.getContextPath()+"/needPasswordChange?userid="+exception.getMessage()+"'");
			out.println("</script>");
        }else {
        	out.println("<script>");
    		out.println("alert('" + exception.getMessage() + "')");
    		out.println("history.go(-1)");
    		out.println("</script>");
        }


		
		
	
		
		//super.onAuthenticationFailure(request, response, exception);
	}
}
