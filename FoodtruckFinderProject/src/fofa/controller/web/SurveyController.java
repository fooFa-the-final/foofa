package fofa.controller.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping("/truckStat.do")
	public String searchSurveysStat(String foodtruckId, Model model){
		model.addAttribute("avgItemList", surveyService.findAvgScoreBySurveyItem(foodtruckId));
		return "/view/foodtruck/foodtruckSurvey.jsp";
	}

	@RequestMapping("/itemStat.do")
	public String searchItemStat(String foodtruckId, String ItemId, Model model){
		return "/view/foodtruck/foodtruckSurveyDetail.jsp";
	}

	@RequestMapping("/item/create.do")
	@ResponseBody
	public List<SurveyItem> createItem(String question){
		surveyItemService.register(question);
		System.out.println("꺼져");
		return surveyItemService.findAll();
	}

	@RequestMapping("/item/modify.do")
	@ResponseBody
	public List<SurveyItem> modifyItem(SurveyItem item){
		surveyItemService.modify(item);
		return surveyItemService.findAll();
	}	

	@RequestMapping("/item/remove.do")
	@ResponseBody
	public List<SurveyItem> removeItem(String surveyItemId){
		surveyItemService.remove(surveyItemId);
		return surveyItemService.findAll();
	}
	
	@RequestMapping("/item/list.do")
	public String searchAllItems(Model model){
		model.addAttribute("items",	surveyItemService.findAll());
		return "/view/admin/adminSurvey.jsp";
	}
}
