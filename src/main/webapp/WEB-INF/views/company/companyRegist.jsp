<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>    

<div class="content">
	<div class="container-fluid row ">
		<div>
			<div class="card container p-3">
				<form action="regist" method="post" enctype="multipart/form-data">
					<div class="card-header">
						<h3>회사 등록하기</h3>
					</div>
	
					<div class="card-body">
						<div class="row mb-3 align-items-end">
							<div class="col-2">
								<a href="#" onclick="logo();" class="avatar avatar-upload rounded" id="logoBox">
									<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
										<line x1="12" y1="5" x2="12" y2="19"></line>
										<line x1="5" y1="12" x2="19" y2="12"></line>
									</svg>
									<span class="avatar-upload-text">회사 로고</span>
								</a>
								<img alt="logo" src="" class="d-none" id="showLogo" onclick="logo();">
									
								<div class="d-inline-block">
									<a class="btn btn-sm" onclick="logoCancel();">삭제</a>
								</div>
								<div class="d-none">
									<input type="file" name="logoInput" class="form-control" onchange="logoImg();">
								</div>
							</div>
							
							<div class="col-4">
								<label class="form-label">회사명</label>
								<input type="text" class="form-control" name="comp_nm">
							</div>
							<div class="col-3">
								<label class="form-label">사업자 등록 번호</label>
								<input type="text" name="comp_crno" class="form-control" placeholder="000-00-00000" autocomplete="true" maxlength="12" onkeypress="crnoKyeup(this)"/>
								<input type="hidden" name="full">
							</div>
							<div class="col-3">
								<label class="form-label">대표명</label>
								<input type="text" class="form-control" name="comp_delgnm">
							</div>
						</div>
						
						<div class="row mb-3 align-items-end">
							<label class="form-label">회사 주소</label>
							<div class="col-sm-10">
								<input type="text" id="sample4_postcode" class="form-control" placeholder="우편번호" name="comp_addr" value=" ">
							</div>
							<div class="col-sm-2">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn w-100"><br>
							</div>
						</div>
					
						<div class="row mb-3 align-items-end">
							<div class="col">
								<input type="text" id="sample4_roadAddress" name="comp_addr" class="form-control" placeholder="도로명주소" value=" ">
								<input type="hidden" id="sample4_jibunAddress" class="form-control" placeholder="지번주소">
							</div>
						</div>
						
						<div class="row mb-3 align-items-end">
							<div class="col-sm-6">
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" id="sample4_detailAddress" name="comp_addr" class="form-control" placeholder="상세주소" value=" ">
							</div>
							<div class="col-sm-6">
								<input type="text" id="sample4_extraAddress" name="comp_addr" class="form-control" placeholder="참고항목" value=" ">
							</div>
						</div>
						
						<div class="row mb-3 align-items-end">
							<div class="col-6">
								<label class="form-label">회사 대표 전화번호</label>
								<input type="text" name="comp_hp" class="form-control" data-mask-visible="true" placeholder="ex) 000-000-0000" maxlength="13" autocomplete="off">
							</div>
							<div class="col-1">
								<img alt="showSeal" src="<%= request.getContextPath()%>/role/company/getSeal?fileName=noImage.jpg" id="showSeal">
							</div>
							<div class="col-1">
								<div class="d-inline-block">
									<a class="btn btn-sm" onclick="sealCancel()">삭제</a>
								</div>
							</div>
							
							<div class="col-4">
								<label class="form-label">회사 직인</label>
								<input type="file" name="sealInput" class="form-control" onchange="logoSeal()">
							</div>
						</div>
					</div>
					
					<div class="card-footer d-flex justify-content-end">
						<button type="button" class="btn" >취소</button>&nbsp;
						<button type="submit" class="btn btn-primary">등록하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	function logo() {
		$('input[name="logoInput"]').trigger("click");
	}

	function logoImg() {
		var ext = $('input[name="logoInput"]').val().split('.').pop().toLowerCase(); //확장자
		
	    //배열에 추출한 확장자가 존재하는지 체크
	    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
	        $('input[name="logoInput"]').val(""); //폼 초기화
	        alert('이미지 파일이 아닙니다. (gif, png, jpg, jpeg 만 업로드 가능)');
	    } else {
	    	$('#logoBox').addClass("d-none");
	    	$('#showLogo').removeClass("d-none");
	    	
	        file = $('input[name="logoInput"]').prop("files")[0];
	        blobURL = window.URL.createObjectURL(file);
	        $('#showLogo').attr('src', blobURL);
	        
	        $('#showLogo').slideDown(); //업로드한 이미지 미리보기 
	    }
	}

	function logoSeal() {
		var ext = $('input[name="sealInput"]').val().split('.').pop().toLowerCase(); //확장자
		
	    //배열에 추출한 확장자가 존재하는지 체크
	    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
	        $('input[name="sealInput"]').val(""); //폼 초기화
	        alert('이미지 파일이 아닙니다. (gif, png, jpg, jpeg 만 업로드 가능)');
	    } else {
	        file = $('input[name="sealInput"]').prop("files")[0];
	        blobURL = window.URL.createObjectURL(file);
	        $('#showSeal').attr('src', blobURL);
	        
	        $('#showSeal').slideDown(); //업로드한 이미지 미리보기 
	    }
	}
	
	function logoCancel() {
		$('#showLogo').addClass("d-none");
    	$('#logoBox').removeClass("d-none");
    	
    	$('input[name="logoInput"]').val("");
    	$('#showLogo').attr('src', "");
	}
	
	function sealCancel() {
		$('#showSeal').attr('src', "<%= request.getContextPath()%>/role/company/getSeal?fileName=noImage.jpg");
	}

	function crnoKyeup(crno) {
		if(crno.value.length == 3){
			text = crno.value + "-"
			crno.value=text;
		}
		
		if(crno.value.length == 6){
			text = crno.value + "-"
			crno.value=text;
		}
	}
	
// 	window.onload = function(){
				
// 	}

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>