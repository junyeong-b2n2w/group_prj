<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    

  <body class="antialiased border-top-wide border-primary d-flex flex-column">
    <div class="flex-fill d-flex flex-column justify-content-center py-4">
      <div class="container-tight py-6">
		<div class="modal-dialog modal-dialog-centered" role="document">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title">비밀번호 변경</h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			  <div class="row mb-3 align-items-end">
				
				<div class="col">
				  <label class="form-label">기존 비밀번호</label>
				  <input type="password" name="old_pass" class="form-control">
				</div>
			  </div>
			  <div class="row mb-3 align-items-end">
				
				<div class="col">
				  <label class="form-label">새로운 비밀번호</label>
				  <input type="password" name="new_pass" placeholder="영어, 숫자, 특수문자 9~16자리 조합" class="form-control is-invalid">
				</div>
			  </div>
			  <div class="row mb-3 align-items-end">
				
				<div class="col">
				  <label class="form-label">새로운 비밀번호 재입력</label>
				  <input type="password" name="new_pass2"  placeholder="영어, 숫자, 특수문자 9~16자리 조합" class="form-control is-invalid">
				</div>
			  </div>
	
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn me-auto" data-bs-dismiss="modal">닫기</button>
			  <button type="button" onclick="passwdChange()" class="btn btn-primary" data-bs-dismiss="modal">비밀번호 변경</button>
			</div>
		  </div>
		</div>
	  </div>
    </div>
    <script>
  
	
    flag1 = false;
	flag2 = false;
	const regPW = /^[a-zA-Z]+[a-zA-Z0-9!@#$%^&]{8,15}$/g;
	
	$('input[name="new_pass"]').on('change',function(){
		if(regPW.test($('input[name="new_pass"]').val())){
			flag1 = true;
			$('input[name="new_pass"]').removeClass('is-invalid').addClass('is-valid');
		}else{
			flag1 = false;
			$('input[name="new_pass"]').addClass('is-invalid').removeClass('is-valid');
		}
	})
	
	$('input[name="new_pass2"]').on('change',function(){
		if($('input[name="new_pass"]').val() == $('input[name="new_pass2"]').val()){
			flag2 = true;
			$('input[name="new_pass2"]').removeClass('is-invalid').addClass('is-valid');
		}else{
			flag2 = false;
			$('input[name="new_pass2"]').addClass('is-invalid').removeClass('is-valid');
		}
	})
    
	function passwdChange(){
		
		
		
		
		
		
		if(!flag1){
			 alert("비밀번호 형식에 맞지 않습니다.")
			 $('input[name="new_pass"]').focus();
			 return false;
		 }
		 if(!flag2){
			 alert("비밀번호 확인이 맞지 않습니다.")
			 $('input[name="new_pass2  "]').focus();
			 return false;
		 }
		
		 $.ajax({
		    	type: "POST",
		    	url: '<%=request.getContextPath()%>/passwordChange',
		    	data : {
		    			emp_id : "${id}",
		    			old_pass : $('input[name="old_pass"]').val(),
		    			new_pass : $('input[name="new_pass"]').val()	
		    	},
		    	success: function(result) {
					alert("비밀번호 변경에 성공하였습니다.");
					location.href="<%=request.getContextPath()%>/index.do";
		    	},
		    	error:function(result){
		    		alert("비밀번호 변경에 실패하였습니다.");	
		    	}
		  	});
	}
    </script>
