<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">

/* 레이어팝업    */
#layer {display:none; position: fixed; left: 60px; top: 50px; width: 339px; height:380px; z-index: 2000; border: 5px solid #206bc4; box-shadow: 3px 3px 10px rgba(0,0,0,0.4);}
#layer .close {position: absolute; right: 20px; top: 20px; background: #206bc4; padding: 1px 6px; color: #fff;}
#layer .close:hover {text-decoration: underline;}
.empty {
	 height:60%;
}

</style>
<c:forEach items="${noticeList }" var="notice">
<div id="layer">
	<div class="card" style="height: 369px;">
		<div class="empty p-0 pt-2 h-75">
                      <div class="previewContent w-100  px-3 py-1" style="overflow: hidden;">
                      <a href="javascript:goPage('/notice/detail?ntc_no=${notice.ntc_no }','M050200');">${notice.ntc_cont }
						</a>
						</div>
        </div>
		<div class="empty p-0 pt-2 h-25">
			 		  <p class="empty-subtitle text-muted w-100 ">
                 		   <a href="javascript:goPage('/notice/list','M050200');">'게시판> 공지사항'</a> 에서 확인하실 수 있으며 <br>이미지 누르시면 바로 이동하실 수 있습니다.
               			</p>
        </div>
		<div class="card-footer">
			<div class="d-flex" style="justify-content: flex-end;">
				<label class="form-check form-switch"> 
				
				<input class="form-check-input" type="checkbox" id="closeOneday"> 
				<span class="form-check-label">하루동안 보지 않기</span>
				</label>&nbsp; 
				<a onclick="javascript:closePopup();"><svg xmlns="http://www.w3.org/2000/svg" class="icon"
						width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
						stroke="currentColor" fill="none" stroke-linecap="round"
						stroke-linejoin="round">
						<path stroke="none" d="M0 0h24v24H0z" fill="none" />
						<line x1="18" y1="6" x2="6" y2="18" />
						<line x1="6" y1="6" x2="18" y2="18" /></svg></a>
			</div>
			<input type="hidden" value="${notice.ntc_popsatymd }" id="startDate">
			<input type="hidden" value="${notice.ntc_popendymd }" id="endDate">
		</div>
	
</div>
</div>
</c:forEach>

  <script> 
  
  function closePopup() {
 	  if ($("#closeOneday").prop("checked")){
		  
 	    setCookie('layer','Y');
 	  }
 		  $('#layer').hide();
	  
 	}

//쿠키설정  
 function setCookie( name, value, expiredays ){
   var todayDate = new Date();
   todayDate.setDate( todayDate.getDate() + expiredays );
   document.cookie = name + '=' + escape( value ) + '; path=/; expires=' + todayDate.toGMTString() + ';'
 }


//테스트용 30초 쿠키 설정 
//  function setCookie( name, value ){

//  	var date = new Date();
//  	 var minutes = 30;
//  	 date.setTime(date.getTime() + (minutes * 1000));
//  	 document.cookie = name + '=' + escape( value ) + '; path=/; expires=' + date.toGMTString() + ';'
	 
//  	 console.log("cookie => " + document.cookie )
	 
//  }
// 쿠키 불러오기
 function getCookie(name) { 
   var obj = name + "="; 
   var x = 0; 
   while ( x <= document.cookie.length ) 
   { 
     var y = (x+obj.length); 
     	if ( document.cookie.substring( x, y ) == obj ) { 
       		if ((endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
      				 endOfCookie = document.cookie.length;
      				 //unescape함수는 쿠키값에 있을 수 있는 특수문자(semicolons, commas, spaces)를 decode하기 위해 사용
      				 return unescape( document.cookie.substring( y, endOfCookie ) );  

     		} 
     x = document.cookie.indexOf( " ", x ) + 1; 
     if ( x == 0 ) 
       break; 
   } 
   return ""; 
 }


window.addEventListener('load',function(){

	
	var checkNtcPopSatymd = $('input[id="startDate"]').val();
	var checkNtcPopEndymd = $('input[id="endDate"]').val();
	
	if(checkNtcPopSatymd && checkNtcPopEndymd){
		

	//start date변환
	var input = checkNtcPopSatymd.replace( " " , "T" ) ;
	var changeStDt = new Date(input)
	//end date변환
	var input2 = checkNtcPopEndymd.replace( " " , "T" ) ;
	var changeEnDt = new Date(input2)
		
	
	if(Date.now() >= changeStDt && Date.now() <= changeEnDt){
		 if (getCookie("layer") !="Y"){
		 	    $("#layer").show();
		 	  }
		 }
	
	}
})
 
 





 
 
 
	
</script> 