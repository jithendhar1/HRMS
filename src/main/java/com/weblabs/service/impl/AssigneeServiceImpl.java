

package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AssigneeServices;
import com.weblabs.utility.DBUtil;

public class AssigneeServiceImpl implements AssigneeServices {

	

	@Override
	public String addAssignee(String Employee_Id,String task_id,String start_date,String end_date,String progress) {
		String Status1 = " Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("INSERT INTO assignee ( Employee_Id, task_id, start_date, end_date, progress) VALUES (?,?,?,?,?)");
            ps.setString(1, Employee_Id);
            ps.setString(2, task_id);
            ps.setString(3, start_date);
            ps.setString(4, end_date);
            ps.setString(5, progress);
         
           
            int k = ps.executeUpdate();

            if (k > 0) {
                Status1 = "Training Added Successfully!";
            }
        } catch (SQLException e) {
            Status1 = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(con);
            DBUtil.closeConnection(ps);
        }

        return Status1;
	}

	@Override
	public	String editAssignee(String assignee_id,String Employee_Id,String task_id,String start_date,String end_date,String progress) {
		
		String Status3 = "Updating  Failed!";

		
        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("UPDATE assignee SET Employee_Id=?,task_id=?, start_date=?,end_date=?,progress=? WHERE assignee_id = ?");
        	 ps.setString(1, Employee_Id);  
        	 ps.setString(2, task_id);
             ps.setString(3, start_date);
             ps.setString(4, end_date);
             ps.setString(5, progress);
             ps.setString(6, assignee_id);
            
           
           
            int k = ps.executeUpdate();

            if (k > 0) {
            	Status3 = "Updating Successfully!";
            }
        } catch (SQLException e) {
        	Status3 = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(con);
            DBUtil.closeConnection(ps);
        }

        return Status3;
	}

	@Override
	public String deleteAssignee(String assignee_id) {
		String Status2 = " delete Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("DELETE FROM assignee  WHERE assignee_id = ?");
            ps.setString(1, assignee_id);
           
            int k = ps.executeUpdate();

            if (k > 0) {
            	Status2 = " deleted Successfully!";
            }
        } catch (SQLException e) {
        	Status2 = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(con);
            DBUtil.closeConnection(ps);
        }

        return Status2;
	}

}
