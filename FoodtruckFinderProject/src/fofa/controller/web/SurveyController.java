package fofa.controller.web;


import java.util.List;

import org.springframework.ui.Model;

import fofa.domain.Survey;
import fofa.domain.SurveyItem;

public class SurveyController {

	public String create(Survey survey, Model model){
		
	return null;
	}
	
	public String searchSurveysStat(String foodtruckId, Model model){
		return null;
	}
	
	public String searchItemStat(String foodtruckId, String ItemId, Model model){
		return null;
	}
	
	public List<SurveyItem> createItem(String question){
		return null;
	}
	
	public List<SurveyItem> modifyItem(String question){
		return null;
	}	
	public List<SurveyItem> removeItem(String question){
		return null;
	}
}
