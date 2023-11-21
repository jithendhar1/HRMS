<%@ page import="com.weblabs.service.impl.InvoiceDAO" %>
<%@ page import="com.weblabs.beans.AddInvoice" %>
<%@ page import="com.weblabs.beans.AddInvoiceItems" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Invoices - HRMS admin template</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
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
         <jsp:include page="header.jsp" />
              <!-- Include your header HTML here -->
 
        <!-- Sidebar -->
        <jsp:include page="sidebar.jsp" />
        <!-- Include your sidebar HTML here -->
			<!-- Page Wrapper -->
            <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
				
					<!-- Page Header -->
					<div class="page-header">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="page-title">Invoices</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Invoices</li>
								</ul>
							</div>
							<div class="col-auto float-right ml-auto">
								<a href="create-invoice.jsp" class="btn add-btn"><i class="fa fa-plus"></i> Create Invoice</a>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<!-- Search Filter -->
					 <!-- Search form -->
             <form action="./InvoiceSearchSRV" method="post">
              
            <div class="row filter-row">
                <div class="col-sm-6 col-md-3">
                    <div class="form-group form-focus">
                        <label for="Employee">ID :</label>
                        <input type="text" name="id" id="Employee">
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="form-group form-focus select-focus">
                        <label for="overtime_date">Client:</label>
                        <input type="text" name="client" id="overtime_date">
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <input type="submit" value="Search">
                </div>
            </div>
            	<input type="hidden" name="start" value="<%= currentPage %>">
                <input type="hidden" name="limit" value="<%= newRecordsPerPage %>">
                <div class="col-sm-6 col-md-3">
                    <label>Records per page:</label>
                    <select id="recordsPerPage" onchange="changeRecordsPerPage()">
                        <option value="5">5</option>
                        <option value="10">10</option>
                        <option value="20">20</option>
                        <option value="50">50</option>
                    </select>
                </div>
            </form>
					<!-- /Search Filter -->
					
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-striped custom-table mb-0">
			<thead>
				<tr>
                <th>Invoice ID</th>
                    <th>Client</th>
                    <th>Project</th>
                    <th>Email</th> 
                    <th>Tax</th>
                    <th>Client Address</th>
                    <th>Billing Address</th>
                    <th>Invoice Date</th>
                    <th>Due Date</th>
                    <th>OtherInformation</th>
                    <th>Discount</th>
                    <th>Tax Amount</th>
                    <th>Grand Total</th>
                    <th>Invoice ID</th>
					<th>Item</th>
					<th>Description</th>
					<th>UnitCost</th> 
					<th>Quantity</th>
					<th>Amount</th>
                </tr>
				</thead>
           <tbody>        
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
		String usernameFilter = request.getParameter("client");
		String idFilter = request.getParameter("id");
		List<AddInvoice> resultSet;
		
		String whereClause = ""; // Initialize an empty whereClause
		
		if (usernameFilter != null && !usernameFilter.isEmpty()) {
		    whereClause = "client = '" + usernameFilter + "'";
		      }
		
		if (idFilter != null && !idFilter.isEmpty()) {
		    if (!whereClause.isEmpty()) {
		        whereClause += " or ";
		    }
		    whereClause += "id = '" + idFilter + "'";
		}
		//page
        int recordcount=InvoiceDAO.totalCount();

       noOfPages = (int) Math.ceil((double) recordcount / limit);
       //pagee
		if (!whereClause.isEmpty()) {
		    // Apply the whereClause condition
		    resultSet = InvoiceDAO.getFilteredInvoices(whereClause, start, limit);
		} else {
		    // Retrieve all data based on the limit
		    resultSet = InvoiceDAO.getFilteredInvoices("", start, limit);
		}

// AddInvoice lastInvoice = null;
 
for (int i = 0; i < resultSet.size(); i++) {
    AddInvoice invoice = resultSet.get(i);
%>

    <tr>
        <td><%= invoice.getId() %></td>
        <td><%= invoice.getClient() %></td>
        <td><%= invoice.getProject() %></td>
        <td><%= invoice.getEmail() %></td>
        <td><%= invoice.getTax() %></td>
        <td><%= invoice.getClientAddress() %></td>
        <td><%= invoice.getBillingAddress() %></td>
        <td><%= invoice.getInvoicedate() %></td>
        <td><%= invoice.getDueDate() %></td>
        <td><%= invoice.getOtherInformation() %></td>
        <td><%= invoice.getDiscount() %></td>
        <td><%= invoice.getTaxamount() %></td>
        <td><%= invoice.getGrandtotal() %></td>		
			<%
				 List<AddInvoiceItems> invoiceItems = InvoiceDAO.getInvoiceItemsByInvoiceId(invoice.getId());
				    for (AddInvoiceItems invoiceItem : invoiceItems) {
				    %>
				   
				         <!-- Empty column for consistency with the header -->
				        <td><%= invoiceItem.getInvoiceid() %></td>
				        <td><%= invoiceItem.getItem() %></td>
				        <td><%= invoiceItem.getDescription() %></td>
				        <td><%= invoiceItem.getUnitCost() %></td>
				        <td><%= invoiceItem.getQty() %></td>
				        <td><%= invoiceItem.getAmount() %></td>
				    </tr>

				    <%
				    }
				    %>
		<%
}   
				    %>
				   
	 </tbody>  			
		</table>
		
		
		<div class="row justify-content-center align-items-center">
   
   <!-- Pagination links -->

    <% if (pageno > 1) { %>
        <a href="invoices.jsp?page=<%=pageno - 1%>">Previous</a>
    <% } %>

    <% for (int i = 1; i <= noOfPages; i++) { %>
        <% if (i == pageno) { %>
            <%= i %>
        <% } else { %>
            <a href="invoices.jsp?page=<%=i%>"><%="&nbsp;&nbsp;&nbsp;" + i + "&nbsp;&nbsp;"%></a>
        <% } %>
    <% } %>

    <% if (pageno < noOfPages) { %>
        <a href="invoices.jsp?page=<%=pageno + 1%>">Next</a>
    <% } %>

</div>
			
							</div>
						</div>
					</div>
                </div>
				<!-- /Page Content -->
				
            </div>
			<!-- /Page Wrapper -->

        </div>
		
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
		
		<script>
    $(document).ready(function () {
        $("#filterButton").click(function () {
            // Get filter criteria (username and id)
            var usernameFilter = $("#client").val();
            var idFilter = $("#id").val();
            
            // Make an AJAX request to the server
            $.ajax({
                type: "POST", // Use POST or GET depending on your servlet configuration
                url: "./InvoiceSearchSRV",
                data: {
                    username: usernameFilter,
                    id: idFilter
                },
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