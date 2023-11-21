<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Page Title</title>
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
        <!-- table styles CSS -->
     <link rel="stylesheet" href="css/tstyles.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <div class="sidebar" id="sidebar">
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu">
                <ul>
                    <li class="menu-title">
                        <span>Main</span>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="la la-dashboard"></i> <span> Dashboard</span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="index.jsp">Admin Dashboard</a></li>
                            <li><a href="employee_dashboard.jsp">Employee Dashboard</a></li>
                        </ul>
                    </li>

                    <li class="menu-title">
                        <span>Employees</span>
                    </li>
                    <li class="submenu">
                        <a href="#" class="noti-dot"><i class="la la-user"></i> <span> Employees</span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="employee.jsp">All Employees</a></li>
                            <li><a href="holidays.jsp">Holidays</a></li>
                            <li><a href="leaves.jsp">Employee Leave</a></li>
                            <li><a href="departments.jsp">Departments</a></li>
                            <li><a href="designations.jsp">Designations</a></li>
                            <li><a href="timesheet.jsp">Timesheet</a></li>
                            <li><a href="overtime.jsp">Overtime</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="clients.jsp"><i class="la la-users"></i> <span>Clients</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="la la-rocket"></i> <span> Projects</span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="projects.jsp">Projects</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="leads.jsp"><i class="la la-user-secret"></i> <span>Leads</span></a>
                    </li>

                    <li class="menu-title">
                        <span>HR</span>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="la la-files-o"></i> <span> Accounts </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="invoices.jsp">Invoices</a></li>
                            <li><a href="payments.jsp">Payments</a></li>
                            <li><a href="expenses.jsp">Expenses</a></li>
                            <li><a href="provident-fund.jsp">Provident Fund</a></li>
                            <li><a href="taxes.jsp">Taxes</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="la la-money"></i> <span> Payroll </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="salary.jsp"> Employee Salary </a></li>
                            <li><a href="salary-view.jsp"> Payslip </a></li>
                            <li><a href="payroll-items.jsp"> Payroll Items </a></li>
                        </ul>
                    </li>

                    <li class="submenu">
                        <a href="#"><i class="la la-crosshairs"></i> <span> Goals </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="goal-tracking.jsp"> Goal List </a></li>
                            <li><a href="goal-type.jsp"> Goal Type </a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="la la-edit"></i> <span> Training </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="training.jsp"> Training List </a></li>
                            <li><a href="trainers.jsp"> Trainers</a></li>
                            <li><a href="training-type.jsp"> Training Type </a></li>
                        </ul>
                    </li>
                    <li><a href="promotion.jsp"><i class="la la-bullhorn"></i> <span>Promotion</span></a></li>
                    <li><a href="resignation.jsp"><i class="la la-external-link-square"></i> <span>Resignation</span></a></li>
                    <li><a href="termination.jsp"><i class="la la-times-circle"></i> <span>Termination</span></a></li>
                    <li class="menu-title">
                        <span>Administration</span>
                    </li>
                    <li>
                        <a href="assets.jsp"><i class="la la-object-ungroup"></i> <span>Assets</span></a>
                    </li>

                    <li>
                        <a href="users.jsp"><i class="la la-user-plus"></i> <span>Users</span></a>
                    </li>

                    <li class="menu-title">
                        <span>Pages</span>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="la la-user"></i> <span> Profile </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="profile.jsp"> Employee Profile </a></li>
                            <li><a href="client-profile.jsp"> Client Profile </a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="settings.jsp"><i class="la la-cogs"></i> <span>Settings</span></a>
                    </li>
                    <li>
                        <a href="logout.jsp"><i class="la la-power-off"></i> <span>Logout</span></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

  <!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="js/jquery.slimscroll.min.js"></script>

    <!-- Select2 JS -->
    <script src="js/select2.min.js"></script>

    <!-- Datetimepicker JS -->
    <script src="js/moment.min.js"></script>
    <script src="js/bootstrap-datetimepicker.min.js"></script>

    <!-- Custom JS -->
    <script src="js/app.js"></script>
</body>

</html>
