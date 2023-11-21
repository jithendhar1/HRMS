package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.weblabs.beans.CompanySettingsBean;
import com.weblabs.utility.DBUtil;
public class csDAO {
    
    public static List<CompanySettingsBean> getAllCS() {
        List<CompanySettingsBean> allCS = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT  CompanyID, CompanyName, ContactPerson, Address, Country, City, State, PostalCode,"
            		+ " Email, PhoneNumber, MobileNumber, Fax, WebsiteUrl FROM company_settings";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	CompanySettingsBean ss = new CompanySettingsBean();
                ss.setCompanyID(resultSet.getString("CompanyID"));
                ss.setCompanyName(resultSet.getString("CompanyName"));
                ss.setContactPerson(resultSet.getString("ContactPerson"));
                ss.setAddress(resultSet.getString("Address"));
                ss.setCountry(resultSet.getString("Country"));
                ss.setCity(resultSet.getString("City"));
                ss.setState(resultSet.getString("State"));
                ss.setPostalCode(resultSet.getString("PostalCode"));
                ss.setEmail(resultSet.getString("Email"));
                ss.setPhoneNumber(resultSet.getString("PhoneNumber"));
                ss.setMobileNumber(resultSet.getString("MobileNumber"));
                ss.setFax(resultSet.getString("Fax"));
                ss.setWebsiteUrl(resultSet.getString("WebsiteUrl"));
                allCS.add(ss);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
            // Close database resources (connection, statement, result set)
        	 finally {
        		 try {
        			 connection.close();
        		 } catch (SQLException ex) {
        		 ex.printStackTrace();
        		 }
        	 }
     

        return allCS;
    }
    
  
}




