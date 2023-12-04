<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="path/to/datetimepicker.js"></script>
<link rel="stylesheet" href="path/to/datetimepicker.css">

<form action="./AddTerminationSrv" method="post">
<div id="add_termination" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Termination</h5>
								<button type ="button" class="close" name="addtermination" required  data-dismiss="modal" aria-label="Close">
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
									<!-- <div class="form-group">
										<label>Termination Date <span class="text-danger">*</span></label>
										<div class="cal-icon">
											<input type="text" name="termationdate" required  class="form-control ">
										</div>
									</div> -->
									
									
									
									<!-- Add the necessary CSS and JavaScript files for jQuery UI Datepicker -->





<script src="path/to/datetimepicker.js"></script>

<!-- Your HTML form -->
<div class="form-group">
    <label>Termination Date <span class="text-danger">*</span></label>
    <div class="cal-icon">
        <input type="text" id="termationdate" name="termationdate" required class="form-control datetimepicker">
    </div>
</div>

<!-- Your JavaScript code -->
<!-- <script>
    $(document).ready(function () {
        // Initialize the datetimepicker
        $("#termationdate").datetimepicker({
            format: 'dd/mm/yyyy', // Set the desired date format (dd/mm/yyyy)
            // You can customize the options based on your requirements
        });

        // Handle form submission
        $('form').submit(function (event) {
            // Get the selected date
            let selectedDate = $("#termationdate").datetimepicker('getValue');

            // Parse the selected date in 'dd/mm/yyyy' format
            let parsedDate = $.datepicker.parseDate('dd/mm/yy', selectedDate);

            // Convert the parsed date to the desired format (YYYY-MM-DD)
            let formattedDate = $.datepicker.formatDate('yy-mm-dd', parsedDate);

            // Set the formatted date back to the input field
            $("#termationdate").val(formattedDate);
        });
    });
</script>
				 -->					
									<div class="form-group">
										<label>Reason <span class="text-danger">*</span></label>
										<textarea class="form-control" name="reason" required rows="4"></textarea>
									</div>
									<div class="form-group">
    <label>Notice Date <span class="text-danger">*</span></label>
    <div class="cal-icon">
        <input type="text" name="noticedate" required  class="form-control datetimepicker">
    </div>
</div>


<script>
    $(document).ready(function () {
        // Initialize the datetimepicker
        $("#noticedate").datetimepicker({
            format: 'dd/mm/yyyy', // Set the desired date format (dd/mm/yyyy)
            // You can customize the options based on your requirements
        });

        // Handle form submission
        $('form').submit(function (event) {
            // Get the selected date
            let selectedDate = $("#noticedate").datetimepicker('getValue');

            // Parse the selected date in 'dd/mm/yyyy' format
            let parsedDate = $.datepicker.parseDate('dd/mm/yy', selectedDate);

            // Convert the parsed date to the desired format (YYYY-MM-DD)
            let formattedDate = $.datepicker.formatDate('yy-mm-dd', parsedDate);

            // Set the formatted date back to the input field
            $("#noticedate").val(formattedDate);
        });
    });
</script>
			





									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Submit</button>
									</div>
								
							</div>
						</div>
					</div>
				</div>
				</form>
				<%   response.sendRedirect("termination.jsp"); %>