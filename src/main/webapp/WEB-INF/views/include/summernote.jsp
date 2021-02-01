<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<script>

window.addEventListener('load', function() {
		callSummernote(550);
	})
	function callSummernote(ySize) {
		//여기 아래 부분
		$('#summernoteContent').summernote({
			  height: ySize,                 // 에디터 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
			  direction: 'rtl',						// 왼쪽 정렬
			  disableResizeEditor: true,			// 높이조절 막기
			  disableDragAndDrop: true,
			  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['help']]
		  	],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			callbacks:{
				onImageUpload : function(files, editor, welEditable){
					// file size validation
					for(var i=files.length-1; i>-1; i--){
						if(files[i].size > 1024*1024*5){
							alert("이미지는 5MB 이하만 가능합니다.")
							return
						}
					}
					
					// file sending
					for(var i=files.length-1; i>-1; i--){
						sendFile(files[i], this) 
					}
				},
				onMediaDelete : function(target){
					var answer = confirm("정말 이미지를 삭제하시겠습니까?")
					if(answer){
						deleteFile(target[0].src)
					}
				}
				,
                onKeyup: function (e) {
                    if (e.shiftKey && e.keyCode == 51) {
                        sumkeyflag = true;
                        sumSC = [];
                    }

                    if (sumkeyflag) {
                        sumSC.push(e.key);
//                         console.log("sumSC=" + sumSC);
                        

                        if (sumSC.length == 4) {
                            sumkeyflag = false;
                            data = JSON.parse(localStorage.getItem('${loginUser.emp_id}'));

                            for(var i =0 ; i < data.length; i ++){
                                if (sumSC.join("").replace("Shift", "") == "#"+data[i].shc_save) {
                                    

                                    originHtml = e.target.innerHTML;

                                    result = originHtml.replace("#"+data[i].shc_save, data[i].shc);


                                    e.target.innerHTML = result;

//                                     console.log(e)

                                    //currstr = e.currentTarget.activeElement.value;
                                    //e.currentTarget.activeElement.value = e.currentTarget.activeElement
                                    //    .value.replace("#ad", "교체테스트트")
                                }
                            }
                            sumSC = [];
                        }
                    }


                }
			}
		});
		$('#summernoteContent').summernote('justifyLeft');
		$(".summernote").summernote("backColor", "white"); 
		$('.note-statusbar').hide();
	};
	function sendFile(file, el) {
		var form_data = new FormData()
		form_data.append("file", file)
		$.ajax({
			data : form_data,
			type : "post",
			url : "<%=request.getContextPath()%>/summernote/uploadImg.do",
			contentType : false,
			processData : false,
			success : function(img_url) {
				$(el).summernote("editor.insertImage", img_url)
			}
		})
	}
		  	
	function deleteFile(src) {
		var splitSrc = src.split("=")
		var fileName = splitSrc[splitSrc.length-1]
		
		// alert(fileName)
		var fileData = {
			"fileName":fileName
		}
		
		$.ajax({
			url : "<%=request.getContextPath()%>/summernote/deleteImg.do",
			data : JSON.stringify(fileData),
			type : "post",
			contentType : "application/json",
			success : function(res) {
			}
		})
	}
</script>


