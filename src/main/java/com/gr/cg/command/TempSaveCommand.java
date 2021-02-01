package com.gr.cg.command;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.gr.cg.dto.ApprovalRefVO;
import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.ConsensusVO;
import com.gr.cg.dto.ReceiverVO;

public class TempSaveCommand {
	String[] rec_empid;	// 수신
	String[] ar_empid;	// 참조
	String[] aprv_empid;	// 결재
	String[] aprv_as;		// 결재
	int[] aprv_ord;		// 결재
	String[] cons_empid;	// 합의
	String[] cons_agrestt;	// 합의
	int[] cons_ord;		// 합의
	
	public List<ApprovalVO> getAprvList(){
		List<ApprovalVO> list = new ArrayList<>();
		if(aprv_empid != null) {
			for(int i=0;i<aprv_empid.length;i++) {
				ApprovalVO vo = new ApprovalVO();
				vo.setAprv_empid(aprv_empid[i]);
				vo.setAprv_as(aprv_as[i]);
				vo.setAprv_ord(aprv_ord[i]);
				list.add(vo);
			}
			return list;
		}
		return null;
	}
	public List<ConsensusVO> getConsList(){
		List<ConsensusVO> list = new ArrayList<>();
		if(cons_empid != null) {
			for(int i=0;i<cons_empid.length;i++) {
				ConsensusVO vo = new ConsensusVO();
				vo.setCons_empid(cons_empid[i]);
				vo.setCons_agrestt(cons_agrestt[i]);
				vo.setCons_ord(cons_ord[i]);
				list.add(vo);
			}
			return list;
		}
		return null;
	}
	public List<ReceiverVO> getReciveList(){
		List<ReceiverVO> list = new ArrayList<>();
		if(rec_empid != null) {
			for(String id : rec_empid) {
				ReceiverVO vo = new ReceiverVO();
				vo.setRec_empid(id);
				list.add(vo);
			}
			return list;
		}
		return null;
	}
	public List<ApprovalRefVO> getAprvRefList(){
		List<ApprovalRefVO> list = new ArrayList<>();
		if(ar_empid != null) {
			for(String id : ar_empid) {
				ApprovalRefVO vo = new ApprovalRefVO();
				vo.setAr_empid(id);
				list.add(vo);
			}
			return list;
		}
		return null;
	}
	public String[] getRec_empid() {
		return rec_empid;
	}
	public void setRec_empid(String[] rec_empid) {
		this.rec_empid = rec_empid;
	}
	public String[] getAr_empid() {
		return ar_empid;
	}
	public void setAr_empid(String[] ar_empid) {
		this.ar_empid = ar_empid;
	}
	public String[] getAprv_empid() {
		return aprv_empid;
	}
	public void setAprv_empid(String[] aprv_empid) {
		this.aprv_empid = aprv_empid;
	}
	public String[] getAprv_as() {
		return aprv_as;
	}
	public void setAprv_as(String[] aprv_as) {
		this.aprv_as = aprv_as;
	}
	public int[] getAprv_ord() {
		return aprv_ord;
	}
	public void setAprv_ord(int[] aprv_ord) {
		this.aprv_ord = aprv_ord;
	}
	public String[] getCons_empid() {
		return cons_empid;
	}
	public void setCons_empid(String[] cons_empid) {
		this.cons_empid = cons_empid;
	}
	public String[] getCons_agrestt() {
		return cons_agrestt;
	}
	public void setCons_agrestt(String[] cons_agrestt) {
		this.cons_agrestt = cons_agrestt;
	}
	public int[] getCons_ord() {
		return cons_ord;
	}
	public void setCons_ord(int[] cons_ord) {
		this.cons_ord = cons_ord;
	}
	public TempSaveCommand(String[] rec_empid, String[] ar_empid, String[] aprv_empid, String[] aprv_as,
			int[] aprv_ord, String[] cons_empid, String[] cons_agrestt, int[] cons_ord) {
		super();
		this.rec_empid = rec_empid;
		this.ar_empid = ar_empid;
		this.aprv_empid = aprv_empid;
		this.aprv_as = aprv_as;
		this.aprv_ord = aprv_ord;
		this.cons_empid = cons_empid;
		this.cons_agrestt = cons_agrestt;
		this.cons_ord = cons_ord;
	}
	public TempSaveCommand() {}
	@Override
	public String toString() {
		return "TempSaveCommand [rec_empid=" + Arrays.toString(rec_empid) + ", ar_empid=" + Arrays.toString(ar_empid)
				+ ", aprv_empid=" + Arrays.toString(aprv_empid) + ", aprv_as=" + Arrays.toString(aprv_as)
				+ ", aprv_ord=" + Arrays.toString(aprv_ord) + ", cons_empid=" + Arrays.toString(cons_empid)
				+ ", cons_agrestt=" + Arrays.toString(cons_agrestt) + ", cons_ord=" + Arrays.toString(cons_ord) + "]";
	}
	
}
