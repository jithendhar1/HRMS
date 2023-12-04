
package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.AssigneeServiceImpl;

@WebServlet("/AssigneeSearchSrv")
public class AssigneeSearchSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;
	//private static final String addteam = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	String status = "Add  Failed!";
        String Employee_Id = request.getParameter("Employee_Id"); 
        String task_id = request.getParameter("task_id");
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        String progress = request.getParameter("progress");
     
       
        AssigneeServiceImpl leave = new  AssigneeServiceImpl();
       status =leave.addAssignee(Employee_Id, task_id, start_date, end_date, progress);
        

	   RequestDispatcher rd = request.getRequestDispatcher("add_leave.jsp?message=" + status);
      rd.forward(request, response);
   } 
protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

doGet(request, response);
}
}

