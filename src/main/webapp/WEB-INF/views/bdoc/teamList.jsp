<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/zTree.v3/3.5.42/js/jquery.ztree.all.min.js"></script>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/ztree/metroStyle/metroStyle2.css"/>

<style>
.fileDrop{
	width:100%;
	height:700px;
/* 	border:1px dotted blue;	 */
	overflow:scroll;
}
small{
	margin-left:3px;
	font-weight:bold;
	color:gray;
}
 #sortable2 .ui-selecting { background: #FECA40; }
  #sortable2 .ui-selected { background: #F39814; color: white; }
  #sortable2 {margin: 0; padding: 0; width: 100%; }
  #sortable2 li {
  	list-style-type: none; 
    margin: 50px 17px 3px 3px;
    padding: 15px;
    float: left;
    width: 15%;
    height: 10%;
    text-align: center; 
    background: white;}

</style>
</head>
<body onload="getFolerList()">
	<div class="container-fluid">
		<div class="row">
			<h1>부서 문서</h1>
			<div class="col-sm-2">
				<ul id="tree" class="ztree" style="width:100%;overflow:auto;text-align: center;"></ul>
			</div>
			<div class="col-sm-10">
				<div class="row">
					<div class="col" style="text-align: right; position: sticky">
						<button type="button" id='submitBtn' class="btn btn-primary" onclick="showinsertFolder();">폴더 등록</button>
						<button type="button" id='submitBtn' class="btn btn-primary" onclick="ajaxFileUpload();">파일 등록</button>
						<button type="button" id='submitBtn' class="btn btn-primary" onclick="remove();">삭제</button>
						<button type="button" id='submitBtn' class="btn btn-primary" onclick="goDownload();">다운로드</button>
						<button type="button" id='submitBtn' class="btn btn-primary" onclick="AllDownload();">전체 다운로드</button>
					</div>
				</div>
				<div class="fileDrop">
					<ul id="sortable2" class="uploadedList" data-num="0">
						<c:forEach var="bdoc" items="${bdocList}">
						 	<c:if test="${bdoc.bd_nm eq null }">
								<li class="ui-state-default File" onmouseup="rightClickTest(event)">
									<div style="float: left;">
									 	<input type="checkbox" class="check" data-no="${bdoc.bd_no }" data-key="${bdoc.bd_attckey}">
									</div>
									 <div>
										 <a class='thumnail sortclass' href="<%=request.getContextPath()%>/file/getFile.do?attc_no=${bdoc.attc_no }&attc_key=${bdoc.bd_attckey }">
											<c:choose>
													<c:when test="${fn:toLowerCase(bdoc.attc_extn) eq 'pdf'}">
														<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/PDF.png" style="width: 70px;height: 70px; margin-right: 10%;">	
													</c:when>
													<c:when test="${fn:toLowerCase(bdoc.attc_extn) eq 'png'}">
														<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/PNG.png" style="width: 70px;height: 70px; margin-right: 10%;">	
													</c:when>
													<c:when test="${fn:toLowerCase(bdoc.attc_extn) eq 'jpg'}">
														<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/JPG.png" style="width: 70px;height: 70px; margin-right: 10%;">	
													</c:when>
													<c:when test="${fn:toLowerCase(bdoc.attc_extn) eq 'jpeg'}">
														<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/JPEG.png" style="width: 70px;height: 70px; margin-right: 10%;">	
													</c:when>
													<c:when test="${fn:toLowerCase(bdoc.attc_extn) eq 'xls'}">
														<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/XLS.png" style="width: 70px;height: 70px; margin-right: 10%;">	
													</c:when>
													<c:when test="${fn:toLowerCase(bdoc.attc_extn) eq 'xlsx'}">
														<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/XLSX.png" style="width: 70px;height: 70px; margin-right: 10%;">	
													</c:when>
													<c:when test="${fn:toLowerCase(bdoc.attc_extn) eq 'ppt'}">
														<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/PPT.png" style="width: 70px;height: 70px; margin-right: 10%;">	
													</c:when>
													<c:when test="${fn:toLowerCase(bdoc.attc_extn) eq 'pptx'}">
														<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/PPTX.png" style="width: 70px;height: 70px; margin-right: 10%;">	
													</c:when>
													<c:when test="${fn:toLowerCase(bdoc.attc_extn) eq 'hwp'}">
														<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/hwp2.png" style="width: 70px;height: 70px; margin-right: 10%;">	
													</c:when>
													<c:when test="${fn:toLowerCase(bdoc.attc_extn) eq 'doc'}">
														<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/Microsoft Word.png" style="width: 70px;height: 70px; margin-right: 10%;">	
													</c:when>
													<c:otherwise>
														<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/else.png" style="width: 70px;height: 70px; margin-right: 10%;">	
													</c:otherwise>
												</c:choose>
										 </a>
										 	<span class="mainBox"style="font-weight: bold; display: block; margin: 12px; overflow: hidden; text-overflow:ellipsis;  white-space:nowrap;">
											${bdoc.attc_extnm}
											</span>
										 <small data-no="${bdoc.bd_no }" data-key="${bdoc.bd_attckey}" class="deleteFile" >
										 </small>
									 </div>
						 			</li>
							 	</c:if>
							 	
							 	<c:if test="${bdoc.bd_nm ne null}">
							 		<li class="ui-state-default Folder" onmouseup="rightClickTest(event)">
							 		<div style="float: left;">
									 	<input type="checkbox" class="check" data-no="${bdoc.bd_no }" data-key="${bdoc.bd_attckey}">
									</div>
							 			<div>
									 		<a class='thumnail sortclass' href="javascript:goFolder(1,${bdoc.bd_no},${bdoc.upfolder});">
											 	<i class="fas fa-folder fa-5x"></i>
											 </a>
											 	<span class="mainBox"style="font-weight: bold; display: block; margin: 12px; overflow: hidden; text-overflow:ellipsis;  white-space:nowrap;">
												${bdoc.bd_nm}
												</span>
											 <small data-no="${bdoc.bd_no}" data-key="${bdoc.bd_attckey}" class="deleteFile">
											 </small>
										 </div>
									 </li>
							 	</c:if>
							 
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
<!-- 		<div class="row"> -->
<!-- 			<div class="col-sm-12" style="text-align: right;"> -->
<!-- 				<button type="button" id='submitBtn' class="btn btn-primary" onclick="moveFile()">확인</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
	<input multiple="multiple" type="file" id="ajaxFile" onChange="fileChange();" style="display:none;"/>

<script>
const pType = 1;	
let fileNo;
function setFileNo(fiNo){
	fileNo=fiNo;
}
	function modifyForm(btn){
		const parent = btn.parentNode;
		const delbtn = parent.previousSibling.nextSibling;
		const bd_no = delbtn.getAttribute("data-no");
	    $('input[name="bd_no"]').val(bd_no);				
	}

	function goFolder(shareType,upfd,before){
		$.ajax({
			url:"<%=request.getContextPath()%>/bdoc/getBdocList.do",
			type:"post",
			data : {"upfd" : upfd, "shareType" : pType},
			success: function(res){
				if(res != null){
					$('.File').draggable("destroy");
					$('.Folder').draggable("destroy");
					$('.Folder').droppable("destroy");
					$('#sortable2').empty();
					$('#sortable2').attr('data-num',upfd);
					// 이전 폴더 생성
					code = "";
					if(typeof res == "number"){
						code += '<li class="ui-state-default Folder">'; 
						code += '<div>';
						code += '<a class="thumnail sortclass beforeFolder" idx="'+res+'" href="javascript:goFolder('+shareType+','+res+');">';
						code += '<i class="fas fa-folder fa-5x"></i>';
						code += '<span class="mainBox"style="font-weight: bold; display: block; margin: 12px;">';
						code += '상위 폴더로';
						code += '</span>';
						code += '</a>';
						code += '<small data-no="'+res+'" class="deleteFile" style="opacity:0;">';
						code += '</small>';
						code += '</div>';
						code += '</li>'; 
					}else{
						if(upfd != 0){
							code += '<li class="ui-state-default Folder">'; 
							code += '<div>';
							code += '<a class="thumnail sortclass beforeFolder" idx="'+res[0].upfolder+'" href="javascript:goFolder('+shareType+','+res[0].upfolder+');">';
							code += '<i class="fas fa-folder fa-5x"></i>';
							code += '<span class="mainBox"style="font-weight: bold; display: block; margin: 12px;">';
							code += '상위 폴더로';
							code += '</span>';
							code += '</a>';
							code += '<small data-no="'+res[0].upfolder+'" class="deleteFile" style="opacity:0;">';
							code += '</small>';
							code += '</div>';
							code += '</li>'; 
						}
						for(let i=0; i<res.length; i++){
							
							// 파일일 경우
							if(res[i].bd_fileyn == 'Y'){
								code += '<li class="ui-state-default File" onmouseup="rightClickTest(event)" >'; 
								code += '<div style="float: left;">';
								code += '<input type="checkbox" class="check" data-no="'+res[i].bd_no+'" data-key="'+res[i].bd_attckey+'">';
								code += '</div>';
								code += '<div>';
								code += '<a class="thumnail sortclass" href="<%=request.getContextPath()%>/file/getFile.do?attc_no='+ res[i].attc_no +'&attc_key='+ res[i].bd_attckey+'">'
								if(res[i].attc_extn.toLowerCase() == 'pdf' ){
									code += '<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/PDF.png" style="width: 70px;height: 70px; margin-right: 10%;">';	
								}else if(res[i].attc_extn.toLowerCase() == 'png' ){
									code += '<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/PNG.png" style="width: 70px;height: 70px; margin-right: 10%;">';	
								}else if(res[i].attc_extn.toLowerCase() == 'jpg' ){
									code += '<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/JPG.png" style="width: 70px;height: 70px; margin-right: 10%;">';	
								}else if(res[i].attc_extn.toLowerCase() == 'jpeg' ){
									code += '<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/JPEG.png" style="width: 70px;height: 70px; margin-right: 10%;">';	
								}else if(res[i].attc_extn.toLowerCase() == 'xls' ){
									code += '<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/XLS.png" style="width: 70px;height: 70px; margin-right: 10%;">';	
								}else if(res[i].attc_extn.toLowerCase() == 'xlsx' ){
									code += '<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/XLSX.png" style="width: 70px;height: 70px; margin-right: 10%;">';	
								}else if(res[i].attc_extn.toLowerCase() == 'ppt' ){
									code += '<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/PPT.png" style="width: 70px;height: 70px; margin-right: 10%;">';	
								}else if(res[i].attc_extn.toLowerCase()== 'pptx' ){
									code += '<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/PPTX.png" style="width: 70px;height: 70px; margin-right: 10%;">';	
								}else if(res[i].attc_extn.toLowerCase()== 'hwp' ){
									code += '<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/hwp2.png" style="width: 70px;height: 70px; margin-right: 10%;">';	
								}else if(res[i].attc_extn.toLowerCase()== 'doc' ){
									code += '<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/Microsoft Word.png" style="width: 70px;height: 70px; margin-right: 10%;">';	
								}else {
									code += '<img alt="pdf" src="<%=request.getContextPath()%>/resources/img/else.png" style="width: 70px;height: 70px; margin-right: 10%;">';	
								}
								code += '<span class="mainBox"style="font-weight: bold; display: block; margin: 12px; overflow: hidden; text-overflow:ellipsis;  white-space:nowrap;">';
								code += res[i].attc_extnm;
								code += '</span>';
								code += '</a>';
								code += '<small data-no="'+res[i].bd_no+'" data-key="'+res[i].bd_attckey+'"  class="deleteFile" >';
								code += '</small>';
								code += '</div>';
								code += '</li>';
							}else if(res[i].bd_fileyn == 'N'){ // 폴더일 경우
								code += '<li class="ui-state-default Folder" onmouseup="rightClickTest(event)">'; 
								code += '<div style="float: left;">';
								code += '<input type="checkbox" class="check" data-no="'+res[i].bd_no+'" data-key="'+res[i].bd_attckey+'">';
								code += '</div>';
								code += '<div>';
								code += '<a class="thumnail sortclass" href="javascript:goFolder('+shareType+','+res[i].bd_no+','+res[i].upfolder+');">';
								code += '<i class="fas fa-folder fa-5x"></i>';
								code += '<span class="mainBox"style="font-weight: bold; display: block; margin: 12px; overflow: hidden; text-overflow:ellipsis;  white-space:nowrap;">';
								code += res[i].bd_nm;
								code += '</span>';
								code += '</a>';
								code += '<small data-no="'+res[i].bd_no+'" data-key="'+res[i].bd_attckey+'" class="deleteFile">';
								code += '</small>';
								code += '</div>';
								code += '</li>'; 
							}
						}
						
					}
					
					
					$('#sortable2').html(code);
					$('.File').draggable({ revert: "invalid" ,
						 start: function( event, ui ) {
							 setFileNo($(this).find('small').attr('data-no'));
						 }
					});
					$('.Folder').draggable({ revert: "invalid" ,
						 start: function( event, ui ) {
							 setFileNo($(this).find('small').attr('data-no'));
						 }
					});
					$( ".Folder" ).droppable({
			// 		      classes: {
			// 		      },
					      drop: function( event, ui ) {
					    	  folderNo = $(this).find('small').attr('data-no');
					    	  $.ajax({
					  			url:"<%=request.getContextPath()%>/bdoc/moveitem.do",
					  			type:"post",
					  			data : { "bd_upfd" : folderNo, "shareType" : pType, "bd_no" : fileNo},
					  			success: function(){
					  				getFolerList();
					  				makeTree(jsonArray);
					  				$('small[data-no="'+fileNo+'"]').closest("li").remove();
					  			}	
					  		});
					      }
					    });
				}
			},
			dataType : "json"
		});
	}


	function remove(){
		const flag = confirm("삭제?");
		if(flag){
			
			const fileList = document.querySelectorAll('.check');
			
			let bdnoList = [];
			for(let i = 0; i<fileList.length; i++){
				if(fileList[i].checked){
					bdnoList.push(fileList[i].getAttribute('data-no'));
				}
			}
			
			$.ajax({
				url:"<%=request.getContextPath()%>/bdoc/remove.do",
				type:"post",
				traditional : true,
				data : { "bd_no" : bdnoList, "removeType" : pType},
				success: function(res){
					if(res == '성공'){
						getFolerList();
						goFolder(pType,$('.uploadedList').attr('data-num'));
					}
				}	
			});
		}
	}

	
	$(this).on("dragenter dragover drop",function(event){
		//event.preventDefault();
		return false;
	});
	$(".fileDrop").on("dragenter dragover",function(event){
		return false;
	});
	
	$(".fileDrop").on("drop",function(event){
		//event.preventDefault();		
		//alert("drop");
		
		if(event.originalEvent.dataTransfer){
			var files=event.originalEvent.dataTransfer.files;
			
			for(var i=0;i<files.length;i++){
				sleep(500);
				addFile(files[i]);
			}
		}
		
		
		return false;
	});
	
	function fileChange(){
		const fileList = $('#ajaxFile')[0].files;
		
		for(let i=0; i<fileList.length; i++){
			sleep(500);
			addFile(fileList[i]);
		}
	}
	
	function sleep(ms) {
		  const wakeUpTime = Date.now() + ms
		  while (Date.now() < wakeUpTime) {}
	}
	
	
	function moveFile(){
		const small = document.querySelectorAll('.newFile');
		let upfd = $('#sortable2').attr('data-num');
		console.log(small.length);
		for(let i = 0; i<small.length; i++){
			$.ajax({
				url:"<%=request.getContextPath()%>/bdoc/regist.do",
				type:"post",
				traditional : true,
				data : { "ta_no" : small[i].getAttribute('data-src'), "shareType" : pType, "upfd" : upfd},
				success: function(res){
					if(res != "실패"){
						goFolder(pType,upfd);
						$(".uploadedList").empty();
					}
				}
			});
		}
		
	}
	
	
	function addFile(file){
		var formData=new FormData();
		formData.append("file",file);
		

		$.ajax({
			url:"<%=request.getContextPath()%>/file/upload",
			type:"post",
			data:formData,
			contentType:false,
			processData:false,
			dataType : "json",
			success:function(data){
				//alert(data);
				var str="";
					/* 텍스트  */
// 					str="<div><a class='thumnail' href='displayFile?fileName="+data+"'>"
					str="<div style='display: none;'><a class='thumnail'>"
						 +data.filename+"</a>"
						 +"<small data-src='"+data.ta_no+"' class='newFile'>"
						 +"<button>X</button></small></div>";
				
				
				$(".uploadedList").html(str);
				moveFile();
			}
		});		
		
	}
	
	$('#uploadedList').on('click','small',function(event){
// 		alert('x btn click');
		
	});
	
	
	
		window.addEventListener("load", function() {
			$('.File').draggable({ revert: "invalid" ,
				 start: function( event, ui ) {
					 setFileNo($(this).find('small').attr('data-no'));
				 }
			});
			$('.Folder').draggable({ revert: "invalid" ,
				 start: function( event, ui ) {
					 setFileNo($(this).find('small').attr('data-no'));
				 }
			});
			$( ".Folder" ).droppable({
	// 		      classes: {
	// 		      },
			      drop: function( event, ui ) {
			    	  folderNo = $(this).find('small').attr('data-no');
			    	  console.log(fileNo);
			    	  $.ajax({
			  			url:"<%=request.getContextPath()%>/bdoc/moveitem.do",
			  			type:"post",
			  			data : { "bd_upfd" : folderNo, "shareType" : pType, "bd_no" : fileNo},
			  			success: function(){
			  				getFolerList();
			  				makeTree(jsonArray);
			  				$('small[data-no="'+fileNo+'"]').closest("li").remove();
			  			}	
			  		});
			      }
		    });
		});
		
		function goDownload(){
			const fileList = document.querySelectorAll('.check');
			
			let bdnoList = [];
			let keyList = [];
			for(let i = 0; i<fileList.length; i++){
				if(fileList[i].checked){
					bdnoList.push(fileList[i].getAttribute('data-no'));
					keyList.push(fileList[i].getAttribute('data-key'));
				}
			}
			
			if(bdnoList.length != keyList.length ){
				return false;
			}
			
			const form = document.createElement("form");
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "Post");  //Post 방식
			form.setAttribute("action", "<%=request.getContextPath()%>/bdoc/download.do"); //요청 보낼 주소
			
			for(let i = 0; i<bdnoList.length; i++){
				const key = document.createElement("input");
				key.setAttribute("type", "hidden");
				key.setAttribute("name", "bd_attckey");
				key.setAttribute("value", keyList[i]);
				
				const no = document.createElement("input");
				no.setAttribute("type", "hidden");
				no.setAttribute("name", "bd_no");
				no.setAttribute("value", bdnoList[i]);
				
				form.appendChild(key);
				form.appendChild(no);
			}
			document.body.appendChild(form);
			form.submit();
		}
		
		function AllDownload() {
			const form = document.createElement("form");
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "Post");  //Post 방식
			form.setAttribute("action", "<%=request.getContextPath()%>/bdoc/download.do"); //요청 보낼 주소
			
			const no = document.createElement("input");
			no.setAttribute("type", "hidden");
			no.setAttribute("name", "bd_upfd");
			no.setAttribute("value", $('#sortable2').attr('data-num'));
			
			form.appendChild(no);
			document.body.appendChild(form);
// 			console.log(form);
			form.submit();
		}
		
		function ajaxFileUpload() {
	        $("#ajaxFile").click();
	    }

</script>
<%@ include file="modal.jsp" %>	
<%@ include file="list_js.jsp" %>
<%@ include file="deptContextMenu.jsp" %>









