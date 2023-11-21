<form action="./AddTraining_TypeSrv" method="post">
<div id="add_trainingtype" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add New</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form>
									<div class="form-group">
										<label>Type <span class="text-danger">*</span></label>
										<input name="type"  class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>DescriptionName <span class="text-danger">*</span></label>
										<textarea name="DescriptionName" class="form-control" rows="4"></textarea>
									</div>
									<div class="form-group">
										<label class="col-form-label">Status</label>
										<select name="Status" class="select">
											<option>Active</option>
											<option>Inactive</option>
										</select>
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
				<%   response.sendRedirect("trainingtype.jsp"); %>