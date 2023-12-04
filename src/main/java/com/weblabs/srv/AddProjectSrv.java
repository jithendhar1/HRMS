package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.AddProjectServiceImp;

@WebServlet("/AddProjectSrv")
public class AddProjectSrv extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      

        String status = "Add Project Failed!";
        String projectname = request.getParameter("projectname");
        String Clientid = request.getParameter("Clientid");
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        String rate = request.getParameter("rate");
        String hourly = request.getParameter("hourly");
        String priority = request.getParameter("priority");
        String projectleader = request.getParameter("projectleader");
        String addteam = request.getParameter("addteam");
        String description = request.getParameter("description");
        String uploadfile = request.getParameter("uploadfile");

        AddProjectServiceImp employee = new AddProjectServiceImp();
        status = employee.addProject(projectname, Clientid, startdate, enddate, rate, hourly, priority, projectleader,
                addteam, description, uploadfile);

        RequestDispatcher rd = request.getRequestDispatcher("add_project.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

doGet(request, response);
}     
}


