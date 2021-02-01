package com.gr.cg.dto;

import java.util.ArrayList;
import java.util.List;

import com.gr.cg.command.PageMaker2;

public class ElecDocumentVO extends PageMaker2{
	private int ed_no       ;
	private String ed_dftr     ;
	private String ed_lastapvr ;
	private String ed_regymd   ;
	private String ed_comymd;
	private String ed_aprvstt  ;
	private String ed_aprvtitle;
	private String ed_aprv;
	private int ed_formno   ;
	private int ed_deptno   ;
	private String ed_taskno   ;
	private String ed_attckey  ;
	private List<ApprovalVO> aprvList;
	private List<ConsensusVO> consList;
	private List<ReceiverVO> reciveList;
	private List<ApprovalRefVO> referList;
	private List<ApprovalVO> allAprvLnList;
	private int[] ta_no;
	private String ed_deptnm;
	private String ed_formnm;
	private String code;
	private String ed_empnm;
	private String asgmdt;
	private String ed_ranknm;
	private String aprv_asgmdt;
	
	public String getEd_comymd() {
		return ed_comymd;
	}
	public void setEd_comymd(String ed_comymd) {
		this.ed_comymd = ed_comymd;
	}
	public String getEd_deptnm() {
		return ed_deptnm;
	}
	public void setEd_deptnm(String ed_deptnm) {
		this.ed_deptnm = ed_deptnm;
	}
	public String getEd_formnm() {
		return ed_formnm;
	}
	public void setEd_formnm(String ed_formnm) {
		this.ed_formnm = ed_formnm;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getAsgmdt() {
		return asgmdt;
	}
	public void setAsgmdt(String asgmdt) {
		this.asgmdt = asgmdt;
	}
	public ElecDocumentVO() {
	}
	public int getEd_no() {
		return ed_no;
	}
	public void setEd_no(int ed_no) {
		this.ed_no = ed_no;
	}
	public String getEd_dftr() {
		return ed_dftr;
	}
	public void setEd_dftr(String ed_dftr) {
		this.ed_dftr = ed_dftr;
	}
	public String getEd_lastapvr() {
		return ed_lastapvr;
	}
	public void setEd_lastapvr(String ed_lastapvr) {
		this.ed_lastapvr = ed_lastapvr;
	}
	public String getEd_regymd() {
		return ed_regymd;
	}
	public void setEd_regymd(String ed_regymd) {
		this.ed_regymd = ed_regymd;
	}
	public String getEd_aprvstt() {
		return ed_aprvstt;
	}
	public void setEd_aprvstt(String ed_aprvstt) {
		this.ed_aprvstt = ed_aprvstt;
	}
	public String getEd_aprvtitle() {
		return ed_aprvtitle;
	}
	public void setEd_aprvtitle(String ed_aprvtitle) {
		this.ed_aprvtitle = ed_aprvtitle;
	}
	public String getEd_aprv() {
		return ed_aprv;
	}
	public void setEd_aprv(String ed_aprv) {
		this.ed_aprv = ed_aprv;
	}
	public int getEd_formno() {
		return ed_formno;
	}
	public void setEd_formno(int ed_formno) {
		this.ed_formno = ed_formno;
	}
	public int getEd_deptno() {
		return ed_deptno;
	}
	public void setEd_deptno(int ed_deptno) {
		this.ed_deptno = ed_deptno;
	}
	public String getEd_taskno() {
		return ed_taskno;
	}
	public void setEd_taskno(String ed_taskno) {
		this.ed_taskno = ed_taskno;
	}
	public void setEd_taskno(int ed_taskno) {
		this.ed_taskno = ed_taskno+"";
	}
	public String getEd_attckey() {
		return ed_attckey;
	}
	public void setEd_attckey(String ed_attckey) {
		this.ed_attckey = ed_attckey;
	}
	public int[] getTa_no() {
		return ta_no;
	}
	public void setTa_no(int[] ta_no) {
		this.ta_no = ta_no;
	}
	public String getEd_empnm() {
		return ed_empnm;
	}
	public void setEd_empnm(String ed_empnm) {
		this.ed_empnm = ed_empnm;
	}
	public List<ApprovalVO> getAprvList() {
		return aprvList;
	}
	public void setAprvList(List<ApprovalVO> aprvList) {
		this.aprvList = aprvList;
	}
	public void setAprvList(ApprovalVO[] aprvList) {
		List<ApprovalVO> list = new ArrayList<>();
		for(int i=0; i<aprvList.length; i++) {
			list.add(aprvList[i]);
		}
		this.aprvList = list;
	}
	public List<ConsensusVO> getConsList() {
		return consList;
	}
	public void setConsList(List<ConsensusVO> consList) {
		this.consList = consList;
	}
	public void setConsList(ConsensusVO[] consList) {
		List<ConsensusVO> list = new ArrayList<>();
		for(int i=0; i<consList.length; i++) {
			list.add(consList[i]);
		}
		this.consList = list;
	}
	public List<ReceiverVO> getReciveList() {
		return reciveList;
	}
	public void setReciveList(List<ReceiverVO> reciveList) {
		this.reciveList = reciveList;
	}
	public void setReciveList(ReceiverVO[] reciveList) {
		List<ReceiverVO> list = new ArrayList<>();
		for(int i=0; i<reciveList.length; i++) {
			list.add(reciveList[i]);
		}
		this.reciveList = list;
	}
	public List<ApprovalRefVO> getReferList() {
		return referList;
	}
	public void setReferList(List<ApprovalRefVO> referList) {
		this.referList = referList;
	}
	public void setReferList(ApprovalRefVO[] referList) {
		List<ApprovalRefVO> list = new ArrayList<>();
		for(int i=0; i<referList.length; i++) {
			list.add(referList[i]);
		}
		this.referList = list;
	}
	public ElecDocumentVO(int ed_no, String ed_dftr, String ed_lastapvr, String ed_regymd, String ed_comymd,
			String ed_aprvstt, String ed_aprvtitle, String ed_aprv, int ed_formno, int ed_deptno, String ed_taskno,
			String ed_attckey, List<ApprovalVO> aprvList, List<ConsensusVO> consList, List<ReceiverVO> reciveList,
			List<ApprovalRefVO> referList, int[] ta_no, String ed_deptnm, String ed_formnm, String code,
			String ed_empnm, String asgmdt) {
		super();
		this.ed_no = ed_no;
		this.ed_dftr = ed_dftr;
		this.ed_lastapvr = ed_lastapvr;
		this.ed_regymd = ed_regymd;
		this.ed_comymd = ed_comymd;
		this.ed_aprvstt = ed_aprvstt;
		this.ed_aprvtitle = ed_aprvtitle;
		this.ed_aprv = ed_aprv;
		this.ed_formno = ed_formno;
		this.ed_deptno = ed_deptno;
		this.ed_taskno = ed_taskno;
		this.ed_attckey = ed_attckey;
		this.aprvList = aprvList;
		this.consList = consList;
		this.reciveList = reciveList;
		this.referList = referList;
		this.ta_no = ta_no;
		this.ed_deptnm = ed_deptnm;
		this.ed_formnm = ed_formnm;
		this.code = code;
		this.ed_empnm = ed_empnm;
		this.asgmdt = asgmdt;
	}
	public String getEd_ranknm() {
		return ed_ranknm;
	}
	public void setEd_ranknm(String ed_ranknm) {
		this.ed_ranknm = ed_ranknm;
	}
	public List<ApprovalVO> getAllAprvLnList() {
		return allAprvLnList;
	}
	public void setAllAprvLnList(List<ApprovalVO> allAprvLnList) {
		this.allAprvLnList = allAprvLnList;
	}
	public String getAprv_asgmdt() {
		return aprv_asgmdt;
	}
	public void setAprv_asgmdt(String aprv_asgmdt) {
		this.aprv_asgmdt = aprv_asgmdt;
	}
	
}
