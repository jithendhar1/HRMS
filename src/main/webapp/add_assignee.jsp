<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.service.impl.taskDAO" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="com.weblabs.beans.TasksBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

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
   
</head>
<body>

</body>
</html>

<form action="./AddAssigneeSrv" method="post">
    <div id="add_assignee" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Assignee</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                    
                    
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="Employee_Id">Employee ID <span class="text-danger">*</span></label>
                                <select name="Employee_Id" id="Employee_Id" class="form-control" required onchange="getEmployeeDetails()">
                                    <option value="">Select an employee</option>
                                    <% 
                                    try {
                                        List<EmployeeBean> employees = EmployeeDAO.getAllEmployees();
                                        for (EmployeeBean employee : employees) {
                                    %>
                                    <option value="<%= employee.getEmployee_ID() %>"><%= employee.getEmployee_ID() %></option>
                                    <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                    %>
                                </select>
                            </div>
                        </div>

<div class="col-md-6">
    <div class="form-group">
        <label for="task_id">Task ID <span class="text-danger">*</span></label>
        <select name="task_id" id="task_id" class="form-control" required onchange="getTaskDetails()">
            <option value="">Select a task</option>
            <% 
            try {
                List<TasksBean> tasks = taskDAO.getAllTasks();
                for (TasksBean task : tasks) {
            %>
            <option value="<%= task.getTask_id() %>"><%= task.getTask_id() %></option>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </select>
    </div>
</div>
                    

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="start_date">Start Date</label>
                                <div class="cal-icon">
                                    <input name="start_date" class="form-control datetimepicker" type="text">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="end_date">End Date</label>
                                <div class="cal-icon">
                                    <input name="end_date" class="form-control datetimepicker" type="text">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
    <p class="m-b-5">Progress <span class="text-success float-right">40%</span></p>
    
    <div class="progress progress-xs mb-3">
        <div class="progress-bar bg-success" role="progressbar" data-toggle="tooltip" title="40%" style="width: 40%"></div>
    </div>

    <div class="form-group">
        <label for="progress">Task Status</label>
        <select name="progress" id="progress" class="form-control">
            <option value="pending">Pending</option>
            <option value="completed">Completed</option>
            <option value="in_progress">In Progress</option>
            <!-- Add more options as needed -->
        </select>
    </div>
</div>


                        <div class="col-md-12">
                            <div class="submit-section">
                                <button class="btn btn-primary submit-btn">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<%   response.sendRedirect("assignee.jsp"); %>