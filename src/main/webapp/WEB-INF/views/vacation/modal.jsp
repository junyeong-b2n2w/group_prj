<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




 <!-- 상세보기 modal -->
<div class="modal modal-blur fade" id="detailVact" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">휴가 내역 상세 조회</h5>
            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
           <div class="row">
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">신청자 ID</label>
                  <div class="input-group input-group-flat">
                    <input type="text" class="form-control ps-0" value="" readonly id="detailVactId">
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">신청자 이름</label>
                  <div class="input-group input-group-flat">
                    <input type="text" class="form-control ps-0" value="" readonly  id="detailVactNm">
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">소속 부서</label>
                 <div class="input-group input-group-flat">
                    <input type="text" class="form-control ps-0" value="" readonly id="detailVactDeptNm">
                  </div>
                </div>
              </div>
            </div>
             <div class="row">
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">시작일자 </label>
                  <input type="text" class="form-control" id="detailVactSatDt" readonly>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">종료일자 </label> 
                  <input type="text" class="form-control" id="detailVactEndDt" readonly>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">신청일수 </label>
                  <input type="text" class="form-control" id="detailVactDays" readonly>
                </div>
              </div>
            </div>
           <div class="row">
              <div class="col-lg-12">
                <div class="mb-3">
                  <label class="form-label">휴가 구분</label>
                  <input type="text" class="form-control" id="detailVactGb" readonly>
                </div>
              </div>
              <div class="col-lg-12">
                <div>
                  <label class="form-label">휴가 사유</label>
                  <textarea class="form-control" rows="3" id="detailVactReason" readonly></textarea>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-body">
           <label class="form-label" id="empInfo">승인상태</label>
           <div class="form-selectgroup form-selectgroup-boxes d-flex flex-column"   id="appendLabel">
                            <label class="form-selectgroup-item flex-fill">
                            
                              <input type="radio" name="form-payment" value="mastercard" class="form-selectgroup-input" checked="">
                              <div class="form-selectgroup-label d-flex align-items-center p-3">
                                <div class="me-3">
                                  <span class="form-selectgroup-check"></span>
                                </div>
                                <div class="text-muted mx-3" id="detailAprvConfirm">
                                 
                                  <h3></h3>
                                </div>
                                
                              </div>
                            </label>
                          </div>
          </div><!-- modal body -->
          <div class="modal-footer">
          	<input type="hidden" id="detailVactNo">
          </div>
        </div>
      </div>
    </div>

  <!-- 수정용 modal -->
<div class="modal modal-blur fade" id="ModifyVact" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">휴가 내역 상세 조회(수정)</h5>
            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
           <div class="row">
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">신청자 ID</label>
                  <div class="input-group input-group-flat">
                    <input type="text" class="form-control ps-0" value="" readonly id="modVactId">
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">신청자 이름</label>
                  <div class="input-group input-group-flat">
                    <input type="text" class="form-control ps-0" value="" readonly  id="modVactNm">
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">소속 부서</label>
                 <div class="input-group input-group-flat">
                    <input type="text" class="form-control ps-0" value="" readonly id="modVactDeptNm">
                  </div>
                </div>
              </div>
            </div>
             <div class="row">
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">시작일자 </label>
                  <input type="date" class="form-control" id="modVactSatDt">
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">종료일자 </label> 
                  <input type="date" class="form-control" id="modVactEndDt">
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">신청일수 </label>
                  <input type="text" class="form-control" id="modVactDays" readonly>
                </div>
              </div>
            </div>
           <div class="row">
              <div class="col-lg-12">
                <div class="mb-3">
                  <label class="form-label">휴가 구분</label>
                  <div class="col">
			            <select class="form-select" id="modVactGb">
			              <option value="1">연차</option>
			              <option value="2">반차</option>
			              <option value="3">공가</option>
			              <option value="4">예비군</option>
			              <option value="5">병가</option>
			            </select>
			          </div>
                </div>
              </div>
              <div class="col-lg-12">
                <div>
                  <label class="form-label">휴가 사유</label>
                  <textarea class="form-control" rows="3" id="modVactReason"></textarea>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
          	<input type="hidden" id="modVactNo">
          	<button type="button" onclick="modifyVactBtn();" class="btn btn-primary">저장</button>
          </div>
        </div>
      </div>
    </div>