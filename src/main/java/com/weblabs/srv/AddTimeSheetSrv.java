package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weblabs.service.impl.AddDepartmentImpl;
import com.weblabs.service.impl.AddTimeSheetImpl;

@WebServlet("/AddTimeSheetSrv")
public class AddTimeSheetSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        HttpSession session = request.getSession();
//        String userType = (String) session.getAttribute("usertype");
//        String userName = (String) session.getAttribute("username");
//        String password = (String) session.getAttribute("password");
//
//        if (userType == null || !userType.equals("admin")) {
//            response.sendRedirect("login.jsp?message=Access Denied!");
//        } else if (userName == null || password == null) {
//            response.sendRedirect("login.jsp?message=Session Expired, Login Again to Continue!");
//        }

        String status = "Add Timesheet Failed!";
        String id = request.getParameter("id");
        String project = request.getParameter("project");
        String deadline = request.getParameter("deadline");
        String totalhours = request.getParameter("totalhours");
        String remaininghours = request.getParameter("remaininghours");
        String date = request.getParameter("date");
        String hours = request.getParameter("hours");
        String description = request.getParameter("description");
        
        AddTimeSheetImpl time =new AddTimeSheetImpl();
        status=time.addTimesheet(id, project,deadline,totalhours,remaininghours,date,hours,description);
        
        
       //  String status = "success"; // Replace with your status variable
        RequestDispatcher rd = request.getRequestDispatcher("add_timesheet.jsp");
        request.setAttribute("message", status);
        rd.forward(request, response);
    		  
		/*
		 * RequestDispatcher rd =
		 * request.getRequestDispatcher("add_timesheet.jsp?message=" + status);
		 * rd.forward(request, response);
		 */
    } 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
