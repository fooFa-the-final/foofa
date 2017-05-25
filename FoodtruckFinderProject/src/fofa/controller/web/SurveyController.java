package fofa.controller.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import fofa.domain.Survey;
import fofa.domain.SurveyItem;
import fofa.service.FoodtruckService;
import fofa.service.SurveyItemService;
import fofa.service.SurveyService;

@Controller
@RequestMapping("/survey")
public class SurveyController {
	
	@Autowired
	private FoodtruckService foodtruckService;
	@Autowired
	private SurveyService surveyService;
	@Autowired
	private SurveyItemService surveyItemService;

	@RequestMapping("/create.do")
	public String create(Survey survey, Model model){
		surveyService.register(survey);
		
	return "redirect:/foodtruck/id.do?foodtruckId="+survey.getFoodtruckId();
	}
	
	public String searchSurveysStat(String foodtruckId, Model model){
		model.addAttribute("avgItemList", surveyService.findAvgScoreBySurveyItem(foodtruckId));
		return "foodtruckSurvey.jsp";
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
