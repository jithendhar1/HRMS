package com.weblabs.service;

public interface AddTrainig_TypeService {

	public String addTraining_Type( String type, String DescriptionName,String status);
	public String deleteTraining_Type(String id);
	public String editTraining_Type(String id,String type, String DescriptionName,String status);
}
