package com.weblabs.srv;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.AddDepartment;
import com.weblabs.service.impl.DepartmentDAO;

@WebServlet("/DepartmentSearchSrv")
public class DepartmentSearchSrv extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
    	String departmentFilter = request.getParameter("DepartmentName");
        String idFilter = request.getParameter("id");
  
       // String startParam = request.getParameter("start");
        String startParam = request.getParameter("start");
        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
        String limitParam = request.getParameter("limit");
		//  int start = Integer.parseInt(startParam); 
		 
        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
        //int limit = Integer.parseInt(limitParam); 
	
      List<AddDepartment> departments;
        
        

        if (departmentFilter != null && !departmentFilter.isEmpty() || idFilter != null && !idFilter.isEmpty()) {
            // Apply filters for both username and ID
        	if (idFilter == null || idFilter.isEmpty()) {
        	 int idFilterInt = 0;
        	 departments = DepartmentDAO.getFilteredDepartments("DepartmentName like '%" + departmentFilter + "%' or Id = '" + idFilterInt + "'", start, limit);
        	}
        	else {
        		departments = DepartmentDAO.getFilteredDepartments("DepartmentName like '%" + departmentFilter + "%' or Id = '" + idFilter + "'", start, limit);
        	}
        	} else {
            // Retrieve all data
        		departments = DepartmentDAO.getFilteredDepartments("", start, limit);
        }

      request.setAttribute("departments", departments);
      request.setAttribute("search", "true");
      request.getRequestDispatcher("/departments.jsp").forward(request, response);

      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
    }
}
