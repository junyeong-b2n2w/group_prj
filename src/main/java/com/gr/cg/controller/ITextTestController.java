package com.gr.cg.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gr.cg.dto.ApprovalFormVO;
import com.gr.cg.dto.ApprovalRefVO;
import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.CompanyVO;
import com.gr.cg.dto.ComponentVO;
import com.gr.cg.dto.ConsensusVO;
import com.gr.cg.dto.ElecDocumentVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.FormComponentVO;
import com.gr.cg.dto.ReceiverVO;
import com.gr.cg.service.ApprovalFormService;
import com.gr.cg.service.CommonCodeService;
import com.gr.cg.service.CompanyService;
import com.gr.cg.service.ComponentService;
import com.gr.cg.service.ElecDocumentService;
import com.gr.cg.utils.CryptoAria;
import com.gr.cg.utils.GetUploadPath;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfGState;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

@Controller
public class ITextTestController {
	
	@Autowired
	private ElecDocumentService edocService;
	@Autowired
	private ApprovalFormService approvalFormService;
	@Autowired
	private CommonCodeService commonCodeService;
	@Autowired
	private ComponentService componentService;
	@Autowired
	private CompanyService companyService;
	@Resource(name = "cryptoService")
	private CryptoAria aria;
	
	@Resource(name="logoUploadPath")
	private String logoUploadPath;
//	@Resource(name="aprvUploadPath")
//	private String aprvUploadPath;
	static List<Map<String, Object>> codeList;
	
	@RequestMapping("/itext/test")
	void test(HttpServletResponse response, HttpSession session,@RequestParam(value="edno", defaultValue="86")int edno) throws DocumentException, IOException, SQLException {
		Document document = new Document(PageSize.A4, 50, 50, 50, 50); // 용지 및 여백 설정

		// PdfWriter 생성
//		 PdfWriter writer = PdfWriter.getInstance(document, new
//		 FileOutputStream("d:/test.pdf")); // 바로 다운로드.
		PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
		writer.setInitialLeading(12.5f);

		ElecDocumentVO edoc = edocService.getEdocForDetail(edno);

		// 파일 다운로드 설정
		response.setContentType("application/pdf");
		String savetitle = edoc.getEd_aprvtitle().replace("+", "_");
		String fileName = URLEncoder.encode(savetitle, "UTF-8");
		response.setHeader("Content-Transper-Encoding", "binary");
		response.setHeader("Content-Disposition", "inline; filename=" + fileName + ".pdf");

		// Document 오픈
		document.open();


		// HTML, 폰트 설정
		XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
		fontProvider.register("C:/group/font/MALGUN.TTF", "MalgunGotdic"); // MalgunGotdic은
																														// alias,
		CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);

		HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
		htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());

		
		
		
		
		//-----------------------
		
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		edocService.getAprvDates(edno, emp.getEmp_id());
		
		CompanyVO comVO = companyService.getCompany(emp.getEmp_compno());
		 
		PdfContentByte canvas = writer.getDirectContent();
		
		Image img = Image.getInstance(logoUploadPath+File.separator+comVO.getComp_logo() );
		img.scaleToFit(200, 200);
        img.setAbsolutePosition(PageSize.A4.getWidth()/2 - 100 , PageSize.A4.getHeight()/2  - 100);
        
        //배경 로고 이미지 넣기 
        PdfContentByte underCanvas = writer.getDirectContentUnder();
        PdfGState state = new PdfGState();
        state.setFillOpacity(0.2f);
        underCanvas.setGState(state);
        underCanvas.addImage(img);
        
        
        
		// 결재상태 확인용 map생성
		List<ApprovalVO> aprvList = edoc.getAprvList();
		List<ConsensusVO> consList = edoc.getConsList();
		Map<String, Object> codeMap = new HashMap<>();
		for(ApprovalVO vo : aprvList) {
			codeMap.put(vo.getAprv_empid(), vo);
		}
		for(ConsensusVO vo : consList) {
			codeMap.put(vo.getCons_empid(), vo);
		}
		
		
		codeList = commonCodeService.getCommonCodeList();
		
		// 저장된 양식 불러오기
		ApprovalFormVO form = approvalFormService.selectApprovalFormByAFNO(edoc.getEd_formno());
		List<FormComponentVO> formList = form.getFormComponentList();
		List<ComponentVO> comList = new ArrayList<>();
		for(FormComponentVO vo : formList) {
			ComponentVO componentVO = componentService.selectComponentByCPNO(vo.getFc_no());
			comList.add(componentVO);
		}
		
		List<ApprovalVO> allAprvLnList = edoc.getAllAprvLnList();
		
		Map<String, ApprovalVO> aprvMap = new HashMap<>();
		for(ApprovalVO vo : allAprvLnList) {
			aprvMap.put(vo.getAprv_empid(), vo);
		}

		
		
		//-----------------------
	


		
		//헤더
		makeHeader(edoc.getEd_deptnm().substring(0,3)+"-"+edoc.getEd_no(), edoc.getEd_empnm()).writeSelectedRows(0,-1, 20, document.top() + 20, canvas);

		makeLine().writeSelectedRows(0,-1, 20, document.top()-20, canvas);
		
		
		// 제목 
		PdfPTable titleTable = makeTitle(form.getAf_nm());
		float titlePosition = titleTable.writeSelectedRows(0, -1,0, document.top()-30, canvas);
		
		
		
		// 결재선 
		
		PdfPTable appLinesTable = makeApprovalLine(aprvList, edoc);
		float appLinesPosition = appLinesTable.writeSelectedRows(0, -1,document.right() - ( aprvList.size()*40+40), titlePosition - 20 , canvas);
		
		// 합의선
		float consLinePosition = appLinesPosition;
		if(consList.size() > 0) {
			PdfPTable consLinesTable = makeConsLine(consList);
			consLinePosition = consLinesTable.writeSelectedRows(0, -1,document.right() - ( consList.size()*40), appLinesPosition -5, canvas);
		}
		
		
		//결재양식
		List<FormComponentVO> aflist = form.getFormComponentList();
		
		
		PdfPTable appFormTable = makeApprovalForm(aflist, edoc);
		float appFromPosition = appFormTable.writeSelectedRows(0, -1,40, consLinePosition-30, canvas);
		
		
		
		
		PdfPTable contentTable = makeContent(edoc.getEd_aprv()); 
		float contentPosition = contentTable.writeSelectedRows(0, -1,60, appFromPosition-30, canvas);
		
		
		float bottomLine = makeLine().writeSelectedRows(0,-1, 20, contentPosition-50, canvas);
		
		
		PdfPTable sendListTable = makeSendList(edoc.getReciveList());
		float sendListPositoin = sendListTable.writeSelectedRows(0, -1,40, bottomLine-10, canvas);
		
		PdfPTable chamListTable = makeChamList(edoc.getReferList());
		float chamListPosition = chamListTable.writeSelectedRows(0, -1,40, sendListPositoin, canvas);
		
		Image sealImg = Image.getInstance(logoUploadPath+File.separator+comVO.getComp_seal() );
		sealImg.scaleToFit(75, 75);
		sealImg.setAbsolutePosition( (float) (PageSize.A4.getWidth()*0.65), chamListPosition-85);
        
        //배경 도장 이미지 넣기 
        PdfContentByte underSealCanvas = writer.getDirectContent();
        underSealCanvas.addImage(sealImg);
		
		PdfPTable bottomTitleTable = makeBottom(comVO.getComp_nm()+" 대표 "+ comVO.getComp_delgnm());
		float bottomTitlePosition = bottomTitleTable.writeSelectedRows(0, -1,0, chamListPosition-30, canvas);

		
		
		
		document.close();
		writer.close();
	}
	
	public String save(HttpServletResponse response, HttpSession session,int edno, Map<String,Object> serviceMap) throws DocumentException, IOException, SQLException {
		logoUploadPath = "c:/group/logo";
		Document document = new Document(PageSize.A4, 50, 50, 50, 50); // 용지 및 여백 설정
		edocService = (ElecDocumentService) serviceMap.get("edocService");
		approvalFormService = (ApprovalFormService) serviceMap.get("approvalFormService");
		commonCodeService = (CommonCodeService) serviceMap.get("commonCodeService");
		companyService = (CompanyService) serviceMap.get("companyService");
		componentService = (ComponentService) serviceMap.get("componentService");
		
		ElecDocumentVO edoc = edocService.getEdocForDetail(edno);
		
		String savetitle = URLEncoder.encode(edoc.getEd_aprvtitle().replace("+", "_"), "UTF-8");
		String fileName = URLEncoder.encode(savetitle, "UTF-8");
		String savePath = URLEncoder.encode(GetUploadPath.getUploadDatePath("c:/group/aprv/"), "UTF-8");
		File file = new File(savePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		String allFileLoc = savePath + File.separator +fileName; 
				//		 PdfWriter 생성
		PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(allFileLoc)); // 바로 다운로드.
//		PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
		writer.setInitialLeading(12.5f);
		
		
		// 파일 다운로드 설정
		response.setContentType("application/pdf");
		
		response.setHeader("Content-Transper-Encoding", "binary");
		response.setHeader("Content-Disposition", "inline; filename=" + fileName + ".pdf");
		
		// Document 오픈
		document.open();
		
		
		// HTML, 폰트 설정
		XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
		fontProvider.register("C:/group/font/MALGUN.TTF", "MalgunGotdic"); // MalgunGotdic은
		// alias,
		CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);
		
		HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
		htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
		
		
		
		
		
		//-----------------------
		
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		edocService.getAprvDates(edno, emp.getEmp_id());
		
		CompanyVO comVO = companyService.getCompany(emp.getEmp_compno());
		
		PdfContentByte canvas = writer.getDirectContent();
		
		Image img = Image.getInstance(logoUploadPath+File.separator+comVO.getComp_logo() );
		img.scaleToFit(200, 200);
		img.setAbsolutePosition(PageSize.A4.getWidth()/2 - 100 , PageSize.A4.getHeight()/2  - 100);
		
		//배경 로고 이미지 넣기 
		PdfContentByte underCanvas = writer.getDirectContentUnder();
		PdfGState state = new PdfGState();
		state.setFillOpacity(0.2f);
		underCanvas.setGState(state);
		underCanvas.addImage(img);
		
		
		
		// 결재상태 확인용 map생성
		List<ApprovalVO> aprvList = edoc.getAprvList();
		List<ConsensusVO> consList = edoc.getConsList();
		Map<String, Object> codeMap = new HashMap<>();
		for(ApprovalVO vo : aprvList) {
			codeMap.put(vo.getAprv_empid(), vo);
		}
		for(ConsensusVO vo : consList) {
			codeMap.put(vo.getCons_empid(), vo);
		}
		
		
		codeList = commonCodeService.getCommonCodeList();
		
		// 저장된 양식 불러오기
		ApprovalFormVO form = approvalFormService.selectApprovalFormByAFNO(edoc.getEd_formno());
		List<FormComponentVO> formList = form.getFormComponentList();
		List<ComponentVO> comList = new ArrayList<>();
		for(FormComponentVO vo : formList) {
			ComponentVO componentVO = componentService.selectComponentByCPNO(vo.getFc_no());
			comList.add(componentVO);
		}
		
		List<ApprovalVO> allAprvLnList = edoc.getAllAprvLnList();
		
		Map<String, ApprovalVO> aprvMap = new HashMap<>();
		for(ApprovalVO vo : allAprvLnList) {
			aprvMap.put(vo.getAprv_empid(), vo);
		}
		
		
		
		//-----------------------
		
		
		
		
		//헤더
		makeHeader(edoc.getEd_deptnm().substring(0,3)+"-"+edoc.getEd_no(), edoc.getEd_empnm()).writeSelectedRows(0,-1, 20, document.top() + 20, canvas);
		
		makeLine().writeSelectedRows(0,-1, 20, document.top()-20, canvas);
		
		
		// 제목 
		PdfPTable titleTable = makeTitle(form.getAf_nm());
		float titlePosition = titleTable.writeSelectedRows(0, -1,0, document.top()-30, canvas);
		
		
		
		// 결재선 
		
		PdfPTable appLinesTable = makeApprovalLine(aprvList, edoc);
		float appLinesPosition = appLinesTable.writeSelectedRows(0, -1,document.right() - ( aprvList.size()*40+40), titlePosition - 20 , canvas);
		
		// 합의선
		float consLinePosition = appLinesPosition;
		if(consList.size() > 0) {
			PdfPTable consLinesTable = makeConsLine(consList);
			consLinePosition = consLinesTable.writeSelectedRows(0, -1,document.right() - ( consList.size()*40), appLinesPosition -5, canvas);
		}
		
		
		//결재양식
		List<FormComponentVO> aflist = form.getFormComponentList();
		
		
		PdfPTable appFormTable = makeApprovalForm(aflist, edoc);
		float appFromPosition = appFormTable.writeSelectedRows(0, -1,40, consLinePosition-30, canvas);
		
		
		
		
		PdfPTable contentTable = makeContent(edoc.getEd_aprv()); 
		float contentPosition = contentTable.writeSelectedRows(0, -1,60, appFromPosition-30, canvas);
		
		
		float bottomLine = makeLine().writeSelectedRows(0,-1, 20, contentPosition-50, canvas);
		
		
		PdfPTable sendListTable = makeSendList(edoc.getReciveList());
		float sendListPositoin = sendListTable.writeSelectedRows(0, -1,40, bottomLine-10, canvas);
		
		PdfPTable chamListTable = makeChamList(edoc.getReferList());
		float chamListPosition = chamListTable.writeSelectedRows(0, -1,40, sendListPositoin, canvas);
		
		Image sealImg = Image.getInstance(logoUploadPath+File.separator+comVO.getComp_seal() );
		sealImg.scaleToFit(75, 75);
		sealImg.setAbsolutePosition( (float) (PageSize.A4.getWidth()*0.65), chamListPosition-85);
		
		//배경 도장 이미지 넣기 
		PdfContentByte underSealCanvas = writer.getDirectContent();
		underSealCanvas.addImage(sealImg);
		
		PdfPTable bottomTitleTable = makeBottom(comVO.getComp_nm()+" 대표 "+ comVO.getComp_delgnm());
		float bottomTitlePosition = bottomTitleTable.writeSelectedRows(0, -1,0, chamListPosition-30, canvas);
		
		
		
		
		document.close();
		writer.close();
		return allFileLoc;
	}
	
	
    private PdfPTable makeHeader(String doc_no, String writer) throws DocumentException, IOException {
        // 클래스패스 루트에 나눔고딕 폰트 추가(한글을 쓰기 위해서 한글폰트를 설정해 줘야됨)
        BaseFont base_font = BaseFont.createFont("C:/group/font/MALGUN.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

        Font font = new Font(base_font, 8);
        Font header_font = new Font(base_font, 8);

        PdfPTable table = new PdfPTable(4);
        table.setTotalWidth(new float[] { 80, 80, 80, 80 });
        table.setLockedWidth(true);

        PdfPCell cell = new PdfPCell(new Phrase("문서번호", header_font));
        cell.setFixedHeight(15);
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(doc_no, font));
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("작성자", header_font));
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(writer, font));
        table.addCell(cell);
        
        return table;
    }
    
    private PdfPTable makeTitle(String title) throws DocumentException, IOException {
        // 클래스패스 루트에 나눔고딕 폰트 추가(한글을 쓰기 위해서 한글폰트를 설정해 줘야됨)
        BaseFont base_font = BaseFont.createFont("C:/group/font/MALGUN.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

        Font font = new Font(base_font, 20);
        PdfPTable table = new PdfPTable(1);
        table.setTotalWidth(PageSize.A4.getWidth());
        table.setLockedWidth(true);

        Chunk chTitle = new Chunk(title);
        chTitle.setUnderline(1, -3f);
        chTitle.setFont(font);
        chTitle.setCharacterSpacing(5);
        
        
        PdfPCell cell = new PdfPCell(  new Phrase( chTitle));
        cell.setFixedHeight(30);
        cell.setBorder(0); // 0 선없음
        cell.setHorizontalAlignment(1); //0 좌측정렬 1. 가운데정렬 2 우측정렬
        table.addCell(cell);

        
        return table;
        
    }

    private String whatCode(String code) {
    	
    	String name = "";
    	for(Map<String,Object> co : codeList) {
    		if(co.get("CC_CONT").equals(code)) {
    			name = co.get("CC_NM").toString();
    		}
    	}
    	return name;
    }
    
    
    private PdfPTable makeApprovalLine(List<ApprovalVO> aprvList, ElecDocumentVO edoc) throws DocumentException, IOException {
        // 클래스패스 루트에 나눔고딕 폰트 추가(한글을 쓰기 위해서 한글폰트를 설정해 줘야됨)
        BaseFont base_font = BaseFont.createFont("C:/group/font/MALGUN.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

        Font font = new Font(base_font, 8);
        PdfPTable table = new PdfPTable(aprvList.size() +2);
        float[] apprvalBox = new float[aprvList.size() +2] ;
        apprvalBox[0] = 20F;
        
        for(int i = 0; i < aprvList.size()+1; i++) {
        	apprvalBox[i+1] = 40f;
        }
        
        table.setTotalWidth(apprvalBox);
        table.setLockedWidth(true);
        
        PdfPCell cell = new PdfPCell(new Phrase("발\n신\n부\n서", font));
        
        cell.setHorizontalAlignment(1); //0 좌측정렬 1. 가운데정렬 2 우측정렬
        cell.setRowspan(2);
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        table.addCell(cell);
        
        cell = new PdfPCell(new Phrase(edoc.getEd_ranknm(), font));
    	cell.setFixedHeight(15);
        cell.setHorizontalAlignment(1); //0 좌측정렬 1. 가운데정렬 2 우측정렬
        cell.setVerticalAlignment(1);
        table.addCell(cell);
        
        
        
        for(ApprovalVO apVO : aprvList) {
        	cell = new PdfPCell(new Phrase(apVO.getRank_nm(), font));
        	cell.setFixedHeight(15);
            cell.setHorizontalAlignment(1); //0 좌측정렬 1. 가운데정렬 2 우측정렬
            cell.setVerticalAlignment(1);
            table.addCell(cell);
        }
        
        cell = new PdfPCell(new Phrase(edoc.getEd_empnm()+"\n(기안)", font));
    	cell.setFixedHeight(25);
        cell.setHorizontalAlignment(1); //0 좌측정렬 1. 가운데정렬 2 우측정렬
        cell.setVerticalAlignment(1);
        table.addCell(cell);
        
        
        for(ApprovalVO apVO : aprvList) {
        	
        	cell = new PdfPCell(new Phrase(apVO.getEmp_nm()+"\n"+whatCode(apVO.getAprv_as()), font));
        	cell.setFixedHeight(25);
            cell.setHorizontalAlignment(1); //0 좌측정렬 1. 가운데정렬 2 우측정렬
            cell.setVerticalAlignment(1);
            table.addCell(cell);
        }

        
        return table;
        
    }
    
    private PdfPTable makeConsLine(List<ConsensusVO> consList) throws DocumentException, IOException {
        // 클래스패스 루트에 나눔고딕 폰트 추가(한글을 쓰기 위해서 한글폰트를 설정해 줘야됨)
        BaseFont base_font = BaseFont.createFont("C:/group/font/MALGUN.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

        Font font = new Font(base_font, 8);
        PdfPTable table = new PdfPTable(consList.size() +1);
        float[] apprvalBox = new float[consList.size() +1] ;
        apprvalBox[0] = 20F;
        
        for(int i = 0; i < consList.size(); i++) {
        	apprvalBox[i+1] = 40f;
        }
        
        table.setTotalWidth(apprvalBox);
        table.setLockedWidth(true);
        
        PdfPCell cell = new PdfPCell(new Phrase("합\n\n의", font));
        
        cell.setHorizontalAlignment(1); //0 좌측정렬 1. 가운데정렬 2 우측정렬
        cell.setRowspan(2);
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
        table.addCell(cell);
        
        
        
        for (ConsensusVO conVO : consList) {
        	cell = new PdfPCell(new Phrase(conVO.getRank_nm(), font));
        	cell.setFixedHeight(15);
            cell.setHorizontalAlignment(1); //0 좌측정렬 1. 가운데정렬 2 우측정렬
            cell.setVerticalAlignment(1);
            table.addCell(cell);
        }
        
        for (ConsensusVO conVO : consList) {
        	
        	cell = new PdfPCell(new Phrase(conVO.getEmp_nm()+"\n"+whatCode(conVO.getCons_agrestt()), font));
        	cell.setFixedHeight(25);
            cell.setHorizontalAlignment(1); //0 좌측정렬 1. 가운데정렬 2 우측정렬
            cell.setVerticalAlignment(1);
            table.addCell(cell);
        }

        
        return table;
        
    }
    
    
    private PdfPTable makeApprovalForm(List<FormComponentVO> formCompList, ElecDocumentVO edoc) throws DocumentException, IOException {
        // 클래스패스 루트에 나눔고딕 폰트 추가(한글을 쓰기 위해서 한글폰트를 설정해 줘야됨)
        BaseFont base_font = BaseFont.createFont("C:/group/font/MALGUN.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

        Font font = new Font(base_font, 10);
        PdfPTable table = new PdfPTable(8 );
        table.setTotalWidth(PageSize.A4.getWidth()-80);
        table.setLockedWidth(true);
        
        PdfPCell cell = new PdfPCell(new Phrase("합\n의", font));
        
        
        
        
        
        for(int i = 0; i < formCompList.size(); i++) {
        	System.out.println(formCompList.get(i));
        	int fc_no = formCompList.get(i).getFc_no();
        	ComponentVO comp = componentService.selectComponentByCPNO(fc_no);
        	
        	cell = new PdfPCell(new Phrase(comp.getCp_nm(), font));
            cell.setHorizontalAlignment(1); //0 좌측정렬 1. 가운데정렬 2 우측정렬
            cell.setVerticalAlignment(1);
            cell.setMinimumHeight(20);
            cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
            table.addCell(cell);

            //내용 가져오는 방법
            String value = "";
            if(comp.getCp_tag().equals("aprvReciveTarget")) {
            	value = "하단참조";
            }else if (comp.getCp_tag().equals("aprvReference")) {
            	value = "하단참조";
            }else if(comp.getCp_tag().equals("aprvEdocNumber")){
            	value = edoc.getEd_deptnm().substring(0,3)+"-"+edoc.getEd_no();
            }else if(comp.getCp_tag().equals("aprvTaskNumber")){
            	if(edoc.getEd_taskno() == null || edoc.getEd_taskno().equals("")) {
            		value="없음";
            	}else {
            		value = edoc.getEd_taskno();
            	}
            	
            }else if(comp.getCp_tag().equals("aprvRegistUser")){
            	value = edoc.getEd_empnm();
            }else if(comp.getCp_tag().equals("aprvRegDate")){
            	value = edoc.getEd_regymd().toString().substring(0,10);
            }else if(comp.getCp_tag().equals("aprvTitle")){
            	value = edoc.getEd_aprvtitle();
            }else if(comp.getCp_tag().equals("aprvDept")){
            	value = edoc.getEd_deptnm();
            }
            
        	cell = new PdfPCell(new Phrase(value, font));
        	
        	if(comp.getCp_cont().split(",")[0].equals("624")) {
        		cell.setColspan(7);
        	}else if(comp.getCp_cont().split(",")[0].equals("312")) {
        		cell.setColspan(3);
        	}else if(comp.getCp_cont().split(",")[0].equals("312")) {
        		cell.setColspan(1);
        	}
        	
        	
        	cell.setMinimumHeight(20);
            cell.setHorizontalAlignment(0); //0 좌측정렬 1. 가운데정렬 2 우측정렬
            cell.setVerticalAlignment(1);
            table.addCell(cell);

        }
       

        
        return table;
        
    }
    
    private PdfPTable makeContent(String content) throws DocumentException, IOException {
        // 클래스패스 루트에 나눔고딕 폰트 추가(한글을 쓰기 위해서 한글폰트를 설정해 줘야됨)
        BaseFont base_font = BaseFont.createFont("C:/group/font/MALGUN.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

        Font font = new Font(base_font, 10);
        PdfPTable table = new PdfPTable(1);
        
        
        content = content.replaceAll("<li[^>]*>", "    -");
        content = content.replaceAll("</[^>]*>", "\n");
        content = content.replaceAll("<[^>]*>", "");
        
        
        table.setTotalWidth(PageSize.A4.getWidth()-120);
        table.setLockedWidth(true);
        
        PdfPCell cell = new PdfPCell( new Phrase(content, font) );
        cell.setBorder(0); // 0 선없음
        cell.setHorizontalAlignment(0); //0 좌측정렬 1. 가운데정렬 2 우측정렬
        table.addCell(cell);
        
        return table;
        
    }
    
    private PdfPTable makeLine() throws DocumentException, IOException {
        PdfPTable table = new PdfPTable(1);
        
        
        table.setTotalWidth(PageSize.A4.getWidth()-40);
        table.setLockedWidth(true);
        
        PdfPCell cell = new PdfPCell();
        cell.setBorder(1); // 0 선없음
        cell.setBorderColorTop(BaseColor.LIGHT_GRAY);
        cell.setFixedHeight(1);
        table.addCell(cell);
        
        return table;
    	
    }
    
    private PdfPTable makeSendList(List<ReceiverVO> reciveList) throws DocumentException, IOException {
        // 클래스패스 루트에 나눔고딕 폰트 추가(한글을 쓰기 위해서 한글폰트를 설정해 줘야됨)
        BaseFont base_font = BaseFont.createFont("C:/group/font/MALGUN.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

        
        
        Font font = new Font(base_font, 8);
        PdfPTable table = new PdfPTable(10);
        
        
        table.setTotalWidth(PageSize.A4.getWidth()-40);
        table.setLockedWidth(true);
        
        
        
        PdfPCell cell = new PdfPCell(new Phrase("수신 : ", font));
        cell.setBorder(0); // 0 선없음
        cell.setHorizontalAlignment(2); //0 좌측정렬 1. 가운데정렬 2 우측정렬
        table.addCell(cell);
       
        String value= "";
        for(int i =0 ; i <  reciveList.size(); i++) {
        	if(i != 0) {
        		value += value;
        	}
        	value += reciveList.get(i).getDept_nm()+" "+ reciveList.get(i).getRank_nm() +" "+ reciveList.get(i).getEmp_nm();
        }
        
        
        
        cell = new PdfPCell(new Phrase(value, font));
        cell.setBorder(0); // 0 선없음
        cell.setColspan(9);
        cell.setHorizontalAlignment(0); //0 좌측정렬 1. 가운데정렬 2 우측정렬
        table.addCell(cell);
        
        return table;
        
    }
    private PdfPTable makeChamList(List<ApprovalRefVO> refList) throws DocumentException, IOException {
        // 클래스패스 루트에 나눔고딕 폰트 추가(한글을 쓰기 위해서 한글폰트를 설정해 줘야됨)
        BaseFont base_font = BaseFont.createFont("C:/group/font/MALGUN.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

        
        
        Font font = new Font(base_font, 8);
        PdfPTable table = new PdfPTable(10);
        
        
        table.setTotalWidth(PageSize.A4.getWidth()-40);
        table.setLockedWidth(true);
        
        PdfPCell cell = new PdfPCell(new Phrase("참조 : ", font));
        cell.setBorder(0); // 0 선없음
        cell.setHorizontalAlignment(2); //0 좌측정렬 1. 가운데정렬 2 우측정렬
        table.addCell(cell);
        

        String value= "";
        for(int i =0 ; i <  refList.size(); i++) {
        	if(i != 0) {
        		value += value;
        	}
        	value += refList.get(i).getDept_nm()+" "+ refList.get(i).getRank_nm() +" "+ refList.get(i).getEmp_nm();
        }
        
        cell = new PdfPCell(new Phrase(value, font));
        cell.setBorder(0); // 0 선없음
        cell.setColspan(9);
        cell.setHorizontalAlignment(0); //0 좌측정렬 1. 가운데정렬 2 우측정렬
        table.addCell(cell);
        
        return table;
        
    }
    
    private PdfPTable makeBottom(String bottom) throws DocumentException, IOException {
        // 클래스패스 루트에 나눔고딕 폰트 추가(한글을 쓰기 위해서 한글폰트를 설정해 줘야됨)
        BaseFont base_font = BaseFont.createFont("C:/group/font/MALGUN.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

        Font font = new Font(base_font, 16);
        PdfPTable table = new PdfPTable(1);
        table.setTotalWidth(PageSize.A4.getWidth());
        table.setLockedWidth(true);

        Chunk chTitle = new Chunk(bottom);
        chTitle.setFont(font);
        chTitle.setCharacterSpacing(5);
        
        
        PdfPCell cell = new PdfPCell(  new Phrase( chTitle));
        cell.setFixedHeight(30);
        cell.setBorder(0); // 0 선없음
        cell.setHorizontalAlignment(1); //0 좌측정렬 1. 가운데정렬 2 우측정렬
        table.addCell(cell);

        
        return table;
        
    }
    
}
