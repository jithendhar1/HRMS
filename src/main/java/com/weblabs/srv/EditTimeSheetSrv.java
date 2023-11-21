package com.weblabs.srv;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weblabs.beans.AddTimesheet;
import com.weblabs.service.impl.AddTimeSheetImpl;
			
@WebServlet("/EditTimeSheetSrv")
public class EditTimeSheetSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

      //  HttpSession session = request.getSession();
      //  String userType = (String) session.getAttribute("usertype");
      //  String userName = (String) session.getAttribute("username");
      //  String password = (String) session.getAttribute("password");

       // if (userType == null || !userType.equals("admin")) {
          //  response.sendRedirect("login.jsp?message=Access Denied, Login As Admin!!");
           // return;
       // } else if (userName == null || password == null) {
           // response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
          //  return;
        //}

        // Login success
    	
        String status = "Edit Employee Failed!";
        String id= request.getParameter("id");
        String project = request.getParameter("project");
        String deadline = request.getParameter("deadline");
        String totalhours = request.getParameter("totalhours");
        String remaininghours= request.getParameter("remaininghours");
        String date= request.getParameter("date");
        String hours= request.getParameter("hours");
        String description= request.getParameter("description");
       
      
        

        AddTimesheet employee = new AddTimesheet();
        employee.setId(id);
        employee.setProject(project);
        employee.setDeadline(deadline);
        employee.setTotalhours (totalhours);
        employee.setRemainingHours(remaininghours);
        employee.setDate(date);
        employee.setHours(hours);
        employee.setDescription(description);
        
        
        AddTimeSheetImpl dao = new AddTimeSheetImpl();

        String status1 = dao.editTimesheet(id,project,deadline,totalhours,remaininghours,date, hours, description );

        RequestDispatcher rd = request.getRequestDispatcher("edit_timesheet.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
