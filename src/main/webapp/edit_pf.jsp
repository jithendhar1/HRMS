<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.AddPFDAO" %>
<%@ page import="com.weblabs.beans.AddPF" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>
    <!-- Add your CSS and JavaScript includes here -->
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

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- table styles CSS -->
    <link rel="stylesheet" href="css/styles.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]-->
   <!--  <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>  -->
 </head>
<body>

<%
    int start = 0;
    int limit = 25;

    String idFilter = request.getParameter("id"); // Make sure the parameter name matches your form
    List<AddPF> pf = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "Id = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        pf = AddPFDAO.getFilteredAddPF(whereClause, start, limit);
    }

    if (pf != null && !pf.isEmpty()) {
    	AddPF pfs = pf.get(0); // Access the first element
        if (taxes != null) {
%>


  <div class="main-wrapper">
    <jsp:include page="header.jsp" />
    <jsp:include page="sidebar.jsp" />

    <!-- Page Wrapper -->
    <div class="page-wrapper">

        <!-- Page Content -->
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">

<form action="./EditPFSrv" method="post">
<div id="edit_pf" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Edit Provident Fund</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form>
									<div class="row">
									<div class="form-group">
				  <label>ID <span class="text-danger">*</span></label>
				  <input name="id" required class="form-control" type="text">
				                           </div>
										<div class="col-sm-6">
											<div class="form-group">
												<div class="form-group">
												<label>Employee Name</label>
										           <input name="employeename" required class="form-control"  type="text">
									           </div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>Provident Fund Type</label>
												 <select class="form-control select" name="pf" requried>
													<option value="Fixed Amount" selected="">Fixed Amount</option>
													<option value="Percentage of Basic Salary">Percentage of Basic Salary</option>
												</select>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="show-fixed-amount">
												<div class="row">
													<div class="col-sm-6">
														<div class="form-group">
															<label>Employee Share (Amount)</label>
															<input name="employeesharea" required class="form-control" type="text">
														</div>
													</div>
													<div class="col-sm-6">
														<div class="form-group">
															<label>Organization Share (Amount)</label>
															<input name="organizationsharea" required class="form-control" type="text">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="show-basic-salary">
												<div class="row">
													<div class="col-sm-6">
														<div class="form-group">
															<label>Employee Share (%)</label>
															<input name="employeesharep" required class="form-control" type="text">
														</div>
													</div>
													<div class="col-sm-6">
														<div class="form-group">
															<label>Organization Share (%)</label>
															<input name="organizationsharep" required class="form-control" type="text">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label>Description</label>
												<textarea name="description" required class="form-control" rows="4"></textarea>
											</div>
										</div>
									</div>
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Submit</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				</form>