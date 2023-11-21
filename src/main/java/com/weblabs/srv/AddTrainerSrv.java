package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.service.impl.AddTrainersServletImp;


@WebServlet("/AddTrainerSrv")
public class AddTrainerSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = "Add Training Failed!";
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname"); 
        String role = request.getParameter("role"); 
        String email = request.getParameter("email"); 
        String phone = request.getParameter("phone"); 
        String Status = request.getParameter("status");
        String DescriptionName = request.getParameter("DescriptionName"); 
       
        AddTrainersServletImp training =new AddTrainersServletImp();
        status = training.addTrainers(firstname, lastname, role, email, phone, Status, DescriptionName);
        

	   RequestDispatcher rd = request.getRequestDispatcher("add_trainers.jsp?message=" + status);
rd.forward(request, response);
} 
protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

doGet(request, response);
}
}
