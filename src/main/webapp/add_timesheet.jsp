<form action="./AddTimeSheetSrv" method="post">
<div id="add_timesheet" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Today Work details</h5>
								<!--  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button> -->
							</div>
							<div class="modal-body">
								
								<!-- <div class="form-group">
										<label> ID <span class="text-danger">*</span></label>
										<input name="id" required class="form-control" type="number">
									</div> -->
									<div class="row">
										<div class="form-group col-sm-6">
											<label>project <span class="text-danger">*</span></label>
											<input name="project" required class="form-control">
										</div>
									</div>
									<div class="row">
										<div class="form-group">
										<label>Deadline<span class="text-danger">*</span></label>
										<input class="form-control" name="deadline" required>
									</div>
										<div class="form-group col-sm-4">
											<label>Total Hours <span class="text-danger">*</span></label>
											<input name="totalhours" required  class="form-control" type="text" >
										</div>
										<div class="form-group col-sm-4">
											<label>Remaining Hours <span class="text-danger">*</span></label>
											<input name="remaininghours" required class="form-control" type="text" >
										</div>
									</div>
									<div class="row">
										 <div class="form-group">
										    <label for="starting_at">Date <span class="text-danger">*</span></label>
										   <input id="starting_at" name="date" class="form-control" type="date">
										</div>
										<div class="form-group col-sm-6">
											<label>Hours <span class="text-danger">*</span></label>
											<input name="hours" required  class="form-control" type="text">
										</div>
									</div>
									<div class="form-group">
										<label>Description <span class="text-danger">*</span></label>
										<textarea name="description" required  rows="4" class="form-control"></textarea>
									</div>
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Submit</button>
									</div>
								
							</div>
						</div>
					</div>
				</div>
				</form>