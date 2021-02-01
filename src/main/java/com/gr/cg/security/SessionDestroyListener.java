package com.gr.cg.security;

import java.util.List;

import org.springframework.context.ApplicationListener;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.session.SessionDestroyedEvent;

import com.gr.cg.dto.EmployeeVO;

public class SessionDestroyListener implements ApplicationListener<SessionDestroyedEvent>{

	@Override
	public void onApplicationEvent(SessionDestroyedEvent event) {
		List<SecurityContext> contexts = event.getSecurityContexts();
		if(!contexts.isEmpty()) {
			for(SecurityContext ctx : contexts) {
				Authentication auth = ctx.getAuthentication();
				
				if(auth != null && auth.getDetails() != null) {
					try {
						User user = (User) auth.getDetails();
						EmployeeVO emp = user.getEmpVO();
						System.out.println("user invalid session : " + emp);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}
