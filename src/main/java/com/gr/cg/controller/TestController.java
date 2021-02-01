package com.gr.cg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	@RequestMapping("a")
	public String a() {
		return "병규/list.page";
	}
	
	@RequestMapping("a1")
	public String a1() {
		return "병규/authority_board.page";
	}
	
	@RequestMapping("a2")
	public String a2() {
		return "동민/기안작성.page";
	}
	
	@RequestMapping("a3")
	public String a3() {
		return "동민/index.page";
	}
	
	
	/*@RequestMapping("a4")
	public String a4() {
		return "윤혜/조직도목록.page";
	}*/
	
	@RequestMapping("a5")
	public String a5() {
		return "윤혜/조직도(트리).page";
	}
	
	@RequestMapping("a6")
	public String a6() {
		return "윤혜/개인그룹.page";
	}
	
	@RequestMapping("a7")
	public String a7() {
		return "윤혜/권한관리.page";
	}
	
	@RequestMapping("a8")
	public String a8() {
		return "윤혜/부서관리.page";
	}
	
	@RequestMapping("a9")
	public String a9() {
		return "윤혜/부서등록.page";
	}
	
	@RequestMapping("a10")
	public String a10() {
		return "윤혜/직급등록.page";
	}
	@RequestMapping("a11")
	public String a11() {
		return "윤혜/직원등록.page";
	}
	@RequestMapping("a12")
	public String a12() {
		return "윤혜/직원목록.page";
	}
	@RequestMapping("a13")
	public String a13() {
		return "준영/automake.page";
	}
	@RequestMapping("a14")
	public String a14() {
		return "나정/calendar.page";
	}
	@RequestMapping("a15")
	public String a15() {
		return "나정/company.page";
	}
	@RequestMapping("a16")
	public String a16() {
		return "나정/companyRegist.page";
	}
	@RequestMapping("a17")
	public String a17() {
		return "준영/gianjak.page";
	}
	@RequestMapping("a18")
	public String a18() {
		return "준영/login.page";
	}
	@RequestMapping("a19")
	public String a19() {
		return "나정/mandate.page";
	}
	@RequestMapping("a20")
	public String a20() {
		return "준영/memberModify.page";
	}
	@RequestMapping("a21")
	public String a21() {
		return "나정/memo.page";
	}
	@RequestMapping("a22")
	public String a22() {
		return "준영/mypage.page";
	}
	@RequestMapping("a23")
	public String a23() {
		return "준영/passwordChange.page";
	}
	@RequestMapping("a24")
	public String a24() {
		return "범영/docManage.page";
	}
	@RequestMapping("a25")
	public String a25() {
		return "범영/read.page";
	}
	@RequestMapping("a26")
	public String a26() {
		return "범영/serverResources.page";
	}
	
	
}
