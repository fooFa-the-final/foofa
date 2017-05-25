package fofa.controller.web;


import java.util.List;

import org.springframework.ui.Model;

import fofa.domain.Survey;
import fofa.domain.SurveyItem;
import fofa.service.FoodtruckService;
import fofa.service.SurveyItemService;
import fofa.service.SurveyService;

public class SurveyController {
	
	private FoodtruckService foodtruckService;
	private SurveyService surveyService;
	private SurveyItemService surveyItemService;

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
	
	public String searchAllterms(Model model){
		return null;
	}
}
