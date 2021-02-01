<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<style>

ul.contextMenu{
  list-style:none; 
  margin:0;padding:0;
  font: 300 15px 'Roboto', sans-serif;
  position: absolute;
  color: #333;
  box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.2);
}

ul.contextMenu *{
    transition:color .4s, background .4s;
}

ul.contextMenu li{
  min-width:150px;
  overflow: hidden;
  white-space: nowrap;
  padding: 12px 15px;
  background-color: #fff;
  border-bottom:1px solid #ecf0f1;
}

ul.contextMenu li a{
  color:#333;
  text-decoration:none;
}

ul.contextMenu li:hover{
  background-color: #ecf0f1;
}

ul.contextMenu li:first-child{
  border-radius: 5px 5px 0 0;
}

ul.contextMenu li:last-child{
/*   background:#ecf0f1; */
  border-bottom:0;
  border-radius: 0 0 5px 5px
}

ul .contextMenu{
	margin-left:135px;
	top:90px;
}

#exportSub{
	display:none;
}


#export:hover #exportSub{
	display:block;
}

/*  ul.contextMenu li:last-child a{width:26%;}  */
/*  ul.contextMenu li:last-child:hover a{color:#2c3e50}  */
/*  ul.contextMenu li:last-child:hover a:hover{color:#2980b9}  */

</style>

<ul class="contextMenu" style="display: none; top: 0; left: 0;">
<!--   <li><a href="#"><i class="fa fa-envelope"></i> 폴더등록</a></li> -->
  <li><a href="javascript:oneDownload();"> <i class="fas fa-download"></i> 다운로드</a></li>
  <li><a href="javascript:modifyForm();"><i class="fas fa-cog"></i> 수정</a>
  <li id="export"><a href="javascript:void(0);"><i class="fa fa-envelope"></i> 내보내기</a>
  	<ul class="contextMenu" id="exportSub">
<!--   		<li><a href="javascript:shareBdoc(0);">개인</a></li> -->
  		<li><a href="javascript:shareBdoc(1);">부서</a></li>
  	</ul>
  </li>
  <li><a href="javascript:contextRemove();"><i class="fas fa-times"></i> 삭제</a></li>
<!--   <li> -->
<!--       <a class="fa fa-facebook" href="#"></a> -->
<!--       <a class="fa fa-twitter" href="#"></a> -->
<!--       <a class="fa fa-google-plus" href="#"></a> -->
<!--       <a class="fa fa-linkedin" href="#"></a> -->
<!--   </li> -->
</ul>

<script>

function modifyForm(){
	const bd_no = $(ev.target.offsetParent).find('.check').attr('data-no');
    $('input[name="bd_no"]').val(bd_no);				
    $('#modal-report').modal('show');
}


let ev;

function shareBdoc(shareType){
const data = $(ev.target.offsetParent).find('.check');
const bd_no = $(data).attr('data-no');
	
	$.ajax({
		url:"<%=request.getContextPath()%>/bdoc/shareBdoc.do",
		type:"post",
		data : { "bd_no" : bd_no, "shareType" : shareType},
		success: function(res){
			if(res == '성공'){
				getFolerList();
				goFolder(pType,$('.uploadedList').attr('data-num'));
			}
		}	
	});
}

function contextRemove(){
	const flag = confirm("삭제?");
	const data = $(ev.target.offsetParent).find('.check');
	if(flag){
		ano = $(data).attr("data-no");
		$.ajax({
			url:"<%=request.getContextPath()%>/bdoc/remove.do",
			type:"post",
			data : { "bd_no" : ano, "removeType" : pType},
			success: function(res){
				if(res == '성공'){
					getFolerList();
					goFolder(pType,$('.uploadedList').attr('data-num'));
				}
			}	
		});
	}
}

function oneDownload(){
	const data = $(ev.target.offsetParent).find('.check');
	
	const form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post");  //Post 방식
	form.setAttribute("action", "<%=request.getContextPath()%>/bdoc/download.do"); //요청 보낼 주소
	
		const key = document.createElement("input");
		key.setAttribute("type", "hidden");
		key.setAttribute("name", "bd_attckey");
		key.setAttribute("value", $(data).attr('data-key'));
		
		const no = document.createElement("input");
		no.setAttribute("type", "hidden");
		no.setAttribute("name", "bd_no");
		no.setAttribute("value", $(data).attr('data-no'));
		
		form.appendChild(key);
		form.appendChild(no);
		
	document.body.appendChild(form);
	form.submit();
	
}

function rightClickTest(e){
	if(e.button == 2){
// 		console.log(e.target); 우클릭했을떄 태그? 위치 ? 가져오기
		const a = document.querySelector('.contextMenu');
		a.style.display = "block";
		a.style.top = e.pageY+15 + "px";
		a.style.left = e.pageX+10 + "px";
		ev = e;
	}
}

document.addEventListener('contextmenu', function() {
  event.preventDefault();
});
document.addEventListener('click', function(){
	document.querySelector('.contextMenu').style.display = "none";
});

</script>
