package fofa.controller.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String requestForm(HttpSession session, Model model) {
		// 세션가능시
		// Foodtruck foody =
		// foodtruckService.findBySeller((String)session.getAttribute("loginUserId"));

		Foodtruck foody = foodtruckService.findBySeller("nacho");
		model.addAttribute("truck", foody);
		return "../view/foodtruck/foodtruckAdvertise.jsp";
	}

	@RequestMapping(value = "advertise/reqest.do", method = RequestMethod.POST)
	public String request(HttpSession session, Advertise advertise) {

		// 세션수행 불가시 코드
		advertise.setSellerId("nacho");
		// advertise.setSellerId((String) session.getAttribute(""));
		advertiseService.register(advertise);
		return "../view/foodtruck/foodtruckInfo.jsp";
	}

	@RequestMapping("advertise/approve.do")
	public String approve(Advertise advertise) {
		advertiseService.modify(advertise);
		return "../view/admin/adminAdvertise.jsp";
	}

	@RequestMapping("advertise/remove.do")
	public String remove(String advId) {
		// List<String> mlist = Arrays.asasList();

		String[] Adv = advId.split(",");
		for (int i = 0; i < Adv.length; i++) {
			System.out.println(Adv[i]);
			advertiseService.remove(Adv[i]);
		}

		System.out.println(Adv);
		return "asc.do";
	}

	@RequestMapping("/advertise/list/asc.do")
	public String searchByAsc(Model model) {
		List<Advertise> list1 = advertiseService.findByAsc(0);
		List<Advertise> list = advertiseService.findByAsc(1);
		String truckname;
		for (int k = 0; k < list.size(); k++) {
			Foodtruck food = foodtruckService.findBySeller(list.get(k).getSellerId());
			truckname = food.getFoodtruckName();
			list.get(k).setSellerId(truckname);
		}
		for (int a = 0; a < list1.size(); a++) {
			Foodtruck food = foodtruckService.findBySeller(list1.get(a).getSellerId());
			truckname = food.getFoodtruckName();
			list1.get(a).setSellerId(truckname);
		}
		model.addAttribute("advertise1", list1);
		model.addAttribute("advertise", list);
		return "/view/admin/adminAdvertise.jsp";
	}

	@RequestMapping("advertise/list/desc.do")
	public String searchByDesc(Model model) {

		return "../../view/admin/adminAdvertise.jsp";
	}

}
