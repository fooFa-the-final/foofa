package fofa.controller.web;

import java.util.ArrayList;
import java.util.List;

import org.hamcrest.FeatureMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fofa.domain.Survey;
import fofa.domain.SurveyItem;
import fofa.domain.SurveyReply;
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
	public String create(Survey survey, Model model) {
		surveyService.register(survey);

		return "redirect:/foodtruck/id.do?foodtruckId=" + survey.getFoodtruckId();
	}

	@RequestMapping("/truckStat.do")
	public String searchSurveysStat(String foodtruckId, Model model) {

		model.addAttribute("commentList", surveyService.findByTruckId(foodtruckId));
		model.addAttribute("avgItemList", surveyService.findAvgScoreBySurveyItem(foodtruckId));
		model.addAttribute("truck", foodtruckService.findById(foodtruckId));
		return "/view/foodtruck/foodtruckSurvey.jsp";
	}

	@RequestMapping(value = "/itemStat.do", method = RequestMethod.GET)
	public String searchItemStat(String foodtruckId, String itemId, Model model) {
		// System.out.println(foodtruckId + ItemId);

		List<Survey> list = surveyService.findAvgByGender(foodtruckId, itemId);

		List<Survey> feList = new ArrayList<>();
		List<Survey> maList = new ArrayList<>();

		for (int i = 0; i < 5; i++) {
			Survey survey = new Survey();
			Survey survey1 = new Survey();
			survey.setScore(i + 1);
			survey1.setScore(i + 1);
			feList.add(i, survey);
			maList.add(i, survey1);
		}

		System.out.println("list : " + list.toString());
		for(Survey survey : list){
			for (int i=0;i<5;i++) {
				if (survey.getGender() == 'M' && survey.getScore() == i+1) {
					maList.remove(i);
					maList.add(i,survey);
				} else if (survey.getGender() == 'F' &&  survey.getScore() == i+1) {
					feList.remove(i);
					feList.add(i,survey);
				}
			}
		}
		

		System.out.println("ma : " + maList.toString());

		model.addAttribute("maList", maList);
		model.addAttribute("feList", feList);

		model.addAttribute("ageStat", surveyService.findAvgByAges(foodtruckId, itemId));
		return "/view/foodtruck/foodtruckSurveyDetail.jsp";
	}

	@RequestMapping("/item/create.do")
	@ResponseBody
	public List<SurveyItem> createItem(String question) {
		surveyItemService.register(question);
		System.out.println("꺼져");
		return surveyItemService.findAll();
	}

	@RequestMapping("/item/modify.do")
	@ResponseBody
	public List<SurveyItem> modifyItem(SurveyItem item) {
		surveyItemService.modify(item);
		return surveyItemService.findAll();
	}

	@RequestMapping("/item/remove.do")
	@ResponseBody
	public List<SurveyItem> removeItem(String surveyItemId) {
		surveyItemService.remove(surveyItemId);
		return surveyItemService.findAll();
	}

	@RequestMapping("/item/list.do")
	public String searchAllItems(Model model) {
		model.addAttribute("items", surveyItemService.findAll());
		return "/view/admin/adminSurvey.jsp";
	}
}
