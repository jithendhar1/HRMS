package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddempsalaryService;
import com.weblabs.utility.DBUtil;

public class Addempsalaryserviceimpl implements AddempsalaryService{

@Override     
public String addempsalary(String employee_id, String Basic,String DA,String HRA,String CONVEYANCE, String ALLOWANCE, String MEDICAL, String TDS, String ESI, String PF,String LEAVE,String PROF_TAX,String LABOUR_WELFARE,String OTHERS)

{	
		String status = "Employee Adding Failed!";

        Connection conn = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = conn.prepareStatement("INSERT INTO salary (employee_id, Basic, DA, HRA, CONVEYANCE, ALLOWANCE, MEDICAL, TDS, ESI, PF, `LEAVE`, PROF_TAX, LABOUR_WELFARE, OTHERS) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, employee_id);
            ps.setString(2, Basic);
            ps.setString(3, DA);
            ps.setString(4, HRA);
            ps.setString(5, CONVEYANCE);
            ps.setString(6, ALLOWANCE);
            ps.setString(7, MEDICAL);
            ps.setString(8, TDS);
            ps.setString(9, ESI);
            ps.setString(10, PF);
            ps.setString(11, LEAVE);
            ps.setString(12, PROF_TAX);
            ps.setString(13, LABOUR_WELFARE);
            ps.setString(14, OTHERS);
            
            int k = ps.executeUpdate();

            if (k > 0) {
                status = "Emp Salary Added Successfully!";
            }
        } catch (SQLException e) {
            status = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(conn);
            DBUtil.closeConnection(ps);
        }

        return status;
}

@Override
public String deleteEmpSalary(String empid) {
	// TODO Auto-generated method stub
	String status = "Emp salary Removal Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("DELETE FROM salary WHERE empid = ?");
        ps.setString(1, empid);

        int k = ps.executeUpdate();

        if (k > 0) {
            status = "Emp salary Removed Successfully!";
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
public String editempsalary(String employee_id, String Basic, String DA, String HRA, String CONVEYANCE,
		String ALLOWANCE, String MEDICAL, String TDS, String ESI, String PF, String LEAVE, String PROF_TAX,
		String LABOUR_WELFARE, String OTHERS) {
	// TODO Auto-generated method stub
	String status = "Emp salary Updation Failed!";

    Connection con = DBUtil.provideConnection();
    PreparedStatement ps = null;

    try {
        ps = con.prepareStatement("UPDATE salary SET Basic =?,DA =?,HRA =?,CONVEYANCE =?,ALLOWANCE =?,MEDICAL =?,TDS =?,ESI =?,PF =?,`LEAVE` =?,PROF_TAX =?,LABOUR_WELFARE =?,OTHERS =? WHERE  employee_id =?");  
        
        ps.setString(1, Basic);
        ps.setString(2, DA);
        ps.setString(3,  HRA);
        ps.setString(4, CONVEYANCE);
        ps.setString(5, ALLOWANCE);
        ps.setString(6, MEDICAL);
        ps.setString(7, TDS);
        ps.setString(8, ESI);
        ps.setString(9, PF);
        ps.setString(10, LEAVE);
        ps.setString(11, PROF_TAX);
        ps.setString(12, LABOUR_WELFARE);
        ps.setString(13, OTHERS);
        ps.setString(14, employee_id);

        int k = ps.executeUpdate();

        if (k > 0) {
            status = "salary Updated Successfully!";
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

