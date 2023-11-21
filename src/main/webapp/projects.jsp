<%@ page import="com.weblabs.service.impl.ProjectDAO" %>
<%@ page import="com.weblabs.beans.CreateProject" %>
				
<%@ page import="java.util.List" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--  <%
    // Get the project ID from the request parameter or session
    int projectId = Integer.parseInt(request.getParameter("project_id"));
    
    // Instantiate ProjectDAO
    ProjectDAO projectDAO = new ProjectDAO();
    
    // Get the project by ID
    CreateProject project = projectDAO.getProjectById(projectId);
%>  --%>

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
					
					
					
					
					
					<div class="row">
						<div class="col-lg-4 col-sm-6 col-md-4 col-xl-3">
							<div class="card">
								<div class="card-body">
									<div class="dropdown dropdown-action profile-action">
										<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
										<div class="dropdown-menu dropdown-menu-right">
											<a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_project"><i class="fa fa-pencil m-r-5"></i> Edit</a>
											<a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_project"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
										</div>
									</div>
									
									
									<h4 class="project-title"><a href="project-view.jsp">Office Management</a></h4>
									<small class="block text-ellipsis m-b-15">
										<span class="text-xs">1</span> <span class="text-muted">open tasks, </span>
										<span class="text-xs">9</span> <span class="text-muted">tasks completed</span>
									</small>
									
									
									<p class="text-muted">Lorem Ipsum is simply dummy text of the printing and
										typesetting industry. When an unknown printer took a galley of type and
										scrambled it...
									</p>
									
									<div class="pro-deadline m-b-15">
										<div class="sub-title">
											Deadline:
										</div>
										<div class="text-muted">
											17 Apr 2019
										</div>
									</div>
									
									
									<div class="project-members m-b-15">
										<div>Project Leader :</div>
										<ul class="team-members">
											<li>
												<a href="#" data-toggle="tooltip" title="Jeffery Lalor"><img alt="" src="assets/profiles/avatar-16.jpg"></a>
											</li>
										</ul>
									</div>
									
									
									<div class="project-members m-b-15">
										<div>Team :</div>
										<ul class="team-members">
											<li>
												<a href="#" data-toggle="tooltip" title="John Doe"><img alt="" src="assets/profiles/avatar-02.jpg"></a>
											</li>
											<li>
												<a href="#" data-toggle="tooltip" title="Richard Miles"><img alt="" src="assets/profiles/avatar-09.jpg"></a>
											</li>
											<li>
												<a href="#" data-toggle="tooltip" title="John Smith"><img alt="" src="assets/profiles/avatar-10.jpg"></a>
											</li>
											<li>
												<a href="#" data-toggle="tooltip" title="Mike Litorus"><img alt="" src="assets/profiles/avatar-05.jpg"></a>
											</li>
											<li class="dropdown avatar-dropdown">
												<a href="#" class="all-users dropdown-toggle" data-toggle="dropdown" aria-expanded="false">+15</a>
												<div class="dropdown-menu dropdown-menu-right">
													<div class="avatar-group">
														<a class="avatar avatar-xs" href="#">
															<img alt="" src="assets/profiles/avatar-02.jpg">
														</a>
														<a class="avatar avatar-xs" href="#">
															<img alt="" src="assets/profiles/avatar-09.jpg">
														</a>
														<a class="avatar avatar-xs" href="#">
															<img alt="" src="assets/profiles/avatar-10.jpg">
														</a>
														<a class="avatar avatar-xs" href="#">
															<img alt="" src="assets/profiles/avatar-05.jpg">
														</a>
														<a class="avatar avatar-xs" href="#">
															<img alt="" src="assets/profiles/avatar-11.jpg">
														</a>
														<a class="avatar avatar-xs" href="#">
															<img alt="" src="assets/profiles/avatar-12.jpg">
														</a>
														<a class="avatar avatar-xs" href="#">
															<img alt="" src="assets/profiles/avatar-13.jpg">
														</a>
														<a class="avatar avatar-xs" href="#">
															<img alt="" src="assets/profiles/avatar-01.jpg">
														</a>
														<a class="avatar avatar-xs" href="#">
															<img alt="" src="assets/profiles/avatar-16.jpg">
														</a>
													</div>
													<div class="avatar-pagination">
														<ul class="pagination">
															<li class="page-item">
																<a class="page-link" href="#" aria-label="Previous">
																	<span aria-hidden="true">«</span>
																	<span class="sr-only">Previous</span>
																</a>
															</li>
															<li class="page-item"><a class="page-link" href="#">1</a></li>
															<li class="page-item"><a class="page-link" href="#">2</a></li>
															<li class="page-item">
																<a class="page-link" href="#" aria-label="Next">
																	<span aria-hidden="true">»</span>
																<span class="sr-only">Next</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
											</li>
										</ul>
									</div>
									
									
									
									<p class="m-b-5">Progress <span class="text-success float-right">40%</span></p>
									<div class="progress progress-xs mb-0">
										<div class="progress-bar bg-success" role="progressbar" data-toggle="tooltip" title="40%" style="width: 40%"></div>
									</div>
								</div>
							</div>
						</div>
						
						
				<!-- 	************************ -->
						
				
					
					                    <% if (project != null) { %>
                        <div class="col-lg-4 col-sm-6 col-md-4 col-xl-3">
                            <div class="card">
                                <div class="card-body">
                                    <!-- Display project information here -->
                                    <h4 class="project-title"><a href="project-view.jsp"><%= project.getProjectname() %></a></h4>
                                    <!-- Display other project details as needed -->
                                    <small class="block text-ellipsis m-b-15">
                                        <!-- Display task information, completion status, etc. -->
                                    </small>
                                    <p class="text-muted"><%= project.getDescription() %></p>
                                    <!-- Display other project details as needed -->
                                    <div class="pro-deadline m-b-15">
                                        <div class="sub-title">
                                            Deadline:
                                        </div>
                                        <div class="text-muted">
                                            <%= project.getEnddate() %>
                                        </div>
                                    </div>
                                    <!-- Display project leader and team members -->
                                    
                                    <!-- ... Your existing project member display code ... -->
                                    <p class="m-b-5">Progress <span class="text-success float-right">40%</span></p>
                                    <div class="progress progress-xs mb-0">
                                        <div class="progress-bar bg-success" role="progressbar" data-toggle="tooltip" title="40%" style="width: 40%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <% } else { %>
                        <p>No project found.</p>
                    <% } %>
					
					
                </div> 
				

<%-- 
<%-- Assuming you have a List<CreateProject> named projectList in your request or session --%>
<%-- <c:forEach var="project" items="${projectList}">
    <div>
        <h4>Project ID: <c:out value="${project.getProject_id()}" /></h4>
        <table border="1">
            <tr>
                <th>Project ID</th>
                <th>Projectname</th>
                <th>Enddate</th>
                <th>Description</th>
            </tr>
            <c:forEach var="k" begin="1" end="10" step="4">
                <tr>
                    <td><c:out value="${project.getProject_id()}" /></td>
                    <td><c:out value="${k} * ${project.getProjectname()}" /></td>
                    <td><c:out value="${project.getProjectEnddate()}" /></td>
                    <td><c:out value="${k + 1} * ${project.getDescription()}" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</c:forEach>

<c:if test="${empty projectList}">
    <p>No project found.</p>
</c:if>
 --%>
 
				
				
				
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
    
    