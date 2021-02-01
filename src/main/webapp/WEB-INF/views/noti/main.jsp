<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div class="content">
	<div class="container-xl">
    <button>Show Alert</button>
    
  <div class="toast-container" style="position: absolute; bottom: 20px; right: 50px;min-width:  300px;" >
<!--   <div class="toast show" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false" data-bs-toggle="toast"> -->
<!--     <div class="toast-header"> -->
<!--       <span class="avatar avatar-xs me-2" style="background-image: url(...)"></span> -->
<!--       <strong class="me-auto">Dunn Slane</strong> -->
<!--       <small>11 mins ago</small> -->
<!--       <button type="button" class="ms-2 btn-close" data-bs-dismiss="toast" aria-label="Close"></button> -->
<!--     </div> -->
<!--     <div class="toast-body"> -->
<!--       Hello, world! This is a toast message. -->
<!--     </div> -->
<!--   </div> -->
<!--   <div class="toast show" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false" data-bs-toggle="toast"> -->
<!--     <div class="toast-header"> -->
<!--       <span class="avatar avatar-xs me-2" style="background-image: url(...)"></span> -->
<!--       <strong class="me-auto">Mallory Hulme</strong> -->
<!--       <small>7 mins ago</small> -->
<!--       <button type="button" class="ms-2 btn-close" data-bs-dismiss="toast" aria-label="Close"></button> -->
<!--     </div> -->
<!--     <div class="toast-body"> -->
<!--      게시글이 신규 등록되었습니다 -->
<!--     </div> -->
<!--   </div> -->
</div>
    
    
    
    
    
</div>
</div>

<script>
// var titile = 0;
//     $('button').click(function(){
    	
    	
	show_toast("공지사항","게시글이 신규등록되었습닞다" ,1,true);
// 	titile++;
//     });
    
    
    $(document).ready(function(){
    	
//     	 timer = setInterval( function () {
    		 
//     			$.ajax ({
<%--     				url : "<%=request.getContextPath() %>/attend/test/toastList", --%>
//     				cache : false,
//     				success : function (res) { 
//     					$.each(res,function(i){
//     						show_toast(res[i].noti_type,res[i].noti_cont,res[i].noti_no);
//     					})
//     				}
//     			});
//     		}, 10000); // 30초에 한번씩 받아온다.
    	
    })
    
    function show_toast(title, message,noti_no,readFlag){
    	
    	var id = new Date().getTime();
    	var classnm = "";
    	if(readFlag){
    		classnm = "read"
    	}
    	var typenm = "";
    	if(title == "EDOC_FIN_SSG"){
    		typenm = "결재완료";
    	}else if(title == "ARRV_TURN_SSG"){
    		typenm = "본인차례";
    		
    	}else if(title == "EDOC_RET_SSG"){
    		typenm = "결재 반려";
    		
    	}else if(title == "TASK_REG_SSG"){
    		typenm = "업무등록 ";
    		
    	}else if(title == "TASG_RET_SSG"){
    		typenm = "업무 반려";
    	}  		
    	
    	var toast = '<div class="toast show '+classnm+'" role="alert" id="'+id+'" aria-live="assertive" aria-atomic="true" data-autohide="false" data-toggle="toast" data-notino ="'+noti_no+'"style="transition:1s;">';
    	toast += '<div class="toast-header">';
//     	toast += '<div class="row">';
//     	toast += '<div class="col-10">';

    	toast += '<span class="avatar avatar-xs me-2  mr-1" style=""><i class="fas fa-bell" style="font-size: 18px;"></i></span>';
    	toast += '<strong class="me-auto">공지사항</strong>';
    	toast += ' <small></small>'
//     	toast += '</div>'; //col-10
//     	toast +=  '<div class="col-2">';
    	toast += '<button type="button" class="btn-close d-block mr-0 ml-auto" data-dismiss="toast" aria-label="Close"></button>';
//     	toast += '</div>';//col-2
//     	toast += '</div>'; //row
    	toast += '</div>'; //toast header
    	toast += '<div class="toast-body"><a href="javascript:void(0); onclick="goContentPage(url+contentno)">'+message+'</a>';
    	toast += '</div>'; //toast-body
    	toast +=  ' </div>'; //toast
    	
    	$('.toast-container').append(toast);
    	$('#'+id).toast({
    	    autohide: true,
    	    delay: 600000
    	});
    	$('#'+id).on('hidden.toast', function () {
    	    $('#'+id).remove();
    	});
    	$('#'+id).toast('show');
    	
    	
    	chageRead(noti_no);
    	}
    	 
    
   function chageRead(noti_no){
	   console.log("nno = "+ noti_no)
	   
	   $.ajax({
		
		   url : "<%=request.getContextPath()%>/attend/test/changeRead",
		   type : "post",
		   data : {"noti_no":noti_no},
		   success :function(res){
			   console.log(res)
		   }
		   
		   
	   })
	   
   }

  </script>
  </body>
</html>
