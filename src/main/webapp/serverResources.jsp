<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
	<div class="container-fluid">
		<div class="row align-items-center">
			<div class="col-sm-12">
				<h1>사용량</h1>
			</div>
		</div>
		<div class="row align-items-center">
			<div class="col-sm-4">
				<h4>cpu</h4>
				<canvas id="cpu"></canvas>
			</div>
			<div class="col-sm-4">
				<h4>ram</h4>
				<canvas id="ram"></canvas>
			</div>
			<div class="col-sm-4">
				<h4>hdd</h4>
				<canvas id="hdd"></canvas>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row align-items-center">
			<div class="col-sm-12">
				<h1>시스템 로그</h1>
				<textarea rows="20" cols="" class="form-control"></textarea>
			</div>
		</div>
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
	<script>
	
	var myPieChart = new Chart(document.getElementById("cpu"), {
	    type: 'pie',
	    data: {
	    	datasets:[{
	    		data: [70,30],
	    		backgroundColor: [
	                'rgba(255, 99, 132, 0.2)', //1번째 그래프의 바탕색
	                'rgba(54, 162, 235, 0.2)'
	            ],
	    	}]
	    }
// 	    options: options
	});
	var myPieChart = new Chart(document.getElementById("ram"), {
	    type: 'pie',
	    data: {
	    	datasets:[{
	    		data: [70,30],
	    		backgroundColor: [
	                'rgba(255, 99, 132, 0.2)', //1번째 그래프의 바탕색
	                'rgba(54, 162, 235, 0.2)'
	            ],
	    	}]
	    }
// 	    options: options
	});
	var myPieChart = new Chart(document.getElementById("hdd"), {
	    type: 'pie',
	    data: {
	    	datasets:[{
	    		data: [70,30],
	    		backgroundColor: [
	                'rgba(255, 99, 132, 0.2)', //1번째 그래프의 바탕색
	                'rgba(54, 162, 235, 0.2)'
	            ],
	    	}]
	    }
// 	    options: options
	});
	
	</script>
