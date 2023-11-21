<form action="./AddDepartmentSrv" method="post">
<div id="add_department" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Department</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								
								<div class="form-group">
										<label>Department ID <span class="text-danger">*</span></label>
										<input name="id" required class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>Department Name <span class="text-danger">*</span></label>
										<input name="department" required class="form-control" type="text">
									</div>
									
									<div class="submit-section">
										<button name="add_department" type="POST" class="btn btn-primary submit-btn">Submit</button>
									</div>
							</div>
						</div>
					</div>
				</div>
				</form>
				<%   response.sendRedirect("departments.jsp"); %>