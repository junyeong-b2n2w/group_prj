<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<div class="rui-toast-container">
    <div class="toast rui-toast hide" id="toastalert" role="alert" aria-live="assertive" aria-atomic="true" data-delay="5000">
        <div class="toast-header">
            <h5 class="mr-auto mnb-2" id="toasttitle"></h5>
            <button type="button" onclick="show_toast('Check Error', 'Please enter the required field.');" class="ml-15 mnt-4 mnr-4 toast-close close" data-dismiss="toast" aria-label="Close">
                <span data-feather="x" class="rui-icon rui-icon-stroke-1_5"></span>
            </button>
        </div>
        <div class="toast-body">
            <span id="toastmessage"></span>
        </div>
    </div>
</div>
 
 
 <script>
//  $('#check').click(function(){
//      show_toast("Check Error", "Please enter the required field.");
// });
//  function show_toast(title, message){
// 	 let id = new Date().getTime();
// 	 let toast ='<div class="toast rui-toast" role="alert" aria-live="assertive" aria-atomic="true" id=${id}>
// 	     <div class="toast-header">
// 	         <h5 class="mr-auto mnb-2">${title}</h5>
// 	         <button type="button" class="ml-15 mnt-4 mnr-4 toast-close close" data-dismiss="toast" aria-label="Close">
// 	             <span data-feather="x" class="rui-icon rui-icon-stroke-1_5"></span>
// 	         </button>
// 	     </div>
// 	     <div class="toast-body">
// 	         <span>${message}</span>
// 	     </div>
// 	 </div>';
// 	 $('#toast-container').append(toast);
// 	 $(`#${id}`).toast({
// 	     autohide: true,
// 	     delay: 5000
// 	 });
// 	 $(`#${id}`).on('hidden.bs.toast', function () {
// 	     $(`#${id}`).remove();
// 	 });
// 	 $(`#${id}`).toast('show');
// 	 }
 
 </script>