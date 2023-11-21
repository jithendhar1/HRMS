 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.csDAO" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="java.util.List" %>
<%@ page import="com.weblabs.service.impl.CompanySettingServiceImpl" %>
<%@ page import="com.weblabs.beans.CompanySettingsBean" %>

<%
    // Getting the username from the session
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr- Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
<title>Insert title here</title>
 
    <link rel="shortcut icon" type="image/x-icon" href="assets/favicon.png">

 

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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
            
			<!--   <div class="header-topleft text-left" style="margin-left: 1cm;">
        <img src="assets/logo.png" width="150" height="100" alt="">
    </div>
			 -->
			
				<!-- Page Content -->
                <div class="content container-fluid">
				
				
				
				
					<!-- Page Header -->
					<div class="page-header">
					
					
						<div class="row">
							<div class="col-sm-12">
								<h3 class="page-title">Company Settings</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Company Settings</li>
								</ul>
							</div>
						</div>
					</div>

		
	<%
    csDAO aa = new csDAO();
    List<CompanySettingsBean> companySettingsList = aa.getAllCS();

    // Initialize the company object outside the if block
    CompanySettingsBean company = null;

    if (companySettingsList != null && !companySettingsList.isEmpty()) {
        company = companySettingsList.get(0); // Assuming only one record is fetched
    }
%>	
		
		
	
           <form action="./EditCSSrv" method="post">
 


								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Company Name <span class="text-danger">*</span></label>
									<%-- 		        <input type="text" id="companyName" name="companyName" value="<%= company.getCompanyName() %>"> value="<%= companyName %>">  --%>
									
											<input class="form-control" type="text" name="CompanyName" value="<%= (company != null) ? company.getCompanyName() : "" %>">   
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label>Contact Person</label>
											<input class="form-control "  type="text" name="ContactPerson" value="<%= (company != null) ? company.getContactPerson() : "" %>">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label>Address</label>
											<input class="form-control "  type="text" name="Address" value="<%= (company != null) ? company.getAddress() : "" %>" >
										</div>
									</div>
									<div class="col-sm-6 col-md-6 col-lg-3">
										<div class="form-group">
											<label>Country</label>
											
											<input class="form-control "  type="text" name="Country" value="<%= (company != null) ? company.getCountry() : "" %>">
										</div>
									</div>
									<div class="col-sm-6 col-md-6 col-lg-3">
										<div class="form-group">
											<label>City</label>
											<input class="form-control"  type="text" name="City" value="<%= (company != null) ? company.getCity() : "" %>">
										</div>
									</div>
									<div class="col-sm-6 col-md-6 col-lg-3">
										<div class="form-group">
											<label>State</label>

											<input class="form-control "  type="text" name="State" value="<%= (company != null) ? company.getState() : "" %>">
										</div>
									</div>
									<div class="col-sm-6 col-md-6 col-lg-3">
										<div class="form-group">
											<label>Postal Code</label>
											<input class="form-control"  type="text" name="PostalCode" value="<%= (company != null) ? company.getPostalCode() : "" %>">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Email</label>
											<input class="form-control"  type="email" name="Email" value="<%= (company != null) ? company.getEmail() : "" %>">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label>Phone Number</label>
											<input class="form-control"  type="text" name="PhoneNumber" value="<%= (company != null) ? company.getPhoneNumber() : "" %>">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Mobile Number</label>
											<input class="form-control"  type="text" name="MobileNumber" value="<%= (company != null) ? company.getMobileNumber() : "" %>">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label>Fax</label>
											<input class="form-control"  type="text" name="Fax" value="<%= (company != null) ? company.getFax() : "" %>">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label>Website Url</label>
											<input class="form-control"  type="text" name="WebsiteUrl" value="<%= (company != null) ? company.getWebsiteUrl() : "" %>">
										</div>
									</div>
								</div>
								  <div class="submit-section">
									<!-- <button class="btn btn-primary submit-btn">Save</button> -->
								 
		
                                   <button class="btn btn-primary submit-btn" type="submit" name="action" value="edit">Edit</button> 
		 </div> 
						 	</form>
 
 

      
         
         <!-- jQuery -->
        <script src="js/jquery-3.2.1.min.js"></script>

		<!-- Bootstrap Core JS -->
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

		<!-- Slimscroll JS -->
		<script src="js/jquery.slimscroll.min.js"></script>
		
		<!-- Datatable JS -->
		<script src="js/jquery.dataTables.min.js"></script>
		<script src="js/dataTables.bootstrap4.min.js"></script>

		<!-- Custom JS -->
		<script src="js/app.js"></script>

         
</body>
</html> 
