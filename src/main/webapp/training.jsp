<%@ page import="com.weblabs.service.impl.AddTrainingDAO" %>
<%@ page import="com.weblabs.beans.AddTraining" %>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.System" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Training - HRMS admin template</title>
		
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
		
		<!-- Datatable CSS -->
		<link rel="stylesheet" href="css/dataTables.bootstrap4.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="css/style.css">
         <link rel="stylesheet" href="css/styles.css">
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
    </head>
    <body>
     <!-- filtering records -->
<%
HttpSession sessionRec = request.getSession(true);

// Initialize recordsPerPage and currentPage as Java variables
String recordsPerPageStr = (String) sessionRec.getAttribute("recordsPerPage");
String currentPageStr = (String) sessionRec.getAttribute("currentPage");

if (recordsPerPageStr == null || "0".equals(recordsPerPageStr)) {
    recordsPerPageStr = "5"; // Set a default value, e.g., 1
    sessionRec.setAttribute("recordsPerPage", recordsPerPageStr);
}
int recordsPerPage = Integer.parseInt(recordsPerPageStr);

if (currentPageStr == null || "0".equals(currentPageStr)) {
    currentPageStr = "1"; // Set a default value, e.g., 1
    sessionRec.setAttribute("currentPage", currentPageStr);
}
int currentPage = Integer.parseInt(currentPageStr);

// Handle the change in recordsPerPage here
int newRecordsPerPage = 5; // Default value
String newRecordsPerPageParam = request.getParameter("newRecordsPerPage");
if (newRecordsPerPageParam != null) {
    newRecordsPerPage = Integer.parseInt(newRecordsPerPageParam);
    sessionRec.setAttribute("recordsPerPage", String.valueOf(newRecordsPerPage));
    //currentPage = 1; // Reset to the first page when changing recordsPerPage
    //sessionRec.setAttribute("currentPage", "1");
}

%>
<script>
    var recordsPerPage = <%= recordsPerPage %>; // Use Java variable in JavaScript
    var currentPage = <%= currentPage %>; 
 
    function changeRecordsPerPage() {
        var recordsPerPageSelect = document.getElementById("recordsPerPage");
        var selectedValue = recordsPerPageSelect.value;
        
        // Update the URL with the selected "recordsPerPage" value and navigate to it
        var baseUrl = window.location.href.split('?')[0];
        var newUrl = baseUrl + '?newRecordsPerPage=' + selectedValue;
        window.location.href = newUrl;
    }
</script>
		<!-- Main Wrapper -->
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
						<div class="row align-items-center">
							<div class="col">
								<h3 class="page-title">Training</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Training</li>
								</ul>
							</div>
							<div class="col-auto float-right ml-auto">
								<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_training"><i class="fa fa-plus"></i> Add New </a>
							</div>
							
						</div>
					</div>
					<!-- /Page Header -->
					
					<!-- Search Filter -->
		<form action="./TrainingSRV" method="post" > 
  		
                <div class="row filter-row">
                    <div class="col-sm-6 col-md-3">
                        <div class="form-group form-focus">
                            <label for="TrainingType">Training Type:</label>
                            <input type="text" name="TrainingType" id="TrainingType">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="form-group form-focus select-focus">
                            <label for="id">ID:</label>
                            <input type="text" name="id" id="id">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <input type="submit" value="Search">
                    </div>
                </div>
                 <input type="hidden"  name="start" value="<%= currentPage %>">
       	 			<input type="hidden"  name="limit" value="<%= newRecordsPerPage %>">
	
       	 			  </div> 
		          
			       <div class="col-sm-6 col-md-3">
			       <label>Records per page:</label>
			       <select id="recordsPerPage" onchange="changeRecordsPerPage()">
					    <option value="5">5</option>
					    <option value="10">10</option>
					    <option value="20">20</option>
					   <option value="50">50</option>
					</select>
					<%-- <select id="recordsPerPage" name="recordsPerPage" onchange="changeRecordsPerPage()">
						    <option value="5" <% if (session.getAttribute("recordsPerPage").equals("5")) out.print("selected"); %>>5</option>
						    <option value="10" <% if (session.getAttribute("recordsPerPage").equals("10")) out.print("selected"); %>>10</option>
						    <option value="20" <% if (session.getAttribute("recordsPerPage").equals("20")) out.print("selected"); %>>20</option>
						    <option value="100" <% if (session.getAttribute("recordsPerPage").equals("100")) out.print("selected"); %>>100</option>
						</select> --%>
			       </div>
	</form>
								<table>
									<thead>
										<tr>
											<th style="width: 30px;">ID</th>
											<th>Training Type</th>
											<th>Trainer</th>
											<th>Employee</th>
											<th>Training Cost</th>
											<th>StartDate</th>
											<th>EndDate</th>
											<th>DescriptionName</th>
											<th>Status</th>
											<th>Edit</th>
											<th>Delete</th>
											
										</tr>
									</thead>
		    <%
        	int start = currentPage;
        	int limit = newRecordsPerPage;
        	//pagenation code start
		    int pageno = 1;
		    int noOfPages =0;
		   
		     String pageNoStr = request.getParameter("page");
		     
		     if (pageNoStr != null) {
		         pageno = Integer.parseInt(pageNoStr);
		     }

		      start = (pageno - 1) * limit;
		     //pagenation code ended
            String usernameFilter = request.getParameter("TrainingType");
            String idFilter = request.getParameter("id");
            List<AddTraining> training;

            String whereClause = ""; // Initialize an empty whereClause

            if (usernameFilter != null && !usernameFilter.isEmpty()) {
                whereClause = "TrainingType = '" + usernameFilter + "'";
            }

            if (idFilter != null && !idFilter.isEmpty()) {
                if (!whereClause.isEmpty()) {
                    whereClause += " or ";
                }
                whereClause += "Id = '" + idFilter + "'";
            }
            //page
            int recordcount= AddTrainingDAO.totalCount();
          
           noOfPages = (int) Math.ceil((double) recordcount / limit);
           //pagee

            if (!whereClause.isEmpty()) {
                // Apply the whereClause condition
                training = AddTrainingDAO.getFilteredAddTrainingtype(whereClause, start, limit);
            } else {
                // Retrieve all data based on the limit
                training = AddTrainingDAO.getFilteredAddTrainingtype("", start, limit);
            }
            for (AddTraining train : training) {
        %>
        <tr>
            <td><%= train.getId()%></td>
            <td><%= train.getTrainingType()%></td>
            <td><%= train.getTrainer() %></td>
            <td><%= train.getEmployees() %></td>
            <td><%= train.getTrainingCost() %></td>
            <td><%= train.getStartingDate() %></td>
            <td><%= train.getEndingDate()%></td>
            <td><%= train.getDescriptionName()%></td>
            <td><%= train.getStatus()%></td>
             <td>
        <a href="edit_training.jsp?id=<%= train.getId()%>">Edit</a>
    </td>
    <td>
        <a href="DeleteTrainingServlet?id=<%= train.getId() %>">Delete</a>
    </td>
</tr>
       
        <%
            }
        %>
								</table>
<div class="row justify-content-center align-items-center">
   
   <!-- Pagination links -->

    <% if (pageno > 1) { %>
        <a href="training.jsp?page=<%=pageno - 1%>">Previous</a>
    <% } %>

    <% for (int i = 1; i <= noOfPages; i++) { %>
        <% if (i == pageno) { %>
            <%=i%>
        <% } else { %>
            <a href="training.jsp?page=<%=i%>"><%=i%></a>
        <% } %>
    <% } %>

    <% if (pageno < noOfPages) { %>
        <a href="training.jsp?page=<%=pageno + 1%>">Next</a>
    <% } %>

</div>
							</div>
						</div>
					<!-- </div> -->
         
				<!-- /Page Content -->

				<!-- Add Training List Modal -->
				<!-- <?php include_once("includes/modals/training/add.jsp"); ?-->
				<jsp:include page="add_training.jsp" />
				<!-- /Add Training List Modal -->
				
				<!-- Edit Training List Modal -->
				<jsp:include page="delete_training.jsp" />
				<!-- /Edit Training List Modal -->
				
				<!-- Delete Training List Modal -->
				<jsp:include page="edit_training.jsp" />
				<!-- /Delete Training List Modal -->
		
		<!-- jQuery -->
        <script src="js/jquery-3.2.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
		
		<!-- Slimscroll JS -->
		<script src="js/jquery.slimscroll.min.js"></script>
				
		<!-- Select2 JS -->
		<script src="js/select2.min.js"></script>
		
		<!-- Datatable JS -->
		<script src="js/jquery.dataTables.min.js"></script>
		<script src="js/dataTables.bootstrap4.min.js"></script>
		
		<!-- Datetimepicker JS -->
		<script src="js/moment.min.js"></script>
		<script src="js/bootstrap-datetimepicker.min.js"></script>
		
		<!-- Custom JS -->
		<script src="js/app.js"></script>

<script>
    $(document).ready(function () {
        $("#filterButton").click(function () {
            // Get filter criteria (username and id)
            var usernameFilter = $("#TrainingType").val();
            var idFilter = $("#id").val();
            
            // Make an AJAX request to the server
            $.ajax({
                type: "POST", // Use POST or GET depending on your servlet configuration
                url: "./TrainingSRV",
                data: {
                    username: usernameFilter,
                    id: idFilter
                }
                success: function (data) {
                	
                	  console.log("myFunction has been invoked.");
                    // Handle the response data, e.g., update the table with the filtered data
                    // You might need to format the data as required
                    $("#employeeTable").html(data);
                }
            });
        });
    });
</script>

    </body>
</html>