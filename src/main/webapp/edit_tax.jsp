<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.AddTaxDAO" %>
<%@ page import="com.weblabs.beans.AddTax" %>
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
    List<AddTax> tax = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "Id = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        tax = AddTaxDAO.getFilteredAddTax(whereClause, start, limit);
    }

    if (tax != null && !tax.isEmpty()) {
        AddTax taxes = tax.get(0); // Access the first element
        if (taxes != null) {
%>

<form action="./EditTaxSrv" method="post">
  <div class="main-wrapper">

      <jsp:include page="header.jsp" />
     <jsp:include page="sidebar.jsp" />
        
        <!-- Page Wrapper -->
        <div class="page-wrapper">

            <!-- Page Content -->
            <div class="content container-fluid">

                <!-- Page Header -->
                
                <div class="page-header">
    
                    <div class="row">
                        <div class="col-sm-6">
							<div class="modal-body">
							 
							 <div class="form-group">
				             <label>ID <span class="text-danger">*</span></label>
				               <input name="id" value="<%= taxes.getID() %>" required class="form-control" type="text">
				             </div>
							<div class="modal-body">
								
									<div class="form-group">
										<label>Tax Name <span class="text-danger">*</span></label>
										<input name="taxname" value="<%= taxes.getTaxName() %>" required class="form-control" value="VAT" type="text">
									</div>
									<div class="form-group">
										<label>Tax Percentage (%)  <span class="text-danger">*</span></label>
										<input name="taxper" value="<%= taxes.getTaxPercentage()%>" required class="form-control" value="14%" type="text">
									</div>
									<div class="form-group">
										<label>Status <span class="text-danger">*</span></label>
										<select class="select" value="<%= taxes.getStatus()%>" required name="status" >
											<option>Active</option>
											<option>Inactive</option>
										</select>
									</div>
									
									
									</div>
                        </div>
                    </div>
                    </div>
                    <div class="submit-section">
                        <button type="submit" class="btn btn-primary submit-btn">Update</button>
                    </div>
                
            </div>
        </div>
    </div>
    </div>
    </form>
<%
    HttpSession sessionstatus = request.getSession(true);
    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("provident found Position Updated Successfully!")) {
        response.sendRedirect("taxes.jsp");
    } else {
%>
   <div class="col-sm-6">
		<p>Expenses not found with the provided ID.</p>
</div>
<%
    }
%>
<%
        }
%>
<%
        }
%>
<!-- Include your JavaScript libraries here -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.slimscroll.min.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/app.js"></script>
</body>
</html>

			