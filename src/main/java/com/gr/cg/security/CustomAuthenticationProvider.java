package com.gr.cg.security;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.gr.cg.command.EncryptionUtils;
import com.gr.cg.dao.EmpDAO;
import com.gr.cg.dto.EmployeeVO;

public class CustomAuthenticationProvider implements AuthenticationProvider{

	private EmpDAO empDAO;
	public void setEmpDAO(EmpDAO empDAO) {
		this.empDAO = empDAO;
	}
	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		String login_id = (String) auth.getPrincipal();
		String login_pwd = (String) auth.getCredentials();
		EmployeeVO emp = null;
		
		try {
			emp = empDAO.selectEmpById(login_id);
		} catch (SQLException e) {
			throw new AuthenticationServiceException("서버 에러");
		}
		
		String encLogPwd = EncryptionUtils.encryptSHA256(login_pwd);
		System.out.println(encLogPwd);
		if(emp != null && encLogPwd.equals(emp.getEmp_pass())) {
			User authUser = new User(emp);
			List<GrantedAuthority> roles = null;
			try {
				roles = empDAO.getEmpRoles(authUser.getUsername());
				System.out.println(roles);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//roles.add(new SimpleGrantedAuthority(emp.getRole_nm()));
			
			
			//비밀번호 만료, 계정 비활성 
			if (!authUser.isCredentialsNonExpired()) {
				throw new CredentialsExpiredException(authUser.getUsername());
			} else if(!authUser.isCredentialsNonExpired()) {
				throw new AccountExpiredException(authUser.getUsername());
			}
			
			
			UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(authUser.getUsername(), authUser.getPassword(), roles);
			result.setDetails(authUser);
			return result;
		}	
		
		
		else {
			throw new BadCredentialsException("아이디나 비밀번호가 맞지 않습니다");
		}
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return (UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication));
	}

}
