package com.weblabs.service;

public interface AssigneeServices {

	public String addAssignee(String Employee_Id,String task_id,String start_date,String end_date,String progress);
	public String editAssignee(String assignee_id,String Employee_Id,String task_id,String start_date,String end_date,String progress);
	public String deleteAssignee(String assignee_id);
	
}
