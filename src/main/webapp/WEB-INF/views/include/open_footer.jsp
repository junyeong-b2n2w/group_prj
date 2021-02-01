<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    


<%@ include file="summernote.jsp" %>
<%@ include file="pagination.jsp" %>
</body>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script>
   $( function() {
	$("#aprvLn").sortable({
		stop : function() {
			empList = $("td[name='icons']")
			if($(empList[empList.length-1]).siblings("td").find("select").val() == "consOp" || $(empList[empList.length-1]).siblings("td").find("select").val() == "aprvPreOp"){
				alert("합의/전결 는(은) 최종단계에 올수 없습니다.")
				$(this).sortable('cancel');
				return
			}
			for(i = 0; i<empList.length; i++){
				if(i == empList.length-1){
					$(empList[i]).html("최종")
					$(empList[i]).siblings("td").find("select").prop("disabled", true)
				}else{
					$(empList[i]).html("<svg xmlns='http://www.w3.org/2000/svg' class='icon' width='24' height='24' viewBox='0 0 24 24' stroke-width='2' stroke='currentColor' fill='none' stroke-linecap='round' stroke-linejoin='round'><path stroke='none' d='M0 0h24v24H0z' fill='none'/><line x1='4' y1='12' x2='20' y2='12' /><polyline points='8 8 12 4 16 8' /><polyline points='16 16 12 20 8 16' /></svg>")
					$(empList[i]).siblings("td").find("select").prop("disabled", false)
				}
			}
		}
	});   
	
     $( "#gallery" ).sortable();
     
     $( "#sortable" ).sortable({
    	 opacity: 0.7,
    	 revert: true,
    	 tolerance: "pointer",
    	 update: function(event, ui) { 
    		 var newOrd = Number(ui.item.index())  
    		 var oldOrd = Number($(this).attr('data-previndex')) 
    		 var wowgNo = $('.wo_wgno').val();
    		 
    		 
    		 $.ajax({
    			 	url : "<%=request.getContextPath()%>/widgetord/update.do",
    			 	type:"post",
    			 	data:{
    			 			wo_wgno : wowgNo,
    			 			wo_ord : newOrd,
    			 			wo_old : oldOrd
    			 		
    			 		 }
    			 	
			    			 
    		 })
         },
         start: function(event, ui) { 
        	 $(this).attr('data-previndex', ui.item.index());
         }
     });
     
     $( "#sortable" ).disableSelection();
   })
   
   function sort(No){
	   
	   $('.wo_wgno').val(No);
	   
   }
   
   
   var arrayWindow = new Array();
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr , WinTitle , "scrollbars=no,width="+ WinWidth +", " 
							+"height="+ WinHeight +", resizable=no, status=yes, menubar=no,toolbars=no ,left="+winleft+", top="+wintop+"" );
	win.resizeTo(WinWidth,WinHeight)
	win.focus() ; 
	arrayWindow.push(win)
}
window.parent.$("#logoutBtn").on("click", function() {
	$.each(arrayWindow, function(i, ob) {
		ob.close()
	})
})
$(window).bind("beforeunload", function (e){
	$.each(arrayWindow, function(i, ob) {
		ob.close()
	})
});


//팝업창 닫기
function CloseWindow(){
	window.close();
}

document.addEventListener('keyup', function (e) {

//     console.log(e.keyCode);

   //console.log(e.target.classList.contains("note-editable"));

	
   

   if (e.shiftKey && e.keyCode == 51 && !e.target.classList.contains("note-editable")) {
       inputkeyflag = true;
//        console.log('#');
       inputSC = [];

   }

   if (inputkeyflag) {
       inputSC.push(e.key);
//        console.log(inputSC);

       if (inputSC.length == 4) {
           inputkeyflag = false;
			
           data = JSON.parse(localStorage.getItem('${loginUser.emp_id}'));
           for(var i =0 ; i < data.length; i ++){
           	
	            if (inputSC.join("").replace("Shift", "") == "#"+data[i].shc_save) {
// 	                console.log(e.currentTarget.activeElement.value);
	                
	                //console.log(getCaretIndex(e.currentTarget.activeElement))
	                e.currentTarget.activeElement.value = e.currentTarget.activeElement.value.replace("#"+data[i].shc_save,
	                		data[i].shc)
	                
	
	            }
     		}

           inputSC = [];
       }
   }

})
  </script>
</html>