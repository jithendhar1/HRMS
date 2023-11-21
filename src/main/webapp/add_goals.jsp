<form action="./AddGoalsSrv" method="post">
<div id="add_goal" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Goal Tracking</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-form-label">Goal Type</label>
												<select name="Type" class="select">
													<option value="">Select Goal Type</option>
											       <option>Java dev </option>
												</select>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Subject</label>
												<input required name="Subject" class="form-control" type="text">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Target Achievement</label>
												<input required name="Target" class="form-control" type="text">
											</div>
										</div>
										
										<div class="col-sm-6">
											<div class="form-group">
												<label>Start Date </label>
												<input required name="StartDate" class="form-control " type="date">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>End Date <span class="text-danger">*</span></label>
												<input required name="EndDate" class="form-control " type="date">
											</div>
										</div>
										
										<div class="col-sm-12">
											<div class="form-group">
												<label>Description</label>
												<textarea name="Description" required class="form-control" rows="4"></textarea>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-form-label">Status</label>
												<select name="Status" class="select">
													<option value="1">Active</option>
													<option value="0">Inactive</option>
												</select>
											</div>

											<div class="col-sm-6">
												<div class="form-group">
													<label hidden class="col-form-label">Progress</label>
													<input hidden name="Progress"  class="form-control" type="text">
												</div>
											</div>
											
										</div>
									</div>
									<div class="submit-section">
										<button type="submit" class="btn btn-primary submit-btn">Submit</button>
									</div>
							</div>
						</div>
					</div>
				</div>
				</form>
				<%   response.sendRedirect("goal-tracking.jsp"); %>