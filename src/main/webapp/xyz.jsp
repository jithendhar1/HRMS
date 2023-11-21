<%@ page import="com.weblabs.service.impl.ProjectDAO" %>
<%@ page import="com.weblabs.beans.CreateProject" %>
				
<%@ page import="java.util.List" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>



  <%
    // Get the project ID from the request parameter or session
    int projectId = 0; // Default value or handle the case when the parameter is not present
    String projectIdParam = request.getParameter("project_id");
    
    if (projectIdParam != null && !projectIdParam.isEmpty()) {
        try {
            projectId = Integer.parseInt(projectIdParam);
        } catch (NumberFormatException e) {
            // Handle the case where the parameter is not a valid integer
            e.printStackTrace();
        }
    }

    // Instantiate ProjectDAO
    ProjectDAO projectDAO = new ProjectDAO();
    CreateProject project = projectDAO.getProjectById(projectId);
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
        <title>Projects - HRMS admin template</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/logo.png">
		
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
		
		<!-- Summernote CSS -->
		<link rel="stylesheet" href="plugins/summernote/dist/summernote-bs4.css">
		
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
						<div class="row align-items-center">
							<div class="col">
								<h3 class="page-title">Projects</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Projects</li>
								</ul>
							</div>
							<div class="col-auto float-right ml-auto">
								<a href="#" class="btn add-btn" data-toggle="modal" data-target="#create_project"><i class="fa fa-plus"></i> Create Project</a>
								<div class="view-icons">
									<a href="projects.jsp" class="grid-view btn btn-link active"><i class="fa fa-th"></i></a>
									<a href="project-list.jsp" class="list-view btn btn-link"><i class="fa fa-bars"></i></a>
								</div>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<!-- Search Filter -->
					<div class="row filter-row">
						<div class="col-sm-6 col-md-3">  
							<div class="form-group form-focus">
								<input type="text" class="form-control floating">
								<label class="focus-label">Project Name</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">  
							<div class="form-group form-focus">
								<input type="text" class="form-control floating">
								<label class="focus-label">Employee Name</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3"> 
							<div class="form-group form-focus select-focus">
								<select class="select floating"> 
									<option>Select Roll</option>
									<option>Web Developer</option>
									<option>Web Designer</option>
									<option>Android Developer</option>
									<option>Ios Developer</option>
								</select>
								<label class="focus-label">Designation</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">  
							<a href="#" class="btn btn-success btn-block"> Search </a>  
						</div>     
                    </div>
					<!-- Search Filter -->
					
					
					
					
	
						
	

<h2>Project List</h2>

<c:if test="${not empty projectList}">
    <table border="1">
        <tr>
            <th>Project ID</th>
            <th>Project Name</th>
            <th>Client ID</th>
            <!-- Add other columns as needed -->
        </tr>
        <c:forEach var="project" items="${projectList}">
            <tr>
                <td><c:out value="${project.getProject_id()}" /></td>
                <td><c:out value="${project.getProjectname()}" /></td>
                <td><c:out value="${project.getClientid()}" /></td>
                <!-- Add other columns as needed -->
            </tr>
        </c:forEach>
    </table>
</c:if>

<c:if test="${empty projectList}">
    <p>No projects found.</p>
</c:if>

				
				
				
<jsp:include page="add_project.jsp" />
<!-- /Create Project Modal -->

<!-- Edit Project Modal -->
<jsp:include page="edit_project.jsp" />
<!-- /Edit Project Modal -->

<!-- Delete Project Modal -->
<jsp:include page="delete_project.jsp" />
<!-- /Delete Project Modal -->

				
            </div>
			<!-- /Page Wrapper -->

        </div>
		<!-- /Main Wrapper -->

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
		
		<!-- Summernote JS -->
		<script src="assets/plugins/summernote/dist/summernote-bs4.min.js"></script>

		<!-- Custom JS -->
		<script src="js/app.js"></script>
    </body>
    </html>
    
    