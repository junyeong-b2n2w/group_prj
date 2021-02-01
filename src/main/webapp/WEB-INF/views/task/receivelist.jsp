<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    
<div class="content">
    <div class="container">
    <div class="page-header d-print-none">
          <div class="row align-items-center">
            <div class="col">
              <h3 class="page-title">
              	업무 수신함
              </h3>
            </div>
          </div>
      </div>
    		
    <div class="card p-3">
    	
    	
		<div class="card-header ">
		<h3>업무수신함</h3>
    		</div>
                 <div class="card-body py-3">
                  <div class="d-flex " style="justify-content: flex-end;">
                    <div class="ms-auto text-muted">
                    
                      <div class="ms-2 d-inline-block">
                      <select class="form-select form-select-sm" name="searchtaskType">
			              <option value="task_title">제목</option>
			              <option value="task_cont">내용</option>
			            </select>
                      </div>
                      <div class="ms-2 d-inline-block">
                        <input type="text" class="form-control form-control-sm" aria-label="Search invoice" name="task_search" placeholder="검색어를 입력하세요">
                      </div>
                      <div class="ms-2 d-inline-block">
                        <a href="#" class="btn btn-primary btn-sm" aria-label="Button" id="searchtaskType">
                            검색
                        </a>
                      </div>
                    </div>
                  </div>
                
                
                
                <div class="table-responsive mt-3">
                  <table class="table card-table table-vcenter text-nowrap datatable">
                    <thead>
                      <tr>
                        
                        <th class="w-1">No. 
                        </th>
                        <th>제목</th>
                        <th>발신자</th>
                        <th>요청일</th>
                        <th>마감일</th>
                        <th>상태</th>
                      </tr>
                    </thead>
                    <tbody id="TaskList">
                   
                    </tbody>
                  </table>
                </div>
                </div>
                <div class="card-footer d-flex justify-content-center" >
                  <div id="post_lists"></div>
	
                </div>
    		</div>
    	</div>
</div>
	
<%@ include file="receiverlist_detail_js.jsp"%>
   
   
   
  
