package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.AddTrainingServiceImp;


@WebServlet("/DeleteTrainingServlet")
public class DeleteTrainingServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


    	String id = request.getParameter("id");

    	AddTrainingServiceImp train = new AddTrainingServiceImp();
		String status = train.deleteTraining(id);
		
        RequestDispatcher rd = request.getRequestDispatcher("delete_training.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
