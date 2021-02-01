<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
	<div class="container-fluid">
		<div class="row">
				<div id="if_list_div" style="position: relative;padding: 0;overflow: hidden;height: 850px;">
					<iframe id="if_list" name="if_list" frameborder="0" scrolling="0" src="" style="position: absolute;top: 0px;left: 0px; bottom: 0px; height: 100%; width: 100%; border: 0px; "></iframe>
				</div>
		</div>
	</div>
<%@ include file="popup.jsp" %>
<%@ include file="pushAlram.jsp"%>
</body>

