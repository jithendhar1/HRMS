package com.weblabs.service;

public interface CompanySettingServices {

	
	public String addCS(String CompanyName,String ContactPerson,String Address,String Country,String City,String State,String PostalCode,String Email,String PhoneNumber,String MobileNumber,String Fax,String WebsiteUrl);
	public String editCS(String CompanyID, String CompanyName,String ContactPerson,String Address,String Country,String City,String State,String PostalCode,String Email,String PhoneNumber,String MobileNumber,String Fax,String WebsiteUrl);
	public String deleteCS(String CompanyID);
}
