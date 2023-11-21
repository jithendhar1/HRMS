<form action="./AddHolidaySrv" method="post">
<div class="modal custom-modal fade" id="add_holiday" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Holiday</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
									<div class="form-group">
										<label>Holiday Name <span class="text-danger">*</span></label>
										<input name="Holiday_Name" class="form-control" required type="text">
									</div>
									<div class="form-group">
										<label>Holiday Datess <span class="text-danger">*</span></label>
										<input class="form-control" name="Holiday_Date" required type="date">
									</div>
									<div class="submit-section">
										<button  type="submit" class="btn btn-primary submit-btn">Submit</button>
									</div>
							</div>
						</div>
					</div>
				</div>
</form>
<%   response.sendRedirect("holidays.jsp"); %>