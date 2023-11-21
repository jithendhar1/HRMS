<%@page import="com.weblabs.service.impl.AppProjectDAO"%>
<%@page import="com.weblabs.service.impl.AddClientsDAO"%>
<%@page import="com.weblabs.service.impl.InvoiceDAO"%>
<%@ page import="com.weblabs.beans.AddClient" %>	
<%@ page import="com.weblabs.beans.CreateProject" %>
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
        <title>Create Invoice - HRMS admin template</title>
		
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
		
		<!-- Dāatetimepicker CSS -->
		<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="css/style.css">
		<!-- <link rel="stylesheet" href="css/tstyles.css"> -->
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
		 <style>
        #itemTable {
            max-height: 300px; /* Adjust the maximum height as needed */
            overflow-y: auto;
        }
        .disabled-link {
			    color: gray; /* Change the text color to gray */
			    pointer-events: none; /* Remove pointer events, making it non-clickable */
			}
    </style>
    </head>
    <body>
    <form action="./AddInvoiceSrv" method="post">
		<!-- Main Wrapper -->
        <div class="main-wrapper">
		
			<!-- Header -->
        <!-- Include your header HTML here -->
         <jsp:include page="header.jsp" />

        <!-- Sidebar -->
        <!-- Include your sidebar HTML here -->
        <jsp:include page="sidebar.jsp" />
			<!-- /Sidebar -->
			
			<!-- Page Wrapper -->
            <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
				
					<!-- Page Header -->
					<div class="page-header">
						<div class="row">
							<div class="col-sm-12">
								<h3 class="page-title">Create Invoice</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Create Invoice</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">
						<div class="col-sm-12">
							
								<div class="row">
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Client Username<span class="text-danger">*</span></label>
											<select required name="client" class="select">
                                           <!--    <input type="hidden" id="departmentIdInput" name="departmentId" value="">  -->
                                             <%
											List<AddClient> dept = AddClientsDAO.getAllClient();
											for(AddClient dep: dept)
											{
											%>
                                           <option  value="<%= dep.getClientID() %>"><%= dep.getUsername()%></option>
                                        <%
                          					}
									     %>
                                    </select>
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Project <span class="text-danger">*</span></label>
											<select required name="projectname" class="select">
                                           <!--    <input type="hidden" id="departmentIdInput" name="departmentId" value="">  -->
                                             <%
											List<CreateProject> prj = AppProjectDAO.getAllproject();
											for(CreateProject dep: prj)
											{
											%>
                                           <option><%= dep.getProjectname()%></option>
                                        <%
                          					}
									     %>
									     </select>
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Email</label>
											<input name="email" class="form-control" type="email">
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Tax</label>
											<select class="select" name="tax" id="taxSelect" onchange="updateTaxRate()">
												    <option value="0">Select Tax</option>
												    <option value="10">VAT (10%)</option>
												    <option value="20">GST (20%)</option>
												    <option value="0">No Tax</option>
												</select>
											<!-- 	<p>Tax Rate: <span id="taxRate">0.0</span></p> -->
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Client Address</label>
											<textarea name="clientaddress" class="form-control" rows="3"></textarea>
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Billing Address</label>
											<textarea name="billingaddress" class="form-control" rows="3"></textarea>
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Invoice date <span class="text-danger">*</span></label>
											<div class="cal-icon">
												<input name="invoicedate" class="form-control datetimepicker" type="text">
											</div>
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Due Date <span class="text-danger">*</span></label>
											<div class="cal-icon">
												<input name="duedate" class="form-control datetimepicker" type="text">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 col-sm-12">
										<div class="table-responsive">
											<table class="table table-hover table-white" id="itemTable" >
												<thead>
													<tr>
														<th style="width: 20px">ID</th>
														<th class="col-sm-2">Item</th>
														<th class="col-md-6">Description</th>
														<th style="width:100px;">Unit Cost</th>
														<th style="width:80px;">Qty</th>
														<th>Amount</th>
														<th> </th>
													</tr>
												</thead>
												<tbody>
												<tr>
													<td>1</td>
													<td>
														<input name="items" class="form-control" type="text" style="min-width:150px">
													</td>
													<td>
														<input name="description" class="form-control" type="text" style="min-width:150px">
													</td>
													<td>
														<input name="unitcost" class="form-control" style="width:100px" type="text">
													</td>
													<td>
														<input name="qty" class="form-control" style="width:80px" type="text"  onblur="calculateStaticAmount()">
													</td>
													<td>
														<input name="amount" class="form-control" style="width:100px" type="text" readonly>
													</td>
													 <td>
										                <a href="javascript:void(0)" class="text-success font-18" title="Add" onclick="addItem(this)"><i class="fa fa-plus"></i> </a>
										            </td>
										            <td>
										                <a href="javascript:void(0)" class="text-danger font-18 disabled-link"  title="Remove" ><i class="fa fa-trash-o"></i> </a>
										            </td>
										
												</tr>

												</tbody>
											</table>
										</div>
										<div class="table-responsive">
											<table class="table table-hover table-white" >
												<tbody>
													<tr>
														
														<td colspan="5"  class="text-right">Total</td>
														<td style="text-align: right; padding-right: 30px;width: 230px">
														<input name="total" id="total" class="form-control text-right" readonly type="text">
														</td>
													</tr>
													<tr>
														<td colspan="3" class="text-right">Tax Rate %</td>
														<td style="text-align: right; padding-right: 30px;width: 230px">
														
															<input id="taxrate" name="taxrate" class="form-control text-right" type="text" onchange="updateTaxRate()">
															</td>
															
														   	<td colspan="5" class="text-right">Tax Amount</td>
															<td style="text-align: right; padding-right: 30px;width: 230px">
															    <input id=  "taxAmount" name="taxAmount" class="form-control text-right" readonly  type="text" >
															</td>
													</tr>

													<tr>
														<td colspan="5" class="text-right">
															Discount %
														</td>
														<td style="text-align: right; padding-right: 30px;width: 230px">
															

															<input name="discount" id="discount" class="form-control text-right" type="text" value="0" onblur="calculateAll()">
															
														</td>
													</tr>
													<tr>
														<td colspan="5" style="text-align: right; font-weight: bold">
															Grand Total
														</td>
														<td style="text-align: right; padding-right: 30px; font-weight: bold; font-size: 16px;width: 230px">
														
															<input name="grandtotal" id="grandtotal" class="form-control text-right" type="text" value="0" onblur="calculateAll()">
														</td>
													</tr>
												</tbody>
											</table>                               
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group" >
													<label>Other Information</label>
													<textarea name="OtherInformation" id="OtherInformation" class="form-control"></textarea>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="submit-section">
								<button class="btn btn-primary submit-btn m-r-10">Save &amp; Send</button>
									<button class="btn btn-primary submit-btn">Save</button>
								</div>
							
						</div>
					</div>
				</div>
				<!-- /Page Content -->
				
			</div>
			<!-- /Page Wrapper -->
			
        </div>
	!-- /Main Wrapper -->
		<!-- Inside your HTML form -->

		
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
          <script>
    var taxAmount = 0;
    var discount = 0;

    function updateTaxRate() {
        console.log("updateTaxRate entered");
        var taxSelect = document.getElementById("taxSelect");
        var selectedOption = taxSelect.options[taxSelect.selectedIndex];
        var taxRate = parseFloat(selectedOption.value);

        var taxRateInput = document.querySelector('input[name="taxrate"]');
        taxRateInput.value = taxRate.toFixed(1);

        // Recalculate tax amount and grand total with the updated tax rate
        calculateAll();
    }

    function calculateAmount(row) {
        console.log("calculateAmount entered");
        var unitCostInput = row.querySelector('input[name="unitcost"]');
        var qtyInput = row.querySelector('input[name="qty"]');
        var amountInput = row.querySelector('input[name="amount"]');

        var unitCost = parseFloat(unitCostInput.value) || 0;
        var quantity = parseFloat(qtyInput.value) || 0;

        var amount = unitCost * quantity;
        amountInput.value = amount.toFixed(2);

        // Calculate and update the total
        calculateAll();
    }

    function calculateAll() {
        console.log("calculateAll entered");
        var itemRows = document.querySelectorAll('#itemTable tbody tr');
        var total = 0;

        itemRows.forEach(function (row) {
            var amountInput = row.querySelector('input[name="amount"]');
            total += parseFloat(amountInput.value) || 0;
        });

        var totalInput = document.querySelector('input[name="total"]');
        totalInput.value = total.toFixed(2);

        calculateTaxAndGrandTotal(total);
    }

    function calculateTaxAndGrandTotal(total) {
        console.log("calculateTaxAndGrandTotal entered");
        var taxRateInput = document.querySelector('input[name="taxrate"]');
        var taxRate = parseFloat(taxRateInput.value) || 0;

        taxAmount = (total * taxRate) / 100;
        console.log("Tax Amount:", taxAmount);
        var taxAmountInput = document.querySelector('input[name="taxAmount"]');
        taxAmountInput.value = taxAmount.toFixed(2);

        calculateGrandTotal(total, taxAmount);
    }

    function calculateGrandTotal(total, taxAmount) {
        console.log("calculateGrandTotal entered");
        var discountInput = document.querySelector('input[name="discount"]');
        discount = parseFloat(discountInput.value) || 0;
        
        // Ensure that the discount is less than 99%
        if (discount >= 99) {
            discountInput.value = 0; // Reset the discount to 0
            discount = 0;
        }

        var grandTotal = total + taxAmount - (total * discount / 100);

        var grandTotalInput = document.querySelector('input[name="grandtotal"]');
        grandTotalInput.value = grandTotal.toFixed(2);

        // Retrieve the values and display them
        var taxRateInput = document.querySelector('input[name="taxrate"]');
        var taxRate = parseFloat(taxRateInput.value) || 0;

        var taxAmountInput = document.querySelector('input[name="taxAmount"]');
        var taxAmount = parseFloat(taxAmountInput.value) || 0;

        var grandTotalValue = parseFloat(grandTotalInput.value) || 0;

        // Display the values on the page or use them as needed
      	
        
       
    }

    // Attach event listeners to relevant input elements
    document.querySelectorAll('input[name="unitcost"]').forEach(function (input) {
        input.addEventListener('input', function () {
            var row = input.closest('tr');
            calculateAmount(row);
        });
    });

    document.querySelectorAll('input[name="qty"]').forEach(function (input) {
        input.addEventListener('input', function () {
            var row = input.closest('tr');
            calculateAmount(row);
        });
    });

    
    document.querySelector('input[name="discount"]').addEventListener('input', calculateAll);

    window.onload = function () {
        updateTaxRate(); // Update tax rate on page load
    };
</script>



		</form>
    </body>
</html>