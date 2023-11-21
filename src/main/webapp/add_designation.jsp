<%@page import="com.weblabs.service.impl.DepartmentDAO"%>
<%@ page import="com.weblabs.beans.AddDepartment" %>
<%@ page import="java.util.List" %>
<form action="./AddDesignationSrv" method="post">
<div id="add_designation" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Designation</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    
                        <div class="form-group">
                            <label>Designation Name <span class="text-danger">*</span></label>
                            <input name="designation" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label>Department Name<span class="text-danger">*</span></label>
                            <select required name="department" class="select">
                           <%
											List<AddDepartment> dept = DepartmentDAO.getAllDepartmenet();
											for(AddDepartment dep: dept)
											{
											%>
                                           <option><%= dep.getDepartmentName() %></option>
                                        <%
                          					}
									     %>
                         </select>
                        </div>
                        <div class="submit-section">
                            <button name="add_designation" type="submit" class="btn btn-primary submit-btn">Submit</button>
                        </div>
                   
                </div>
            </div>
        </div>
    </div>
     </form>
     <%   response.sendRedirect("designation.jsp"); %>