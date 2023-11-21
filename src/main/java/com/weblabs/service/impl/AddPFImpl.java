package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddPFService;
import com.weblabs.utility.DBUtil;


public class AddPFImpl implements AddPFService{
@Override
	public String addpf( String Id, String EmployeeName, String ProvidentFundType, String EmployeeShareAmount, String OrganizationShareAmount, String EmployeeSharePer, String OrganizationSharePer,String Description) {	
		String status = "pf Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("INSERT INTO pf (Id,EmployeeName,ProvidentFundType,EmployeeShareAmount,OrganizationShareAmount,EmployeeSharePer,OrganizationSharePer,Description) VALUES (?,?,?,?,?,?,?,?)");
            ps.setString(1, Id);
            ps.setString(2, EmployeeName);
            ps.setString(3, ProvidentFundType);
            ps.setString(4, EmployeeShareAmount);
            ps.setString(5, OrganizationShareAmount);
            ps.setString(6, EmployeeSharePer);
            ps.setString(7, OrganizationSharePer);
            ps.setString(8, Description);
            
           
            int k = ps.executeUpdate();

            if (k > 0) {
                status = "pf Added Successfully!";
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
public String deletepf(String Id) {
	String status = "pf Removal Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("DELETE FROM pf WHERE Id = ?");
        ps.setString(1, Id);
        

        int k = ps.executeUpdate();

        if (k > 0) {
            status = "pf Removed Successfully!";
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
public String editpf(String Id, String EmployeeName, String ProvidentFundType, String EmployeeShareAmount,
		String OrganizationShareAmount, String EmployeeSharePer, String OrganizationSharePer, String Description) {
	String status = "pf Updation Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("UPDATE pf SET EmployeeName =?, ProvidentFundType =?, EmployeeShareAmount =?, OrganizationShareAmount =?,EmployeeSharePer =?,OrganizationSharePer =?, Description =? WHERE Id=?");  
        ps.setString(1, EmployeeName);
        ps.setString(2, ProvidentFundType);
        ps.setString(3, EmployeeShareAmount);
        ps.setString(4, OrganizationShareAmount);
        ps.setString(5, EmployeeSharePer);
        ps.setString(6, OrganizationSharePer);
        ps.setString(7, Description);
        ps.setString(8, Id);
       
        int k = ps.executeUpdate();

        if (k > 0) {
            status = "pf Updated Successfully!";
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        DBUtil.closeConnection(con);
        DBUtil.closeConnection(ps);
    }

    return status;
}
}

