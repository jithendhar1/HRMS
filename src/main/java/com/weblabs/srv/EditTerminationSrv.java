package com.weblabs.srv;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weblabs.beans.AddTermination;
import com.weblabs.service.impl.AddTerminationServiceImpl;
			
@WebServlet("/EditTerminationSrv")
public class EditTerminationSrv extends HttpServlet {
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
        String status = "termination Failed!";
        
        String terminationemp = request.getParameter("terminationemp");
        String terminationtype = request.getParameter("terminationtype");
        String terminationdate = request.getParameter("terminationdate");
        String reason= request.getParameter("reason");
        String noticedate= request.getParameter("noticedate");
        String id= request.getParameter("id");
      
        

        AddTermination employee = new AddTermination();
       
        employee.setTerminatedEmployee(terminationemp);
        employee.setTerminationType(terminationtype);
        employee.setTerminationDate (terminationdate);
        employee.setReason(reason);
        employee.setNoticeDate(noticedate);
        employee.setId(id);
        
        AddTerminationServiceImpl dao = new AddTerminationServiceImpl();

         status = dao.editTermination( id,terminationemp,terminationtype,terminationdate,reason,noticedate );

        RequestDispatcher rd = request.getRequestDispatcher("edit_termination.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}