package com.gr.cg.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.gr.cg.dto.EmployeeVO;

public class User implements UserDetails {
	private static final long serialVersionUID = -2381438034512986826L;
	private EmployeeVO emp;
	public User() {};
	public User(EmployeeVO emp) {
		this.emp = emp;
	}
	public void setUser(EmployeeVO emp) {
		this.emp = emp;
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> roles = new ArrayList<>();
		return roles;
	}

	@Override
	public String getPassword() {
		return emp.getEmp_pass();
	}

	@Override
	public String getUsername() {
		return emp.getEmp_id();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		if(emp.getEmp_actvyn().equals("N")) {
			return false;
		}else {
			return true;
		}
		
	}

	@Override
	public boolean isCredentialsNonExpired() {
		if(emp.getEmp_pwex().equals("Y")) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
	
	public EmployeeVO getEmpVO() {
		return this.emp;
	}

}
