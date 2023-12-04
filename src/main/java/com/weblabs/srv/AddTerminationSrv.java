package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.AddTerminationServiceImpl;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/AddTerminationSrv")
public class AddTerminationSrv extends HttpServlet {

    // ... (other code)
	private static final long serialVersionUID = 1L;
	//private static final String addteam = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = "Add termination Failed!";
        String id = request.getParameter("id");
        String terminatedemp = request.getParameter("terminatedemp");
        String terminationtype = request.getParameter("terminationtype");
        String termationdate = request.getParameter("termationdate");
        String reason = request.getParameter("reason");
        String noticedate = request.getParameter("noticedate");
        String formattedDate = convertDateFormat(termationdate, "dd/MM/yyyy", "yyyy-MM-dd");
        String fffDate = convertDateFormat(noticedate, "dd/MM/yyyy", "yyyy-MM-dd");
        AddTerminationServiceImpl t = new AddTerminationServiceImpl();
        status = t.addtermination(id, terminatedemp, terminationtype, formattedDate, reason, fffDate);

        RequestDispatcher rd = request.getRequestDispatcher("add_termination.jsp?message=" + status);
        rd.forward(request, response);
    }

    // Helper method to convert date format
    private String convertDateFormat(String inputDate, String inputFormat, String outputFormat) {
        try {
            SimpleDateFormat inputFormatter = new SimpleDateFormat(inputFormat);
            SimpleDateFormat outputFormatter = new SimpleDateFormat(outputFormat);

            Date date = inputFormatter.parse(inputDate);
            return outputFormatter.format(date);
        } catch (ParseException e) {
            // Handle the exception as needed
            e.printStackTrace();
            return null;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {

    	doGet(request, response);
    	}
    	}
