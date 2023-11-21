package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.service.impl.EmployeeDAO;

@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    	// EmployeeServlet.java

    	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
    	//int totalPages = Integer.parseInt(request.getParameter("totalPages"));
    	int range = 5; // Number of page numbers to show



    	EmployeeDAO employeeDAO = new EmployeeDAO();
        int recordCount = employeeDAO.totalCount();
        
        int newRecordsPerPage = Integer.parseInt(request.getParameter("newRecordsPerPage"));
        int totalPages = (int) Math.ceil((double) recordCount / newRecordsPerPage);
        int startPage = Math.max(1, currentPage - range / 2);
    	int endPage = Math.min(totalPages, currentPage + range / 2);
    	

    	request.setAttribute("currentPage", currentPage);
    	request.setAttribute("totalPages", totalPages);
    	request.setAttribute("startPage", startPage);
    	request.setAttribute("endPage", endPage);
        // Forward the request to your JSP for rendering
        RequestDispatcher dispatcher = request.getRequestDispatcher("/editemployee.jsp");
        dispatcher.forward(request, response);
    }
}
