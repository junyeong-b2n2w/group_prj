package com.gr.cg.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.gr.cg.command.PageMaker;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dao.ApprovalFormDAO;
import com.gr.cg.dao.FormComponentDAO;
import com.gr.cg.dto.ApprovalFormVO;
import com.gr.cg.dto.FormComponentVO;
import com.gr.cg.dto.FormFavoriteVO;

public class ApprovalFormServiceImpl implements ApprovalFormService{
 
	private ApprovalFormDAO approvalFormDAO;
	private FormComponentDAO formComponentDAO;
	
	
	public void setApprovalFormDAO(ApprovalFormDAO approvalFormDAO) {
		this.approvalFormDAO = approvalFormDAO;
	}
	
	public void setFormComponentDAO(FormComponentDAO formComponentDAO) {
		this.formComponentDAO = formComponentDAO;
	}
	
	@Override
	public Map<String, Object> selectApprovalFormListByCRI(SearchCriteria cri ) {
		Map<String,Object> dataMap=new HashMap<String,Object>();
		
		List<ApprovalFormVO> aprvformList= null; 
				
		int totalCount = 0;
		
		try {
			aprvformList = approvalFormDAO.selectApprovalFormListByCRI(cri);
		
			totalCount=approvalFormDAO.selectApprovalFormListByCRITotalCount(cri);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("log");
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("aprvformList", aprvformList);
		dataMap.put("pageMaker",pageMaker);
				
		return dataMap;
	}

	@Override
	public ApprovalFormVO selectApprovalFormByAFNO(int af_no)  {
		ApprovalFormVO approvalFormVO = null;
		List<FormComponentVO> formComponentList = null;
		int fc_afno = af_no;
		try {
			approvalFormVO = approvalFormDAO.selectApprovalFormByAFNO(af_no);
			formComponentList = formComponentDAO.selectFormComponentByFCAFNO(fc_afno);
			approvalFormVO.setFormComponentList(formComponentList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
				
		return approvalFormVO;
	}

	@Transactional
	@Override
	public void registApprovalForm(ApprovalFormVO approvalFormVO, String componentArr) {
		
		try {
			int seq = approvalFormDAO.selectApprovalFromNextSeq();
			approvalFormVO.setAf_no(seq);
			approvalFormDAO.insertApprovalForm(approvalFormVO);
			
			String[] components = componentArr.split(",");
			
			
			for(int i = 0; i < components.length; i++) {
				
				
				int componentNUM = Integer.parseInt( components[i].substring(1,components[i].length()-1));
				
				
				FormComponentVO formComponentVO = new FormComponentVO(seq,componentNUM,i);
				
				formComponentDAO.insertFormComponent(formComponentVO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateApprovalForm(ApprovalFormVO approvalFormVO , String componentArr)  {
		try {
			approvalFormDAO.updateApprovalForm(approvalFormVO);
			
			String[] components = componentArr.split(",");
			
			
			formComponentDAO.deleteFormComponentByFCAFNO(approvalFormVO.getAf_no());
			
			for(int i = 0; i < components.length; i++) {
				
				
				int componentNUM = Integer.parseInt( components[i].substring(1,components[i].length()-1));
				
				
				FormComponentVO formComponentVO = new FormComponentVO(approvalFormVO.getAf_no(),componentNUM,i);
				
				formComponentDAO.insertFormComponentByAFNO(formComponentVO);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteApprovalForm(int af_no) {
		
		try {
			approvalFormDAO.deleteApprovalForm(af_no);
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void addFormFavorite(FormFavoriteVO vo) {
		try {
			approvalFormDAO.insertFormFavorite(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void removeFormFavorite(int ff_no) {
		try {
			approvalFormDAO.deleteFormFavorite(ff_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
}

