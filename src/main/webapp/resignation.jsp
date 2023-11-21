<%@ page import="com.weblabs.service.impl.ResignationDAO" %>
<%@ page import="com.weblabs.beans.AddResignation" %>
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
    <title>Resignation - HRMS admin template</title>

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

    <!-- Datatable CSS -->
    <link rel="stylesheet" href="css/dataTables.bootstrap4.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/tstyle.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <script src="assets/js/html5shiv.min.js"></script>
    <script src="assets/js/respond.min.js"></script>
</head>
<body>
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
    var recordsPerPage = <%= newRecordsPerPage %>; // Use Java variable in JavaScript
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
                        <h3 class="page-title">Resignation</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item active">Resignation</li>
                        </ul>
                    </div>
                    <div class="col-auto float-right ml-auto">
                        <a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_resignation"><i class="fa fa-plus"></i> Add Resignation</a>
                    </div>
                </div>
            </div>

            <!-- Search form -->
            <form action="./ResignationSearchSrv" method="post">
                <div class="row filter-row">
                    <div class="col-sm-6 col-md-3">
                        <div class="form-group form-focus">
                            <label for="resigningemployee">ResigningEmployee:</label>
                            <input type="text" name="resigningemployee" id="resigningemployee">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="form-group form-focus select-focus">
                            <label for="resignationdate">ResignationDate:</label>
                            <input type="text" name="resignationdate" id="resignationdate">
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
        </div>
        
        <table>
            <tr>
                <th>id</th>
                <th>Resigning Employee</th>
                <th>Notice Date</th>
                <th>Resignation Date</th>
                <th>Reason</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
       
        <%
            //int start = 0;
            //int limit = 25;
            int start = currentPage;
            int limit = newRecordsPerPage;

            // Pagination code start
            int pageno = 1;
            int noOfPages = 0;

            String pageNoStr = request.getParameter("page");

            if (pageNoStr != null) {
                pageno = Integer.parseInt(pageNoStr);
            }

            start = (pageno - 1) * limit;
            // Pagination code ended

            String resigningempnameFilter = request.getParameter("resigningemployee");
            String dateFilter = request.getParameter("resignationdate");
            List<AddResignation> trainers;

            String whereClause = ""; // Initialize an empty whereClause

            if (resigningempnameFilter != null && !resigningempnameFilter.isEmpty()) {
                whereClause = "resigningemployee like '%" + resigningempnameFilter + "%'";
            }

            if (dateFilter != null && !dateFilter.isEmpty()) {
                if (!whereClause.isEmpty()) {
                    whereClause += " or ";
                }
                whereClause += "resignationdate = '" + dateFilter + "'";
            }
            // Page
            int recordcount = ResignationDAO.totalCount();

            noOfPages = (int) Math.ceil((double) recordcount / limit);
            // Page

            if (!whereClause.isEmpty()) {
                // Apply the whereClause condition
                trainers = ResignationDAO.getFilteredResignation(whereClause, start, limit);
            } else {
                // Retrieve all data based on the limit
                trainers = ResignationDAO.getFilteredResignation("", start, limit);
            }
            for (AddResignation train : trainers) {
        %>
        <tr>
            <td><%= train.getId() %></td>
            <td><%= train.getResigningEmployee() %></td>
            <td><%= train.getNoticeDate() %></td>
            <td><%= train.getResignationDate() %></td>
            <td><%= train.getReason() %></td>
            <td>
                <a href="edit_resignation.jsp?id=<%= train.getId() %>">Edit</a>
            </td>
            <td>
                <a href="DeleteResignationSrv?id=<%= train.getId() %>">Delete</a>
            </td>
        </tr>
        <%
            }
        %>
        </table>
        <div class="row justify-content-center align-items-center">
            <!-- Pagination links -->
            <% if (pageno > 1) { %>
            <a href="resignation.jsp?page=<%= pageno - 1 %>">Previous</a>
            <% } %>

            <% for (int i = 1; i <= noOfPages; i++) { %>
            <% if (i == pageno) { %>
            <%= i %>
            <% } else { %>
            <a href="resignation.jsp?page=<%= i %>"><%= i %></a>
            <% } %>
            <% } %>

            <% if (pageno < noOfPages) { %>
            <a href="resignation.jsp?page=<%= pageno + 1 %>">Next</a>
            <% } %>
        </div>
    </div>
    <!-- /Page Content -->

    <!-- Add Promotion Modal -->
    <jsp:include page="add_resignation.jsp" />
    <!-- /Add Promotion Modal -->
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

<!-- Datatable JS -->
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap4.min.js"></script>

<!-- Custom JS -->
<script src="js/app.js"></script>
<script>
    $(document).ready(function () {
        $("#filterButton").click(function () {
            // Get filter criteria (username and id)
            var usernameFilter = $("#resigningemployee").val();
            var idFilter = $("#resignationdate").val();

            // Make an AJAX request to the server
            $.ajax({
                type: "POST", // Use POST or GET depending on your servlet configuration
                url: "./ResignationSearchSrv",
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
