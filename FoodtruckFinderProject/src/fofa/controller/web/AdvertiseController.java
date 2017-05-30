package fofa.controller.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import fofa.domain.Advertise;
import fofa.domain.Foodtruck;
import fofa.service.AdvertiseService;
import fofa.service.FoodtruckService;

@Controller
public class AdvertiseController {

	@Autowired
	private AdvertiseService advertiseService;

	@Autowired
	private FoodtruckService foodtruckService;
	
	@RequestMapping(value = "advertise/reqest.do", method = RequestMethod.GET)
	public String requestForm() {
		return "../view/foodtruck/foodtruckAdvertise.jsp";
	}

	@RequestMapping(value = "advertise/reqest.do", method = RequestMethod.POST)
	public String request(HttpSession session, Advertise advertise) {
		advertise.setSellerId("nacho");
		advertiseService.register(advertise);
		System.out.println(advertise.getPeriod());
		return "../view/foodtruck/foodtruckInfo.jsp";
	}

	@RequestMapping("approve.ajax")
	@ResponseBody
//	public String approve(@RequestParam(value="advId", required=false) String advId) {
	public String approve(Advertise advertise) {
		advertiseService.modify(advertise);
		return "../view/admin/adminAdvertise.jsp";
	}

	@RequestMapping("advertise/remove.do")
	public String remove() {

		return "../view/admin/adminAdvertise.jsp";
	}

	@RequestMapping("/advertise/list/asc.do")
	public String searchByAsc(Model model) {
		List<Advertise> list1 = advertiseService.findByAsc(0);
		List<Advertise> list = advertiseService.findByAsc(1);
		
		String truckname;
		for(int k = 0 ; k<list.size(); k++) {
			Foodtruck food = foodtruckService.findBySeller(list.get(k).getSellerId());
			truckname = food.getFoodtruckName();
			list.get(k).setSellerId(truckname);
		}
		
//		for(int a = 0 ; a<list.size(); a++) {
//			Foodtruck food = foodtruckService.findBySeller(list1.get(a).getSellerId());
//			truckname = food.getFoodtruckName();
//			list1.get(a).setSellerId(truckname);
//		}
		model.addAttribute("advertise1", list1);
		model.addAttribute("advertise", list);
		return "/view/admin/adminAdvertise.jsp";		
	}

	@RequestMapping("advertise/list/desc.do")
	public String searchByDesc(Model model) {
		return "../../view/admin/adminAdvertise.jsp";
	}
	
}
