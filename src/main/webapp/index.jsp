<%@ page import="com.weblabs.service.impl.ProjectDAO" %>
<%@ page import="com.weblabs.service.impl.AddClientsDAO" %>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.service.impl.ExpensesDao" %>
<%@ page import="com.weblabs.service.impl.taskDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.text.DecimalFormat" %>

<%
    // Getting the username from the session
    String username = (String)session.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr - Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    <title>Dashboard - HRMS admin template</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/logo.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Lineawesome CSS -->
    <link rel="stylesheet" href="css/line-awesome.min.css">

    <!-- Chart CSS -->
    <link rel="stylesheet" href="plugins/morris/morris.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <!-- Main Wrapper -->
    <div class="main-wrapper">

        <!-- Header -->
         <jsp:include page="header.jsp" />
        <!-- /Header -->

        <!-- Sidebar -->
          <jsp:include page="sidebar.jsp" />
        <!-- /Sidebar -->

        <!-- Page Wrapper -->
        <div class="page-wrapper">

            <!-- Page Content -->
            <div class="content container-fluid">

                <!-- Page Header -->
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <!-- Display welcome message -->
                                <div id="welcomeMessage" style="text-align: center; margin-top: 20px; font-size: 24px;">
                                           Welcome <%= username%>!
                                  </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /Page Header -->

            <%--     <div class="row">
                    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                        <div class="card dash-widget">
                            <div class="card-body">
                            
                                <span class="dash-widget-icon"><i class="fa fa-cubes"></i></span>
                                <div class="dash-widget-info">
                                <%int ProjectCount = ProjectDAO.totalCount(); %>
                                    <h3><%=ProjectCount %></h3>
                                    <span>Projects </span>
                                </div>
                            </div>
                        </div>
                    </div> --%>
                    
                    <div class="row">
    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
        <div class="card dash-widget">
            <div class="card-body">
                <a href="projects.jsp" style="text-decoration: none; color: inherit;">
                    <span class="dash-widget-icon"><i class="fa fa-cubes"></i></span>
                    <div class="dash-widget-info">
                        <% int ProjectCount = ProjectDAO.totalCount(); %>
                        <h3><%=ProjectCount %></h3>
                        <span>Projects </span>
                    </div>
                </a>
            </div>
        </div>
    </div>

                    
                    
                    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                        <div class="card dash-widget">
                            <div class="card-body">
                             <a href="clients.jsp" style="text-decoration: none; color: inherit;">
                                <span class="dash-widget-icon"><i class="fa fa-users"></i></span>
                                <div class="dash-widget-info">
                                  <%int ClientCount = AddClientsDAO.totalCount(); %>
                                    <h3><%=ClientCount %></h3>
                                    <span>Clients</span>
                                </div>
                                  </a>
                            </div>
                        </div>
                    </div>
                    
                  <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                        <div class="card dash-widget">
                            <div class="card-body">
                                <a href="tasks.jsp" style="text-decoration: none; color: inherit;">
                                <span class="dash-widget-icon"><i class="fa fa-diamond"></i></span>
                                <div class="dash-widget-info">
                                    <%int TasksCount = taskDAO.totalCount(); %>
                                    <h3><%=TasksCount %></h3>
                                    <span>Tasks</span>
                                </div>
                                  </a>
                            </div>
                        </div>
                    </div> 
                    
      <%--                 
                    <%
    // Assuming you have a method to get the count of tasks for each project in ProjectDAO
    Map<String, Integer> tasksCountMap = ProjectDAO.getTasksCountPerProject();
%>
--%>
<%-- <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
    <div class="card dash-widget">
        <div class="card-body">
            <span class="dash-widget-icon"><i class="fa fa-diamond"></i></span>
            <div class="dash-widget-info">
                <% 
                    // Assuming tasksCountMap is a Map<String, Integer> where String is project_id
                    // and Integer is the count of tasks for that project
                    int totalTasksCount = tasksCountMap.values().stream().mapToInt(Integer::intValue).sum();
                %>
                <h3><%= totalTasksCount %></h3>
                <span>Total Tasks</span>
            </div>
        </div>
    </div>
</div>

<%
    // Iterate over the tasksCountMap to display count for each project
    for (Map.Entry<String, Integer> entry : tasksCountMap.entrySet()) {
        String projectId = entry.getKey();
        int projectTasksCount = entry.getValue();
%>
    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
        <div class="card dash-widget">
            <div class="card-body">
                <span class="dash-widget-icon"><i class="fa fa-diamond"></i></span>
                <div class="dash-widget-info">
                    <h3><%= projectTasksCount %></h3>
                    <span>Tasks for Project <%= projectId %></span>
                </div>
            </div>
        </div>
    </div>
<%
    }
%>
                    
            --%>         
                    
                    
                    
                    
                    
                    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                        <div class="card dash-widget">
                            <div class="card-body">
                                <a href="employee.jsp" style="text-decoration: none; color: inherit;">
                                <span class="dash-widget-icon"><i class="fa fa-user"></i></span>
                                <div class="dash-widget-info">
                                   <%int EmployeesCount = EmployeeDAO.totalCount(); %>
                                    <h3><%=EmployeesCount %></h3>
                                    <span>Employees</span>
                                </div>
                                
                                  </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card-group m-b-30">
                     
<%
  //  int EmployeesCount = EmployeeDAO.totalCount();

    int newEmployeesCount = EmployeeDAO.getNewEmployeesCountThisMonth();

    java.util.Calendar cal = java.util.Calendar.getInstance();
    int month = cal.get(java.util.Calendar.MONTH);
    String monthName = new java.text.DateFormatSymbols().getMonths()[month];
%>

<div class="card">
    <div class="card-body">
        <div class="d-flex justify-content-between mb-3">
            <div>
                <span class="d-block">New Employees</span>
            </div>
            <div>
             <span class="text-success"><%= (newEmployeesCount*100/EmployeesCount) %>%</span>
              <%--   <span class="text-success"><%= newEmployeesCount %> in <%= monthName %></span> --%>
            </div>
        </div>
        <h3 class="mb-3"><%= newEmployeesCount %></h3>
        <div class="progress mb-2" style="height: 5px;">
            <div class="progress-bar bg-primary" role="progressbar" style="width: <%= (newEmployeesCount * 100 / EmployeesCount) %>%;" aria-valuenow="<%= (newEmployeesCount * 100 / EmployeesCount) %>" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <p class="mb-0">Overall Employees <%= EmployeesCount %></p>
    </div>
</div>
      

                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between mb-3">
                                        <div>
                                            <span class="d-block">Earnings</span>
                                        </div>
                                        <div>
                                            <span class="text-success">+12.5%</span>
                                        </div>
                                    </div>
                                    <h3 class="mb-3">$1,42,300</h3>
                                    <div class="progress mb-2" style="height: 5px;">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 70%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <p class="mb-0">Previous Month <span class="text-muted">$1,15,852</span></p>
                                </div>
                            </div>


<%
    ExpensesDao expensesDao = new ExpensesDao(); // Create an instance of ExpensesDao

    double totalExpensePresentMonth = expensesDao.getTotalExpenseForPresentMonth();
    double totalExpensePreviousMonth = expensesDao.getTotalExpenseForPreviousMonth();
 //   double TotalExpenseForDateRange = expensesDao.getTotalExpenseForDateRange();
    // Calculate percentage change
    double percentageChange = 0.0;
    if (totalExpensePreviousMonth != 0.0) {
        percentageChange = ((totalExpensePresentMonth - totalExpensePreviousMonth) / totalExpensePreviousMonth) * 100;
        DecimalFormat df = new DecimalFormat("#.##");
        percentageChange = Double.parseDouble(df.format(percentageChange));
    } 
%>

                              <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between mb-3">
                                        <div>
                                            <span class="d-block">Expenses</span>
                                        </div>
                                        <div>
                                     <!--   <span class="text-danger">-2.8%</span>  -->
                                             <span class="text-danger"><%= percentageChange %>%</span>
                                        </div>
                                    </div>
                                   <!--  <h3 class="mb-3">$8,500</h3> -->
                                       <h3 class="mb-3">$<%= totalExpensePresentMonth %></h3>
                                    <div class="progress mb-2" style="height: 5px;">
                                         <div class="progress-bar bg-primary" role="progressbar" style="width: 70%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div> 
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: <%= percentageChange %>%;" aria-valuenow="<%= percentageChange %>" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                   <!--  <p class="mb-0">Previous Month <span class="text-muted">$7,500</span></p> -->
                                    <p class="mb-0">Previous Month <span class="text-muted">$<%= totalExpensePreviousMonth %></span></p>
                                </div>
                            </div>  


<%-- 
<%
    ExpensesDao expensesDao = new ExpensesDao(); // Create an instance of ExpensesDao

    double totalExpensePresentMonth = expensesDao.getTotalExpenseForPresentMonth();
    double totalExpensePreviousMonth = expensesDao.getTotalExpenseForPreviousMonth();

    // Calculate percentage change
    double percentageChange = 0.0;
    if (totalExpensePreviousMonth != 0.0) {
        percentageChange = ((totalExpensePresentMonth - totalExpensePreviousMonth) / totalExpensePreviousMonth) * 100;
    } 
%>

<div class="card">
    <div class="card-body">
        <div class="d-flex justify-content-between mb-3">
            <div>
                <span class="d-block">Expenses</span>
            </div>
            <div>
                <span class="text-danger"><%= percentageChange %>%</span>
            </div>
        </div>
        <h3 class="mb-3">$<%= totalExpensePresentMonth %></h3>
        <div class="progress mb-2" style="height: 5px;">
            <div class="progress-bar bg-primary" role="progressbar" style="width: 70%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div> 
            <div class="progress-bar bg-primary" role="progressbar" style="width: <%= percentageChange %>%;" aria-valuenow="<%= percentageChange %>" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <p class="mb-0">Previous Month $<%= totalExpensePreviousMonth %></p>
    </div>
</div>

 --%>



                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between mb-3">
                                        <div>
                                            <span class="d-block">Profit</span>
                                        </div>
                                        <div>
                                            <span class="text-danger">-75%</span>
                                        </div>
                                    </div>
                                    <h3 class="mb-3">$1,12,000</h3>
                                    <div class="progress mb-2" style="height: 5px;">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 70%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <p class="mb-0">Previous Month <span class="text-muted">$1,42,000</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 d-flex">
                        <div class="card card-table flex-fill">
                            <div class="card-header">
                                <h3 class="card-title mb-0">Recent Projects</h3>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table custom-table mb-0">
                                        <thead>
                                            <tr>
                                                <th>Project Name </th>
                                                <th>Progress</th>
                                                <th class="text-right">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <h2><a href="project-view.jsp">Office Management</a></h2>
                                                    <small class="block text-ellipsis">
                                                        <span>1</span> <span class="text-muted">open tasks, </span>
                                                        <span>9</span> <span class="text-muted">tasks completed</span>
                                                    </small>
                                                </td>
                                                <td>
                                                    <div class="progress progress-xs progress-striped">
                                                        <div class="progress-bar" role="progressbar" data-toggle="tooltip" title="65%" style="width: 65%"></div>
                                                    </div>
                                                </td>
                                                <td class="text-right">
                                                    <div class="dropdown dropdown-action">
                                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                            <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h2><a href="project-view.jsp">Project Management</a></h2>
                                                    <small class="block text-ellipsis">
                                                        <span>2</span> <span class="text-muted">open tasks, </span>
                                                        <span>5</span> <span class="text-muted">tasks completed</span>
                                                    </small>
                                                </td>
                                                <td>
                                                    <div class="progress progress-xs progress-striped">
                                                        <div class="progress-bar" role="progressbar" data-toggle="tooltip" title="15%" style="width: 15%"></div>
                                                    </div>
                                                </td>
                                                <td class="text-right">
                                                    <div class="dropdown dropdown-action">
                                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                            <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h2><a href="project-view.jsp">Video Calling App</a></h2>
                                                    <small class="block text-ellipsis">
                                                        <span>3</span> <span class="text-muted">open tasks, </span>
                                                        <span>3</span> <span class="text-muted">tasks completed</span>
                                                    </small>
                                                </td>
                                                <td>
                                                    <div class="progress progress-xs progress-striped">
                                                        <div class="progress-bar" role="progressbar" data-toggle="tooltip" title="49%" style="width: 49%"></div>
                                                    </div>
                                                </td>
                                                <td class="text-right">
                                                    <div class="dropdown dropdown-action">
                                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                            <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h2><a href="project-view.jsp">Hospital Administration</a></h2>
                                                    <small class="block text-ellipsis">
                                                        <span>12</span> <span class="text-muted">open tasks, </span>
                                                        <span>4</span> <span class="text-muted">tasks completed</span>
                                                    </small>
                                                </td>
                                                <td>
                                                    <div class="progress progress-xs progress-striped">
                                                        <div class="progress-bar" role="progressbar" data-toggle="tooltip" title="88%" style="width: 88%"></div>
                                                    </div>
                                                </td>
                                                <td class="text-right">
                                                    <div class="dropdown dropdown-action">
                                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                            <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h2><a href="project-view.jsp">Digital Marketplace</a></h2>
                                                    <small class="block text-ellipsis">
                                                        <span>7</span> <span class="text-muted">open tasks, </span>
                                                        <span>14</span> <span class="text-muted">tasks completed</span>
                                                    </small>
                                                </td>
                                                <td>
                                                    <div class="progress progress-xs progress-striped">
                                                        <div class="progress-bar" role="progressbar" data-toggle="tooltip" title="100%" style="width: 100%"></div>
                                                    </div>
                                                </td>
                                                <td class="text-right">
                                                    <div class="dropdown dropdown-action">
                                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                            <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="card-footer">
                                <a href="projects.jsp">View all projects</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /Page Content -->

        </div>
        <!-- /Page Wrapper -->

    </div>
    <!-- /Main Wrapper -->

    <!-- javascript links starts here -->
    <!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="js/jquery.slimscroll.min.js"></script>

    <!-- Chart JS -->
    <script src="plugins/morris/morris.min.js"></script>
    <script src="plugins/raphael/raphael.min.js"></script>
    <script src="js/chart.js"></script>

    <!-- Custom JS -->
    <script src="js/app.js"></script>
    <!-- javascript links ends here  -->
</body>
</html>