<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.AddClientsDAO" %>
<%@ page import="com.weblabs.beans.AddClient" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>
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

 <!--    Lineawesome CSS -->
    <link rel="stylesheet" href="css/line-awesome.min.css">

 <!--    Select2 CSS -->
    <link rel="stylesheet" href="css/select2.min.css">

 <!--    Datetimepicker CSS -->
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">

 <!--    Main CSS -->
    <link rel="stylesheet" href="css/style.css">
 <!--    table styles CSS -->
  
 </head>
<body>
<%
    int start = 0;
    int limit = 25;

    String idFilter = request.getParameter("Clientid"); // Make sure the parameter name matches your form
    List<AddClient> designations = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "Clientid = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        designations = AddClientsDAO.getFilteredAddClient(whereClause, start, limit);
    }

    if (designations != null && !designations.isEmpty()) {
    	AddClient designation = designations.get(0); // Access the first element
        if (designations != null) {
%>

   
     
   <div class="main-wrapper">

    <!-- Header -->
    <!-- Include your header HTML here -->
    <jsp:include page="header.jsp" />

    <!-- Sidebar -->
    <!-- Include your sidebar HTML here -->
    <jsp:include page="sidebar.jsp" />

    <!-- Page Wrapper -->
    <div class="page-wrapper">

        <!-- Page Content -->
        <div class="content container-fluid">

            <!-- Page Header -->
            
            <div class="page-header">

<form action="./EditClientsSRV" method="post">
                           <div class="row">
                         <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">First Name <span class="text-danger">*</span></label>
                                <input class="form-control" name="FirstName" value="Barry" type="text">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Last Name</label>
                                <input class="form-control" name="LastName" value="Cuda" type="text">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Username <span class="text-danger">*</span></label>
                                <input class="form-control" name="Username" value="barrycuda" type="text">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Email <span class="text-danger">*</span></label>
                                <input class="form-control floating" name="Email" value="barrycuda@example.com" type="email">
                            </div>
                        </div>
                        <!-- <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Password</label>
                                <input class="form-control" value="barrycuda" type="password">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Confirm Password</label>
                                <input class="form-control" value="barrycuda" type="password">
                            </div>
                        </div> -->
                        <div class="col-md-6">  
                            <div class="form-group">
                                <label class="col-form-label">Client ID <span class="text-danger">*</span></label>
                                <input  class="form-control floating" name="Clientid" value="CLT-0001" type="text">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Phone </label>
                                <input class="form-control" name="Phone" value="9876543210" type="text">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Company Name</label>
                                <input class="form-control" name="Company" type="text" value="Global Technologies">
                            </div>
                        </div>
                         <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Address</label>
                                <input class="form-control" name="Address" type="text" value="Global Technologies">
                            </div>
                        </div> 
                  
                    <div class="submit-section">
                        <button class="btn btn-primary submit-btn" type="submit">Update</button>
                    </div>
                      </div>
</form>
            </div>
        </div>
    </div>
</div>
<%
    HttpSession sessionstatus = request.getSession(true);

    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("Employee Position Updated Successfully!")) {
        response.sendRedirect("clients.jsp");
    } else {
%>
   <div class="col-sm-6">
		<p>designation not found with the provided ID.</p>
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
						