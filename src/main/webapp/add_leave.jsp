<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr- Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    <title>Leaves - HRMS admin template</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Lineawesome CSS -->
    <link rel="stylesheet" href="css/line-awesome.min.css">

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="css/select2.min.css">

    <!-- Datetimepicker CSS -->
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
    
    <!-- Table styles CSS -->
    <link rel="stylesheet" href="css/styles.css">
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
   
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
   
    <title>Leave List</title>
</head>
<body>

<form action="./AddLeavesSrv" method="post">
<div id="add_leave" class="modal custom-modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
        
            <div class="modal-header">
                <h5 class="modal-title">Add Leave</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            
            <div class="modal-body">
            
            <div id="employeeCheckboxesContainer">
                     <div class="form-group">
                            <label for="selectedEmployee">Employee Username Leaving <span class="text-danger">*</span></label>
                            <select id="selectedEmployee" name="selectedEmployee" class="form-control">
                                 
                                <%
											List<EmployeeBean> dept = EmployeeDAO.getAllEmployees();
											for(EmployeeBean dep: dept)
											{
											%>
                                           <option><%= dep.getUsername() %></option>
                                        <%
                          					}
									     %> 
                               <%-- <%
			                // Call the method to get all employee data
							   List<EmployeeBean> roles = EmployeeDAO.getAllEmployees();										                System.out.println("Number of roles: " + roles.size());
										            
					          // Loop through the list and generate options in the d
					  
					           for (EmployeeBean role : roles) {
                              %>
				              <option value="<%= role.getRoleID()%>><%= role.getUsername()%></option>
				       <%
				            }
				       %> --%>
                            </select>
                        </div>
       </div>             
 <div class="form-group">
    <label for="starting_at">From <span class="text-danger">*</span></label>
    <input id="starting_at" name="starting_at" class="form-control" type="date">
</div>
<div class="form-group">
    <label for="ends_on">To <span class="text-danger">*</span></label>
    <input id="ends_on" name="ends_on" class="form-control" type="date">
</div>
<div class="form-group">
    <label for="days_count">Number of days <span class="text-danger">*</span></label>
    <input id="days_count" name="days_count" class="form-control" type="number">
</div>

<script>
    const startingDate = document.getElementById("starting_at");
    const endDate = document.getElementById("ends_on");
    const daysCount = document.getElementById("days_count");

    // Add event listeners to the date inputs
    startingDate.addEventListener("input", calculateDays);
    endDate.addEventListener("input", calculateDays);

    function calculateDays() {
        const startDateValue = Date.parse(startingDate.value);
        const endDateValue = Date.parse(endDate.value);

        if (!isNaN(startDateValue) && !isNaN(endDateValue)) {
            // Calculate the difference in days
            const differenceInMilliseconds = endDateValue - startDateValue;
            const differenceInDays = differenceInMilliseconds / (1000 * 60 * 60 * 24);

            // Update the "Number of days" input
            daysCount.value = differenceInDays;
        } else {
            // If either date is not valid, clear the "Number of days" input
            daysCount.value = "";
        }
    }
</script>
                    <div class="form-group">
                        <label for="reason">Leave Reason <span class="text-danger">*</span></label>
                        <textarea id="reason" name="reason" rows="4" class="form-control"></textarea>
                    </div>
                    <div class="submit-section">
                        <button type="submit" name="add_leave" class="btn btn-primary submit-btn">Submit</button>
                    </div>
            </div>
        </div>
    </div>
</div>
</form>
<%   response.sendRedirect("leaves.jsp"); %>