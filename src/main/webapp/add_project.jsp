
<form action="./AddProjectSrv" method="post" >
	<div id="create_project" class="modal custom-modal fade" role="dialog">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Create Project</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Project Name</label> 
								<input name="projectname" id="projectname" class="form-control" type="text">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Client id</label> 
								<input name="Clientid" id="Clientid" class="form-control" type="text">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Start Date</label>
								 <input name="startdate" id="startdate" class="form-control" type="date">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>End Date</label>
								 <input name="enddate" id="enddate" class="form-control" type="date">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<div class="form-group">
								<label>Rate</label>
								 <input name="rate" id="rate" placeholder="$50" class="form-control" type="text">
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label>Hourly/Fixed</label> 
								<select name="hourly" id="hourly" class="select">
									<option>Hourly</option>
									<option>Fixed</option>
								</select>
							</div>
						</div>
                      </div>
						
							<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Priority</label>
								 <select name="priority" id="priority" class="select">
									<option>High</option>
									<option>Medium</option>
									<option>Low</option>
								</select>
							</div>
						</div>
					
						<div class="col-sm-6">
							<div class="form-group">
								<label> Project Leader</label>
								 <input name="projectleader" class="form-control" type="text">
							</div>
						</div>
				        </div>


					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Add Team</label>
								 <input name="addteam"	class="form-control" type="text" id="addteam" >
							</div>
						</div>


				
					<div class="col-sm-6">
						<div class="form-group">
							<label>Description</label>
							<input name="description"	class="form-control" type="text" id="description" >
						</div>
					</div>
					</div>
					
					
                     <div class="row">
					<div class="col-sm-6">
						 <div class="form-group">
							<label>Upload Files</label> 
							<input name="uploadfile" id="uploadfile" class="form-control" type="file">
						</div> 
						
						<div class="submit-section">
							<button type="submit" class="btn btn-primary submit-btn">Submit</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</form>






