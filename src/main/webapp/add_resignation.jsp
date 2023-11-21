<form action="./AddResignationSrv" method="post">
<div id="add_resignation" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Resignation</h5>
								<button type="button" class="close" name="addresignation" required data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
				<form>
								<!-- <div class="form-group">
										<label> ID <span class="text-danger">*</span></label>
										<input name="id" required class="form-control" type="text">
									</div> -->
									<div class="form-group">
										<label>Resigning Employee <span class="text-danger">*</span></label>
										<input name="resigingemp" required class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>Notice Date <span class="text-danger">*</span></label>
										<div class="cal-icon">
											<input type="text" name="noticedate" required class="form-control datetimepicker">
										</div>
									</div>
									<div class="form-group">
										<label>Resignation Date <span class="text-danger">*</span></label>
										<div class="cal-icon">
											<input type="text" name="resignationdate" required class="form-control datetimepicker">
										</div>
									</div>
									<div class="form-group">
										<label>Reason <span class="text-danger">*</span></label>
										<textarea class="form-control" name="reason" required rows="4"></textarea>
									</div>
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Submit</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				</form>
				<%   response.sendRedirect("resignation.jsp"); %>