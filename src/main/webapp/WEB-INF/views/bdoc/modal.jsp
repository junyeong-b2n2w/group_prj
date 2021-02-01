<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>

	<!-- 수정 모달 -->
	<div class="modal modal-blur fade" id="modal-report" tabindex="-1" style="display: none;" aria-hidden="true" data-keboard="false" data-backdrop="static">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">이름 수정</h5>
            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close" onclick="emptyContent()"></button>
          </div>
          <div class="modal-body">
            <div class="mb-3">
              <label class="form-label">변경할 이름 입력</label>
              <input type="hidden" name="bd_no">
              <input type="text" class="form-control" name="bd_nm" placeholder="변경할 파일명 또는 폴더명을 입력하세요">
            </div>
          </div>
          <div class="modal-footer">
            <a href="" class="btn btn-primary ms-auto" data-dismiss="modal" onclick="modify()">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
              	저장	
            </a>
            <a href="#" class="btn btn-link link-secondary" data-dismiss="modal" onclick="emptyContent()">
           		 취소
            </a>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 폴더 생성 -->
	<div class="modal modal-blur fade" id="modal-report2" tabindex="-1" style="display: none;" aria-hidden="true" data-keboard="false" data-backdrop="static">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">폴더 등록</h5>
            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close" onclick="emptyContent()"></button>
          </div>
          <div class="modal-body">
            <div class="mb-3">
              <label class="form-label">생성할 폴더의 이름 등록</label>
              <input type="text" class="form-control" name="folderName" placeholder="생성할 폴더명을 입력하세요">
            </div>
          </div>
          <div class="modal-footer">
            <a href="" class="btn btn-primary ms-auto" data-dismiss="modal" onclick="insertFolder()">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
              	등록	
            </a>
            <a href="#" class="btn btn-link link-secondary" data-dismiss="modal" onclick="emptyContent()">
           		 취소
            </a>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 폴더 생성2 -->
	<div class="modal modal-blur fade" id="modal-report3" tabindex="-1" style="display: none;" aria-hidden="true" data-keboard="false" data-backdrop="static">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">폴더 등록</h5>
            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close" onclick="emptyContent()"></button>
          </div>
          <div class="modal-body">
            <div class="mb-3">
              <label class="form-label">생성할 폴더의 이름 등록</label>
              <input type="text" class="form-control" name="folderName2" placeholder="생성할 폴더명을 입력하세요">
            </div>
          </div>
          <div class="modal-footer">
            <a href="" class="btn btn-primary ms-auto" data-dismiss="modal" onclick="insertFolderByButton()">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
              	등록	
            </a>
            <a href="#" class="btn btn-link link-secondary" data-dismiss="modal" onclick="emptyContent()">
           		 취소
            </a>
          </div>
        </div>
      </div>
    </div>
    
<script>

	function showinsertFolder(){
		$('#modal-report3').modal('show');
	}
	function insertFolderByButton(){
		
		const folderName = $('input[name="folderName2"]').val();
		if(folderName.length <1 || folderName == null){
			alert("이름을 입력해주세요");
			return false;
		}
		
		const folderupfd = $('.uploadedList').attr('data-num'); 
		
		$.ajax({
			url:"<%=request.getContextPath()%>/bdoc/registFolder.do",
			type:"post",
			data : { "bd_upfd" : folderupfd, "shareType" : pType, "bd_nm" : folderName},
			success: function(){
				makeTree(jsonArray);
				emptyContent();
				getFolerList();
				goFolder(pType,folderupfd );
			}	
		});
	}
	function insertFolder(){
		const folderName = $('input[name="folderName"]').val();
		if(folderName.length <1 || folderName == null){
			alert("이름을 입력해주세요");
			return false;
		}
		var newNode = { name:$('input[name="folderName"]').val() };
		if (zTree.getSelectedNodes()[0]) {
			newNode.checked = zTree.getSelectedNodes()[0].checked;
			newNode = zTree.addNodes(zTree.getSelectedNodes()[0], newNode);
		} else {
			newNode = zTree.addNodes(null, newNode);
		}
		$.ajax({
			url:"<%=request.getContextPath()%>/bdoc/registFolder.do",
			type:"post",
			data : { "bd_upfd" : newNode[0].pId, "shareType" : pType, "bd_nm" : newNode[0].name},
			success: function(){
				getFolerList();
				makeTree(jsonArray);
				emptyContent();
				goFolder(pType,newNode[0].pId );
			}	
		});
	}
	function emptyContent(){
		$('input[name="bd_nm"]').val("");
		$('input[name="folderName"]').val("");
		$('input[name="folderName2"]').val("");
	}
	function modify(){
		const bd_no = $('input[name="bd_no"]').val();
		const bd_nm = $('input[name="bd_nm"]').val();
		$.ajax({
			url:"<%=request.getContextPath()%>/bdoc/modify.do",
			type:"post",
			data : { "bd_no" : bd_no, "shareType" : pType, "bd_nm" : bd_nm},
			success: function(res){
				if(res == '성공'){
					emptyContent();
					goFolder(pType,$('#sortable2').attr('data-num'));
					getFolerList();
				}
			}	
		});
	}
</script>