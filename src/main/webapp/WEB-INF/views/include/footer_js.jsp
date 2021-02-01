<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>

<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>

<script type="text/x-handlebars-template"  id="subMenu-list-template" >
{{#each .}}

	<li class="nav-item subMenu ml-3" data-menu_no="{{menu_no}}">
      	<a href="javascript:goPage('{{menu_url}}','{{menu_no}}');" class="nav-link dropdown-item">
              <span class="nav-link-title" style="font-size:0.9rem">
				<p>{{menu_nm }}</p>
			  </span>
        </a>
	</li>
{{/each}}
</script>

<script>

	var printData = function(subMenuArr,target,templateObject) {
		var template = Handlebars.compile(templateObject.html());
		var html = template(subMenuArr);
		$('.subMenu').remove();
		target.append(html);
	}
	
	function subMenu(mCode){
		
		 if(mCode == "M040000"){
			$('#asidenonedelete').css("display","block");
		}else{
			$('#asidenonedelete').css("display","none");
		} 
		
		
		if(mCode != "M000000"){
		$.getJSON("<%=request.getContextPath()%>/common/subMenu.do?mCode="+mCode,function(data){
				printData(data,$('.subMenuList'),$('#subMenu-list-template'));
			});
			
		}else{
			$('.subMenuList').html("");
		}
			
		
	}
	
	function goPage(url, mCode) {
		
		//HTML5 지원 브라우저에서 사용 가능
		if(typeof(history.pushState) == 'function'){
			//현재 주소를 가져온다
			let renewURL = location.href;
			
			//현재 주소 중 .do 뒤 부분이 있다면 날려버린다
			renewURL = renewURL.substring(0,renewURL.indexOf(".do")+3);
			
			if(mCode != 'M000000'){
				renewURL += "?mCode="+mCode;
			}
			
			//페이지를 리로드하지 않고 페이지 주소만 변경할 떄 사용
			history.pushState(mCode, null, renewURL);
		}else{
			location.hash = "#"+mCode;
		}
		
		
		$('#if_list').attr("src","<%=request.getContextPath()%>"+url);
	}
	
	goPage('${menu.menu_url}','${menu.menu_no}');
	subMenu('${menu.menu_no}'.substring(0,3)+"0000");
	
	
</script>

