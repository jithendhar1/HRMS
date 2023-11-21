<form action="./AddTrainingServlet">
<div id="add_training" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add New Training</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Training Type</label>
												<select name="TrainingType" class="select">
													<option>Node Training</option>
													<option>Swift Training</option>
												</select>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Trainer</label>
												<select name="Trainer" class="select">
													<option>Mike Litorus </option>
													<option>John Doe</option>
												</select>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Employees</label>
												<select name="Employees" class="select">
													<option>Bernardo Galaviz</option>
													<option>Jeffrey Warden</option>
												</select>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Training Cost <span class="text-danger">*</span></label>
												<input name="TrainingCost" class="form-control" type="text">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>Start Date <span class="text-danger">*</span></label>
												<div class="cal-icon">
												<input name="StartingDate" class="form-control datetimepicker" type="text">
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>End Date <span class="text-danger">*</span></label>
												<div class="cal-icon">
												<input name="EndingDate" class="form-control datetimepicker" type="text"></div>
											</div>
										</div>
										
										<div class="col-sm-12">
											<div class="form-group">
												<label>DescriptionName <span class="text-danger">*</span></label>
												<textarea name="DescriptionName" class="form-control" rows="4"></textarea>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-form-label">Status</label>
												<select name="Status" class="select">
													<option>Active</option>
													<option>Inactive</option>
												</select>
											</div>
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
				<%   response.sendRedirect("training.jsp"); %>