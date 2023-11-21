<form action="./EditPFSrv" method="post">
<div id="edit_pf" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Edit Provident Fund</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form>
									<div class="row">
									<div class="form-group">
				  <label>ID <span class="text-danger">*</span></label>
				  <input name="id" required class="form-control" type="text">
				                           </div>
										<div class="col-sm-6">
											<div class="form-group">
												<div class="form-group">
												<label>Employee Name</label>
										           <input name="employeename" required class="form-control"  type="text">
									           </div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>Provident Fund Type</label>
												 <select class="form-control select" name="pf" requried>
													<option value="Fixed Amount" selected="">Fixed Amount</option>
													<option value="Percentage of Basic Salary">Percentage of Basic Salary</option>
												</select>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="show-fixed-amount">
												<div class="row">
													<div class="col-sm-6">
														<div class="form-group">
															<label>Employee Share (Amount)</label>
															<input name="employeesharea" required class="form-control" type="text">
														</div>
													</div>
													<div class="col-sm-6">
														<div class="form-group">
															<label>Organization Share (Amount)</label>
															<input name="organizationsharea" required class="form-control" type="text">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="show-basic-salary">
												<div class="row">
													<div class="col-sm-6">
														<div class="form-group">
															<label>Employee Share (%)</label>
															<input name="employeesharep" required class="form-control" type="text">
														</div>
													</div>
													<div class="col-sm-6">
														<div class="form-group">
															<label>Organization Share (%)</label>
															<input name="organizationsharep" required class="form-control" type="text">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label>Description</label>
												<textarea name="description" required class="form-control" rows="4"></textarea>
											</div>
										</div>
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