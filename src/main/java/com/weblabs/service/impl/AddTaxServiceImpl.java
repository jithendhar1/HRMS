package com.weblabs.service.impl;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddTaxService;
import com.weblabs.utility.DBUtil;

public class AddTaxServiceImpl implements AddTaxService {
			
		@Override
		public String addtax(String Id, String TaxName, String TaxPercentage, String Status) {
			String status = "tax Adding Failed!";

	        Connection con = DBUtil.provideConnection();
	        PreparedStatement ps = null;

	        try {
	        	ps = con.prepareStatement("INSERT INTO tax (Id,TaxName,TaxPercentage,Status) VALUES (?,?,?,?)");
	            ps.setString(1, Id);
	            ps.setString(2, TaxName);
	            ps.setString(3, TaxPercentage);
	            ps.setString(4, Status);
	
	            int k = ps.executeUpdate();

	            if (k > 0) {
	                status = "tax Added Successfully!";
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
		public String deletetax(String Id) {
			String status = "tax Removal Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("DELETE FROM tax WHERE Id = ?");
		        ps.setString(1, Id);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "tax Removed Successfully!";
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
		public String edittax(String Id, String TaxName, String TaxPercentage, String Status) {
			String status = "tax Failed!";

		    Connection con = DBUtil.provideConnection();
		    PreparedStatement ps = null;

		    try {
		        ps = con.prepareStatement("UPDATE tax SET TaxName =?, TaxPercentage =?,Status =? WHERE Id=?");  
		   
		        ps.setString(1, TaxName);
		        ps.setString(2, TaxPercentage);
		        ps.setString(3, Status);
		        ps.setString(4, Id);

		        int k = ps.executeUpdate();

		        if (k > 0) {
		            status = "tax Updated Successfully!";
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

		
			
