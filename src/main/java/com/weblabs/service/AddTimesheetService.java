package com.weblabs.service;

public interface AddTimesheetService {

	public String addTimesheet(String id,String project,String Deadline,String totalhours,String RemainingHours,String Date,String Hours,String Description);
	
	
	public String editTimesheet(String id,String project,String Deadline,String totalhours,String RemainingHours,String Date,String Hours,String Description);
	
	public String deleteTimesheet(String id);

}