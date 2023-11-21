<form action="./AddTerminationSrv" method="post">
<div id="add_termination" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Termination</h5>
								<button type ="button" class="close" name="addtermination" required data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								
								<!-- <div class="form-group">
										<label> ID <span class="text-danger">*</span></label>
										<input name="id" required class="form-control" type="text">
									</div> -->
									<div class="form-group">
										<label>Terminated Employee <span class="text-danger">*</span></label>
										<input class="form-control" name="terminatedemp" required type="text">
									</div>
									<div class="form-group">
										<label>Termination Type <span class="text-danger">*</span></label>
										<div class="add-group-btn">
											<select class="select" name="terminationtype">
												<option>Misconduct</option>
												<option>Others</option>
											</select>
											<a class="btn btn-primary" href="javascript:void(0);"><i class="fa fa-plus"></i> Add</a>
										</div>
									</div>
									<div class="form-group">
										<label>Termination Date <span class="text-danger">*</span></label>
										<div class="cal-icon">
											<input type="text" name="termationdate" required class="form-control datetimepicker">
										</div>
									</div>
									<div class="form-group">
										<label>Reason <span class="text-danger">*</span></label>
										<textarea class="form-control" name="reason" required rows="4"></textarea>
									</div>
									<div class="form-group">
										<label>Notice Date <span class="text-danger">*</span></label>
										<div class="cal-icon">
											<input type="text" name="noticedate" required class="form-control datetimepicker">
										</div>
									</div>
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Submit</button>
									</div>
								
							</div>
						</div>
					</div>
				</div>
				</form>
				<%   response.sendRedirect("termination.jsp"); %>