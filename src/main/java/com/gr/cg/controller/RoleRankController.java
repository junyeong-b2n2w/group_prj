package com.gr.cg.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.RankVO;
import com.gr.cg.service.RankService;

@Controller
@RequestMapping("/rank")
public class RoleRankController {
	
	@Autowired
	private RankService service;
	
	@RequestMapping("/main")
	public ModelAndView main(SearchCriteria cri,HttpSession session,ModelAndView mnv)throws Exception {
		
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_compno();
		cri.setComp_no(compno);
		
		List<RankVO> rankList = service.getRankList(cri);
		String url ="/rank/rankList.open";
		
		mnv.addObject("rankList", rankList);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	@RequestMapping(path="/regist",method=RequestMethod.POST)
	public String regist(RankVO rank, Model model, @RequestParam("rank_nm") String rank_nm,
												  @RequestParam("rank_uprank")int rank_uprank,
												  HttpSession session)throws Exception {
		
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_compno();
		rank.setRank_compno(compno);
		rank.setRank_nm(rank_nm);
		rank.setRank_uprank(rank_uprank);
		
		service.registRank(rank);
		
		return "redirect:/rank/main";
		
		
		
		
	}
	@RequestMapping("/list")
	public void list() {}
	@RequestMapping("/detail")
	public void detail() {}
	
	
	@RequestMapping(value="/modifyForm",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String modifyForm(int rank_no) throws Exception{
		
		RankVO rank = service.GetRankByRankNo(rank_no);
		
		ObjectMapper om = new ObjectMapper();
		String jsonData = om.writeValueAsString(rank);
		
		return jsonData;
		
	}
	@RequestMapping("/modify")
	public String modify(RankVO rank, Model model, @RequestParam("rank_no") int rank_no,
												  @RequestParam("rank_nm")String rank_nm,
												  @RequestParam("rank_uprank")int rank_uprank,
												  HttpSession session) throws Exception{
		rank.setRank_no(rank_no);
		rank.setRank_nm(rank_nm);
		rank.setRank_uprank(rank_uprank);
		
		service.modifyRank(rank);
		
		return "redirect:/rank/main";
		
	}
	@RequestMapping(path="/remove",method=RequestMethod.GET)
	public String remove(Model mode,@RequestParam("rank_no")String rank_no )throws Exception {
		
		String[] arrRankNo = rank_no.toString().split(",");
		int parseRankNo = 0;
		
        for (int i=0; i<arrRankNo.length; i++) {
        	parseRankNo = Integer.parseInt(arrRankNo[i]);
        	service.removeRank(parseRankNo);
        	
		}
		return "redirect:/rank/main";
		
	}
}

