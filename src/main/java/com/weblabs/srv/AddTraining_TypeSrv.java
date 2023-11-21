package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.service.impl.AddHolidaysServiceImp;
import com.weblabs.service.impl.AddTraining_TypeServiveImpl;

@WebServlet("/AddTraining_TypeSrv")
public class AddTraining_TypeSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;
	//private static final String addteam = null;

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

        String status = "Add Training Failed!";
        String type = request.getParameter("type");
        String description = request.getParameter("description"); 
        String Status = request.getParameter("Status");
       
         AddTraining_TypeServiveImpl training = new AddTraining_TypeServiveImpl();
        status = training.addTraining_Type(type, description, Status);
        

	   RequestDispatcher rd = request.getRequestDispatcher("add_training.jsp?message=" + status);
rd.forward(request, response);
} 
protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

doGet(request, response);
}
}
