package com.weblabs.srv;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.AddDesignation;
import com.weblabs.service.impl.DesignationDAO;

@WebServlet("/DesignationSearchSrv")
public class DesignationSearchSrv extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
    	String designationFilter = request.getParameter("DesignationName");
        String idFilter = request.getParameter("id");
  
       // String startParam = request.getParameter("start");
        String startParam = request.getParameter("start");
        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
        String limitParam = request.getParameter("limit");
		//  int start = Integer.parseInt(startParam); 
		 
        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
        //int limit = Integer.parseInt(limitParam); 
	
      List<AddDesignation> designations;
        
        

        if (designationFilter != null && !designationFilter.isEmpty() || idFilter != null && !idFilter.isEmpty()) {
            // Apply filters for both username and ID
        	if (idFilter == null || idFilter.isEmpty()) {
        	 int idFilterInt = 0;
        	 designations = DesignationDAO.getFilteredDesignations("DesignationName like '%" + designationFilter + "%' or Id = '" + idFilterInt + "'", start, limit);
        	}
        	else {
        		designations = DesignationDAO.getFilteredDesignations("DesignationName like '%" + designationFilter + "%' or Id = '" + idFilter + "'", start, limit);
        	}
        	} else {
            // Retrieve all data
        		designations = DesignationDAO.getFilteredDesignations("", start, limit);
        }

      request.setAttribute("designations", designations);
      request.setAttribute("search", "true");
      request.getRequestDispatcher("/designations.jsp").forward(request, response);

      //  request.getRequestDispatcher("/designations.jsp").forward(request, response);
    }
}
