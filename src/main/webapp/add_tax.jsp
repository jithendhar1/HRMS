<form action="./AddTaxSrv" method="post">
<div id="add_tax" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Tax</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								
								<div class="form-group">
				                 <label> Taxes ID <span class="text-danger">*</span></label>
				                 <input name="id" required class="form-control" type="text">
				                           </div>
									<div class="form-group">
										<label>Tax Name <span class="text-danger">*</span></label>
										<input name="taxname" required class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>Tax Percentage (%) <span class="text-danger">*</span></label>
										<input name="taxper" required class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>Status <span class="text-danger">*</span></label>
										<select class="select" name="status" required>
											<option>Pending</option>
											<option>Approved</option>
										</select>
									</div>
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Submit</button>
									</div>
								
							</div>
						</div>
					</div>
				</div>
				</form>