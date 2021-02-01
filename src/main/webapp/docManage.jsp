<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.fileDrop{
	width:100%;
	height:200px;
	border:1px dotted blue;	
}
small{
	margin-left:3px;
	font-weight:bold;
	color:gray;
}
</style>

</head>
<body>
	<div class="container-fluid">
		<div class="row align-items-center">
			<h1>문서 관리</h1>
			<div class="col-sm-12">
				<div class="fileDrop"></div>
				<div class="uploadedList" ></div>
			</div>
		</div>
		<div class="row align-items-center">
			<div class="col-sm-12" style="text-align: right;">
				<button type="button" id='submitBtn' class="btn btn-primary">등록</button>
			</div>
		</div>
	</div>


<script>
	$(this).on("dragenter dragover drop",function(event){
		//event.preventDefault();
		return false;
	});
	$(".fileDrop").on("dragenter dragover",function(event){
		return false;
	});
	
	$(".fileDrop").on("drop",function(event){
		//event.preventDefault();		
		//alert("drop");
		
		var files=event.originalEvent.dataTransfer.files;
		
		for(var i=0;i<files.length;i++){
			//alert(files[i].name);
			addFile(files[i]);
		}
		
		return false;
	});
	
	function addFile(file){
		var formData=new FormData();
		formData.append("file",file);
		

		$.ajax({
			url:"uploadAjax",
			type:"post",
			data:formData,
			contentType:false,
			processData:false,
			success:function(data){
				//alert(data);
				var str="";
				if(checkImageType(data)){
					/* 썸네일 */
					str="<div><a class='thumnail' href='displayFile?fileName="+getImageLink(data)+"'>"
					   +"<img src='displayFile?fileName="+data+"'/>"
					   +"</a><small data-src='"+data+"'><button>X</button></small></div>";
				}else{
					/* 텍스트  */
					str="<div><a class='thumnail' href='displayFile?fileName="+data+"'>"
						 +getOriginalName(data)+"</a>"
						 +"<small data-src='"+data+"'>"
						 +"<button>X</button></small></div>";
				}
				
				$(".uploadedList").append(str);
			}
		});		
		
	}
	
	function checkImageType(fileName){
		fileName=fileName.substring(fileName.lastIndexOf('.')+1).toLowerCase();
		var pattern=/jpg|gif|png|jpeg/i;
		return fileName.match(pattern);			
	}
	
	function getOriginalName(fileName){
		if(checkImageType(fileName)){
			return;
		}
		
		var idx=fileName.indexOf("_")+1;
		return fileName.substr(idx);
	}
	
	function getImageLink(fileName){
		if(!checkImageType(fileName)){
			return;
		}
		var front=fileName.substr(0,12);
		var end=fileName.substr(14);
		return front+end;
	}
	
	$('.uploadedList').on('click','small',function(event){
// 		alert('x btn click');
		
	});
	
</script>











