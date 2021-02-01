package com.gr.cg.service;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.command.TempSaveCommand;
import com.gr.cg.controller.ITextTestController;
import com.gr.cg.dao.AprvConsDAO;
import com.gr.cg.dao.ElecDocumentDAO;
import com.gr.cg.dao.RecRefDAO;
import com.gr.cg.dto.ApprovalRefVO;
import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.ConsensusVO;
import com.gr.cg.dto.ElecDocumentVO;
import com.gr.cg.dto.ReceiverVO;

public class ElecDocumentServiceImpl implements ElecDocumentService{

	private ElecDocumentDAO elecDocumentDAO;
	private RecRefDAO recRefDAO;
	private AprvConsDAO aprvConsDAO;
	private FileService fileService;
	private SqlSession sqlSession;
	private ElecDocumentService edocService;
	private ApprovalFormService approvalFormService;
	private CommonCodeService commonCodeService;
	private CompanyService companyService;
	private ComponentService componentService;
	public void setElecDocumentService(ElecDocumentService edocService) {
		this.edocService = edocService;
	}public void setApprovalFormService(ApprovalFormService approvalFormService) {
		this.approvalFormService = approvalFormService;
	}public void setCommonCodeService(CommonCodeService commonCodeService) {
		this.commonCodeService = commonCodeService;
	}public void setCompanyService(CompanyService companyService) {
		this.companyService = companyService;
	}public void setComponentService(ComponentService componentService) {
		this.componentService = componentService;
	}
	@Resource(name="aprvUploadPath")
	private String uplaodPath;
	
	public void setElecDocumentDAO(ElecDocumentDAO elecDocumentDAO) {
		this.elecDocumentDAO = elecDocumentDAO;
	}
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public void setRecRefDAO(RecRefDAO recRefDAO) {
		this.recRefDAO = recRefDAO;
	}
	public void setElecAprvConsDAO(AprvConsDAO aprvConsDAO) {
		this.aprvConsDAO = aprvConsDAO;
	}
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	@Override
	public List<ElecDocumentVO> getElecDocumentList(SearchCriteria cri) throws SQLException {
		return elecDocumentDAO.selectElecDocumentList(cri);
	}
	@Override
	public ElecDocumentVO getElecDocumentByElecDocumentNo(int elecDocumentNo) throws SQLException {
		return elecDocumentDAO.selectElecDocumentByElecDocumentNo(elecDocumentNo);
	}
	@Override
	public void modifyElecDocument(ElecDocumentVO elecDocument) throws SQLException {
		elecDocumentDAO.updateElecDocument(elecDocument);	}
	@Override
	public void removeElecDocument(int elecDocumentNo) throws SQLException {
		elecDocumentDAO.deleteElecDocument(elecDocumentNo);	}
	@Override
	public void registElecDocument(ElecDocumentVO elecDocument, TempSaveCommand tempSave) throws Exception {
		int[] ta_no = elecDocument.getTa_no(); 
		if(ta_no != null && ta_no.length > 0 ) {
			String key = fileService.registFile(ta_no, elecDocument.getEd_dftr(), uplaodPath, "ELECTRONICDOCUMENT");
			if(!key.equals("실패")) {
				elecDocument.setEd_attckey(key);
			}
		}
		insertEdocMethod(elecDocument, tempSave);
	}
	@Override
	public List<ElecDocumentVO> getEdocListByUserId(SearchCriteria2 cri) throws SQLException {
		return elecDocumentDAO.selectEdocListByUserId(cri);
	}
	@Override
	public List<ElecDocumentVO> getAprvListByUserId(SearchCriteria2 cri) throws SQLException {
		return elecDocumentDAO.selectAprvListByUserId(cri);
	}
	@Override
	public List<ElecDocumentVO> getSaveListByUserId(SearchCriteria2 cri) throws SQLException {
		return elecDocumentDAO.selectSaveListByUserId(cri);
	}
	@Override
	public ElecDocumentVO getEdocForDetail(int edno) throws SQLException {
		ElecDocumentVO edoc = elecDocumentDAO.selectEdocForDetail(edno);
		List<ApprovalVO> aprvList = elecDocumentDAO.selectAprvForDetail(edno);
		List<ConsensusVO> conList = elecDocumentDAO.selectConsForDetail(edno);
		List<ReceiverVO> recList = elecDocumentDAO.selectRecForDetail(edno);
		List<ApprovalRefVO> refList = elecDocumentDAO.selectRefForDetail(edno);
		List<ApprovalVO> allAprvLnList = elecDocumentDAO.selectAllAprvLnByEdno(edno);
		
		edoc.setConsList(conList);
		edoc.setAprvList(aprvList);
		edoc.setReciveList(recList);
		edoc.setReferList(refList);
		edoc.setAllAprvLnList(allAprvLnList);
		return edoc;
	}
	@Override
	public List<AttachVO> getAttachList(int edno) throws SQLException {
		return elecDocumentDAO.selectAttachList(edno);
	}
	@Override
	public void registElecDocumentWithAttach(ElecDocumentVO edoc, TempSaveCommand tempSave, int[] delfile)
			throws Exception {
		
		elecDocumentDAO.deleteElecDocument(edoc.getEd_no());
		if(edoc.getTa_no()!= null && edoc.getTa_no().length > 0) {
			String key = fileService.registFile(edoc.getTa_no(), edoc.getEd_dftr(), uplaodPath,"electronicdocument");
			Map<String, Object> map = new HashMap<String,Object>();
			//기존파일을 삭제할 경우
			if(delfile != null) {
				for(int i =0; i<delfile.length; i++) {
					AttachVO attach = new AttachVO();
					attach.setAttc_no(delfile[i]);
					fileService.removeFile(attach);
				}
			}
			
			String beforeKey = edoc.getEd_attckey();
			if(!key.equals("실패")) {
				if( beforeKey.equals("0")) { //기본 파일이 없는경우
					edoc.setEd_attckey(key);
				}else {
					fileService.deleteKey(beforeKey);
					map.put("attc_key", key);
					map.put("before_key", beforeKey);
					fileService.updateKey(map);
					edoc.setEd_attckey(key);
				}
			}
		}else {
			if(delfile != null) {
				for(int i =0; i<delfile.length; i++) {
					AttachVO attach = new AttachVO();
					attach.setAttc_no(delfile[i]);
					fileService.removeFile(attach);
				}
			}
		}
		insertEdocMethod(edoc, tempSave);
	}
	
	public void insertEdocMethod(ElecDocumentVO edoc, TempSaveCommand tempSave) throws SQLException {
		int seq = elecDocumentDAO.selectSeq();	// EDOC 기본키 생성
		edoc.setEd_no(seq);	// edocVO seq 세팅
		
		elecDocumentDAO.insertElecDocument(edoc);
		
		List<ApprovalVO> aprvList = tempSave.getAprvList();
		List<ConsensusVO> consList = tempSave.getConsList();
		List<ReceiverVO> recList = tempSave.getReciveList();
		List<ApprovalRefVO> refList = tempSave.getAprvRefList();
		if(aprvList != null) {
			for(ApprovalVO vo : aprvList) {
				vo.setAprv_edno(seq);
				if(vo.getAprv_as().equals("DAP05") || vo.getAprv_as().equals("DAP35") || vo.getAprv_as().equals("DAP45")) {
					aprvConsDAO.insertFirstAprv(vo);
				}else {
					aprvConsDAO.insertAprv(vo);
				}
			}
		}
		if(consList != null) {
			for(ConsensusVO vo : consList) {
				vo.setCons_edno(seq);
				if(vo.getCons_agrestt().equals("DAP15") || vo.getCons_agrestt().equals("DAP25")) {
					aprvConsDAO.insertFirstCons(vo);
				}else {
					aprvConsDAO.insertCons(vo);
				}
			}
		}
		if(recList != null) {
			for(ReceiverVO vo : recList) {
				vo.setRec_edno(seq);
				recRefDAO.insertRec(vo);
			}
		}
		if(refList != null) {
			for(ApprovalRefVO vo : refList) {
				vo.setAr_edno(seq);
				recRefDAO.insertRef(vo);
			}
		}
	}
	@Override
	public void collectElecDocument(int edno) throws SQLException {
		elecDocumentDAO.collectElecDocument(edno);	
	}
	@Override
	public ApprovalVO getAprvDates(int edno, String id) throws SQLException {
		ApprovalVO vo = elecDocumentDAO.selectAprvDates(edno, id);
		if(vo != null) {
			if(vo.getAprv_asgmdt() != null && !vo.getAprv_asgmdt().isEmpty()) {
				if(vo.getAprv_idntydt() == null) {
					if(vo.getAprv_attckey() != null && vo.getAprv_attckey().equals("-")) {
						elecDocumentDAO.updateConsChkDate(vo.getAprv_no());
					}else {
						elecDocumentDAO.updateAprvChkDate(vo.getAprv_no());
					}
				}
			}
		}
		return vo;
	}
	@Override
	public void importantApproval(ApprovalVO vo, HttpSession session, HttpServletResponse response) throws Exception {
		ITextTestController pdfSave = new ITextTestController();
		// 파일있을경우
		if(vo.getTa_no()!= null && vo.getTa_no().length > 0) {
			String key = fileService.registFile(vo.getTa_no(), vo.getAprv_empid(), uplaodPath,"approval");
			vo.setAprv_attckey(key);
		}
		// 결재상태 확인후 완료로 변경
		String aprvAs = vo.getAprv_as().substring(0, 4) + "2";
		vo.setAprv_as(aprvAs);
		// 현재결재자 결재등록
		aprvConsDAO.updateAprv(vo);
		// 현재결재자 결재정보
		vo = aprvConsDAO.selectAprvForAprv(vo.getAprv_no());
		
		// 결재문서 가져오기
		ElecDocumentVO edoc = aprvConsDAO.selectEdocForAprv(vo.getAprv_edno());
		
		// 마지막 결재자 조회
		String lastAprv = edoc.getEd_lastapvr();
		
		// 전결자인경우
		if(lastAprv.equals(vo.getAprv_empid()) || vo.getAprv_as().equals("DAP32")||vo.getAprv_as().equals("DAP72")) {	// 현재결재자와 마지막 결재자가 같은경우
			// 전자문서 최종결재완료
			aprvConsDAO.updateEdocFinal(vo.getAprv_edno());
			Map<String,Object> serviceMap = new HashMap<>();
			serviceMap.put("edocService", edocService);
			serviceMap.put("approvalFormService", approvalFormService);
			serviceMap.put("commonCodeService", commonCodeService);
			serviceMap.put("companyService", companyService);
			serviceMap.put("componentService", componentService);
			String savePath = pdfSave.save(response, session, vo.getAprv_edno(), serviceMap);
			Map<String, String> map = new HashMap<>();
			map.put("edno", vo.getAprv_edno()+"");
			map.put("path", savePath);
			aprvConsDAO.insertFinalAprvPdf(map);
			String vactno = aprvConsDAO.selectEdocTaskNo(vo.getAprv_edno());
			if(vactno != null) {
				setAutoAprv(vactno, 1);
			}
		}else {	// 현재결재자가 최종결재자가 아닌경우
			// 전자문서 진행중으로 변경
			aprvConsDAO.updateEdocToIng(vo.getAprv_edno());
			
			// 다음 결재자 조회
			List<ApprovalVO> nextAprvs = aprvConsDAO.selectNextAprvList(vo.getAprv_edno(), vo.getAprv_ord());
			if(nextAprvs == null || nextAprvs.isEmpty()) {
				aprvConsDAO.updateEdocFinal(vo.getAprv_edno());
			}else {
				if(nextAprvs.get(0).getAprv_as().charAt(3) == '2' || nextAprvs.get(0).getAprv_as().charAt(3) == '6') {	// 다음결재자가 병렬합의인지 확인 (병렬합의코드 : DAP2_, DAP6_(대결))
					// 해당순서 병렬합의자들 합의 시작
					for(int i=0;i<nextAprvs.size(); i++) {
						if(nextAprvs.get(i).getAprv_as().equals("DAP21") || nextAprvs.get(i).getAprv_as().equals("DAP61")) {	// 병렬합의자 순서확인
							String code = nextAprvs.get(i).getAprv_as().substring(0, 4) + "5";
							aprvConsDAO.updateParallelCons(nextAprvs.get(i).getAprv_no(), code);
						}else {	// 병렬합의자 아닐경우 중지
							break;
						}
					}
				}else{	// 다음결재자가 병렬합의가 아닌경우(결재 또는 순차합의)
					// 현재결재자 바로 다음결재자 조회
					ApprovalVO nextAprv = nextAprvs.get(0);
					
					if(nextAprv.getAprv_as().equals("DAP11") || nextAprv.getAprv_as().equals("DAP51")) {	// 다음결재자가 순차합의일경우
						String code = nextAprv.getAprv_as().substring(0, 4) + "5";
						aprvConsDAO.updateTurnCons(nextAprv.getAprv_no(), code);
					}else {	// 다음결재자가 결재일경우
						String changeStt = nextAprv.getAprv_as().substring(0, 4) + "5";	// 상태코드 잘라서 대기중으로 변경
						nextAprv.setAprv_as(changeStt);	// 바꾼 상태코드 넣어주기
						aprvConsDAO.updateAprvStt(nextAprv);	// 상태코드 업데이트
					}
				}
			}
			
		}
	}
	@Override
	public void importantReturn(ApprovalVO vo) throws Exception {
		// 파일있을경우
		if(vo.getTa_no()!= null && vo.getTa_no().length > 0) {
			String key = fileService.registFile(vo.getTa_no(), vo.getAprv_empid(), uplaodPath,"approval");
			vo.setAprv_attckey(key);
		}
		// 결재상태 확인후 반려로 변경
		String aprvAs = vo.getAprv_as().substring(0, 4) + "3";
		vo.setAprv_as(aprvAs);
		// 현재결재자 결재등록
		aprvConsDAO.updateAprv(vo);
		// 현재결재자 결재정보
		vo = aprvConsDAO.selectAprvForAprv(vo.getAprv_no());
		// 현재 전자문서상태 반려로 변경
		aprvConsDAO.updateEdocToReturn(vo.getAprv_edno());
		String vactno = aprvConsDAO.selectEdocTaskNo(vo.getAprv_edno());
		if(vactno != null) {
			setAutoAprv(vactno, 2);
		}
	}
	@Override
	public void importantConsYesNo(ConsensusVO vo, int yn) throws SQLException {
		String yesNo;
		if(yn == 1) {	// 반대일경우
			yesNo = "3";
		}else {	// 찬성일경우
			yesNo = "2";
		}
		
		
		if(vo.getCons_agrestt().charAt(3) == '1' || vo.getCons_agrestt().charAt(3) == '5') {	// 현재 결재자가 순차인지 확인
			vo.setCons_agrestt(vo.getCons_agrestt().substring(0, 4) + yesNo);
			aprvConsDAO.updateCons(vo);
			
			List<ApprovalVO> nextAprvs = aprvConsDAO.selectNextAprvList(vo.getCons_edno(), vo.getCons_ord());
			
			// 현재결재자 바로 다음결재자 조회
			ApprovalVO nextAprv = nextAprvs.get(0);
			
			if(nextAprv.getAprv_as().equals("DAP11") || nextAprv.getAprv_as().equals("DAP51")) {	// 다음결재자가 순차합의일경우
				String code = nextAprv.getAprv_as().substring(0, 4) + "5";
				aprvConsDAO.updateTurnCons(nextAprv.getAprv_no(), code);
			}else {	// 다음결재자가 결재일경우
				String changeStt = nextAprv.getAprv_as().substring(0, 4) + "5";	// 상태코드 잘라서 대기중으로 변경
				nextAprv.setAprv_as(changeStt);	// 바꾼 상태코드 넣어주기
				aprvConsDAO.updateAprvStt(nextAprv);	// 상태코드 업데이트
			}
		}else {	// 병렬합의일경우
			// 병렬합의 반대로 변경후 진행
			vo.setCons_agrestt(vo.getCons_agrestt().substring(0, 4) + yesNo);
			aprvConsDAO.updateCons(vo);
			
			// 현재 합의자 결재정보
			vo = aprvConsDAO.selectConsForAprv(vo.getCons_no());
			
			// 남은 병렬합의자 수 구하기
			int cnt = aprvConsDAO.selectParConsCnt(vo.getCons_edno());
			
			if(cnt == 0) { // 병렬합의가 다 끝났을때
				
				// 다음 결재자 조회
				List<ApprovalVO> nextAprvs = aprvConsDAO.selectNextAprvList(vo.getCons_edno(), vo.getCons_ord());
				
				// 다음 결재자 저장할 객체
				ApprovalVO nextPerson = new ApprovalVO();
				for(int i=0; i<nextAprvs.size(); i++) {
					if(nextAprvs.get(i).getAprv_as().charAt(3) == '2' || nextAprvs.get(i).getAprv_as().charAt(3) == '6'){	// 병렬합의자인경우 컨티뉴
						continue;
					}else {	// 병렬합의자가 아닌경우
						nextPerson = nextAprvs.get(i);	// 결재자를 확인한후 저장 반복문 정지
						break;
					}
				}
				
				// 다음결재자 상태에 따른 결재진행
				if(nextPerson.getAprv_as().equals("DAP11") || nextPerson.getAprv_as().equals("DAP51")) {	// 다음결재자가 순차합의일경우
					String code = nextPerson.getAprv_as().substring(0, 4) + "5";
					aprvConsDAO.updateTurnCons(nextPerson.getAprv_no(),code);
				}else {	// 다음결재자가 결재일경우
					String changeStt = nextPerson.getAprv_as().substring(0, 4) + "5";	// 상태코드 잘라서 대기중으로 변경
					nextPerson.setAprv_as(changeStt);	// 바꾼 상태코드 넣어주기
					aprvConsDAO.updateAprvStt(nextPerson);	// 상태코드 업데이트
				}
			}
		}
	}
	@Override
	public List<ElecDocumentVO> getRefReadListByUserId(SearchCriteria2 cri) throws SQLException {
		return elecDocumentDAO.selectRefReadList(cri);
	}
	@Override
	public List<ElecDocumentVO> getReceiverListByUserId(SearchCriteria2 cri) throws SQLException {
		return elecDocumentDAO.selectReceiverList(cri);
	}
	@Override
	public void addReadingAuth(List<String> empids, int edno) throws SQLException {
		for(String id : empids) {
			elecDocumentDAO.mergeReading(edno, id);	
		}
	}
	@Override
	public ApprovalVO getAprvDetail(int aprv_no) throws SQLException {
		return elecDocumentDAO.selectAprvDetail(aprv_no);
	}
	@Override
	public ConsensusVO getConsDetail(int cons_no) throws SQLException {
		return elecDocumentDAO.selectConsDetail(cons_no);
	}
	@Override
	public List<AttachVO> getAprvAttachList(int aprv_no) throws SQLException {
		return elecDocumentDAO.selectAprvAttachList(aprv_no);
	}
	@Override
	public Map<String, String> getMyAprvCnt(String id) throws SQLException {
		Map<String, String> map = new HashMap<>();
		
		ElecDocumentVO vo = new ElecDocumentVO();
		vo.setEd_dftr(id);
		
		// 상신
		vo.setEd_aprvstt("DED01");
		String cnt = elecDocumentDAO.selectMyAprvStatusCnt(vo)+"";
		map.put("up", cnt);
		// 진행중
		vo.setEd_aprvstt("DED03");
		cnt = elecDocumentDAO.selectMyAprvStatusCnt(vo)+"";
		map.put("ing", cnt);
		// 완료
		vo.setEd_aprvstt("DED04");
		cnt = elecDocumentDAO.selectMyAprvStatusCnt(vo)+"";
		map.put("fin", cnt);
		// 반려
		vo.setEd_aprvstt("DED05");
		cnt = elecDocumentDAO.selectMyAprvStatusCnt(vo)+"";
		map.put("dan", cnt);
		
		return map;
	}
	@Override
	public List<ElecDocumentVO> getMyAprvList(SearchCriteria2 cri) throws SQLException {
		return elecDocumentDAO.selectMyAprvList(cri);
	}
	@Override
	public List<ElecDocumentVO> getMyAprvWaitList(SearchCriteria2 cri) throws SQLException {
		return elecDocumentDAO.selectMyAprvWaitList(cri);
	}
	@Override
	public List<ElecDocumentVO> getMyAprvIngList(SearchCriteria2 cri) throws SQLException {
		return elecDocumentDAO.selectMyAprvIngList(cri);
	}
	@Override
	public List<ElecDocumentVO> getMyReceiveList(SearchCriteria2 cri) throws SQLException {
		return elecDocumentDAO.selectMyReceiveList(cri);
	}
	
	public void setAutoAprv(String vactno, int gb) throws Exception{
		Class<?> forName;
		forName = Class.forName("com.gr.cg.dao.VacationDAOImpl");
		Object obj = forName.newInstance();
		
//		Method setSession = forName.getDeclaredMethod("setSqlSession", SqlSession.class);
//		Class<?> sqlSession = Class.forName("org.apache.ibatis.session.SqlSession");
//		Constructor<?> constructor = sqlSession.getConstructor();
//		Object sessionObj= constructor.newInstance();
//		Object sessionObj = sqlSession.newInstance();
		
		Field session = forName.getDeclaredField("session");
		boolean access = session.isAccessible();
		session.setAccessible(true);
		session.set(obj, sqlSession);
		session.setAccessible(access);
		
//		
//		setSession.invoke(obj, sessionObj);
		
		Class<?>[] partypes = new Class[2];
		partypes[0] = int.class;
		partypes[1] = int.class;
		Method method = forName.getDeclaredMethod("updateVactConfirm", partypes);
		method.invoke(obj, Integer.parseInt(vactno), gb);
	}
	@Override
	public String getAprvPafFile(int edno) throws SQLException {
		return aprvConsDAO.selectFinAprvPdf(edno);
	}
}

