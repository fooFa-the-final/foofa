package fofa.controller.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
	public String searchSurveysStat(HttpSession session, Model model) {

		String foodtruckId = (String)session.getAttribute("loginTruckId");
		
		model.addAttribute("commentList", surveyService.findByTruckId(foodtruckId));
		model.addAttribute("avgItemList", surveyService.findAvgScoreBySurveyItem(foodtruckId));
		model.addAttribute("truck", foodtruckService.findById(foodtruckId));
		return "/view/foodtruck/foodtruckSurvey.jsp";
	}

	@RequestMapping(value = "/itemStat.do", method = RequestMethod.GET)
	public String searchItemStat(HttpSession session, String itemId, Model model) {
		String foodtruckId = (String)session.getAttribute("loginTruckId");
		model.addAttribute("truck", foodtruckService.findById(foodtruckId));

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

		for (Survey survey : list) {
			for (int i = 0; i < 5; i++) {
				if (survey.getGender() == 'M' && survey.getScore() == i + 1) {
					maList.remove(i);
					maList.add(i, survey);
				} else if (survey.getGender() == 'F' && survey.getScore() == i + 1) {
					feList.remove(i);
					feList.add(i, survey);
				}
			}
		}


		model.addAttribute("maList", maList);
		model.addAttribute("feList", feList);

		List<Survey> list2 = surveyService.findAvgByAges(foodtruckId, itemId);

		List<Survey> list10 = new ArrayList<>();
		List<Survey> list20 = new ArrayList<>();
		List<Survey> list30 = new ArrayList<>();
		List<Survey> list40 = new ArrayList<>();
		List<Survey> list50 = new ArrayList<>();

		for (int i = 0; i < 5; i++) {
			Survey survey = new Survey();
			Survey survey1 = new Survey();
			Survey survey2 = new Survey();
			Survey survey3 = new Survey();
			Survey survey4 = new Survey();

			survey.setScore(i + 1);
			survey1.setScore(i + 1);
			survey2.setScore(i + 1);
			survey3.setScore(i + 1);
			survey4.setScore(i + 1);

			survey.setAges(10);
			survey1.setAges(20);
			survey2.setAges(30);
			survey3.setAges(40);
			survey4.setAges(50);

			list10.add(i, survey);
			list20.add(i, survey1);
			list30.add(i, survey2);
			list40.add(i, survey3);
			list50.add(i, survey4);
		}
		

		for (Survey survey : list2) {
			for (int i = 0; i < 5; i++) {
				if (list10.get(i).getAges() == survey.getAges()) {
					if (list10.get(i).getScore() == survey.getScore()) {
						list10.remove(i);
						list10.add(i, survey);
					}
				} else if (list20.get(i).getAges() == survey.getAges()) {
					if (list20.get(i).getScore() == survey.getScore()) {
						list20.remove(i);
						list20.add(i, survey);
					}
				} else if (list30.get(i).getAges() == survey.getAges()) {
					if (list30.get(i).getScore() == survey.getScore()) {
						list30.remove(i);
						list30.add(i, survey);
					}
				} else if (list40.get(i).getAges() == survey.getAges()) {
					if (list40.get(i).getScore() == survey.getScore()) {
						list40.remove(i);
						list40.add(i, survey);
					}
				} else if (list50.get(i).getAges() == survey.getAges()) {
					if (list50.get(i).getScore() == survey.getScore()) {
						list50.remove(i);
						list50.add(i, survey);
					}
				}
			}
		}

		model.addAttribute("list10",list10);
		model.addAttribute("list20",list20);
		model.addAttribute("list30",list30);
		model.addAttribute("list40",list40);
		model.addAttribute("list50",list50);
		return "/view/foodtruck/foodtruckSurveyDetail.jsp";
	}

	@RequestMapping("/item/create.do")
	@ResponseBody
	public List<SurveyItem> createItem(String question) {
		surveyItemService.register(question);
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
