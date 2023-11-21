package com.weblabs.service.impl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddTimesheetService;
import com.weblabs.utility.DBUtil;
public class AddTimeSheetImpl implements AddTimesheetService {

	@Override
		public String addTimesheet(String id,String project,String Deadline,String totalhours,String RemainingHours,String Date,String Hours,String Description)
	{	
			String status = "timesheet Adding Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;

	        try {
	        	ps = con.prepareStatement("INSERT INTO timesheet (id,Project,Deadline,totalhours,RemainingHours,Date,Hours,DescriptionName) VALUES (?,?,?,?,?,?,?,?)");
	            ps.setString(1, id);
	            ps.setString(2, project);
	            ps.setString(3, Deadline);
	            ps.setString(4, totalhours);
	            ps.setString(5, RemainingHours);
	            ps.setString(6, Date);
	            ps.setString(7, Hours);
	            ps.setString(8, Description);
	           
	
	            int k = ps.executeUpdate();

	            if (k > 0) {
	                status = "timesheet Added Successfully!";
	            }
	        } catch (SQLException e) {
	            status = "Error: " + e.getMessage();
	            e.printStackTrace();
	        } finally {
	            DBUtil.closeConnection(con);
	            DBUtil.closeConnection(ps);
	        }

	        return status;
	}

	@Override
	public String editTimesheet(String id, String project, String Deadline, String totalhours, String RemainingHours,
			String Date, String Hours, String Description) {
		String status = "timesheet Failed!";

	    Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;

	    try {
	        ps = con.prepareStatement("UPDATE timesheet SET Project =?,Deadline =?,totalhours =?,RemainingHours =?,Date =?,Hours =?,DescriptionName =? WHERE id=?");  
	        
	       
	        ps.setString(1, project);
	        ps.setString(2, Deadline);
	        ps.setString(3, totalhours);
	        ps.setString(4, RemainingHours);
	        ps.setString(5, Date);
	        ps.setString(6, Hours);
	        ps.setString(7, Description);
	        ps.setString(8, id);
	       

	        int k = ps.executeUpdate();

	        if (k > 0) {
	            status = "timesheet Updated Successfully!";
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBUtil.closeConnection(con);
	        DBUtil.closeConnection(ps);
	    }

	    return status;
	}


	

	@Override
	public String deleteTimesheet(String id) {
		  String status = "timesheet Removal Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("DELETE FROM timesheet WHERE id = ?");
		        ps.setString(1, id);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "timesheet Removed Successfully!";
		        }
		    } catch (SQLException e) {
		        status = "Error: " + e.getMessage();
		        e.printStackTrace();
		    } finally {
		        DBUtil.closeConnection(con);
		        DBUtil.closeConnection(ps);
		    }

		    return status;
		}

		
	}

