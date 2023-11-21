package com.weblabs.srv;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddPF;
import com.weblabs.service.impl.AddPFDAO;


@WebServlet("/PF_SRV")
public class PF_SRV extends HttpServlet{

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
	    	String employeenameFilter = request.getParameter("EmployeeName");
	        String idFilter = request.getParameter("id");
	  
	       // String startParam = request.getParameter("start");
	        String startParam = request.getParameter("start");
	        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
	        String limitParam = request.getParameter("limit");
			//  int start = Integer.parseInt(startParam); 
			 
	        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
	        //int limit = Integer.parseInt(limitParam); 
		
	      List<AddPF> pf;
	        
	        

	        if (employeenameFilter != null && !employeenameFilter.isEmpty() || idFilter != null && !idFilter.isEmpty()) {
	            // Apply filters for both username and ID
	        	if (idFilter == null || idFilter.isEmpty()) {
	        	 int idFilterInt = 0;
	        	 pf = AddPFDAO.getFilteredAddPF("EmployeeName like '%" + employeenameFilter + "%' or id = '" + idFilterInt + "'", start, limit);
	        	}
	        	else {
	        		pf = AddPFDAO.getFilteredAddPF("EmployeeName like '%" + employeenameFilter + "%' or id = '" + idFilter  + "'", start, limit);
	        	}
	        	} else {
	            // Retrieve all data
	        		pf = AddPFDAO.getFilteredAddPF("", start, limit);
	        }

	      request.setAttribute("provident-fund", pf);
	      request.setAttribute("search", "true");
	      request.getRequestDispatcher("/provident-fund.jsp").forward(request, response);

	      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
	    }
}