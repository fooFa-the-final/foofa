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

	@RequestMapping(value = "foodtruck/reqest.do", method = RequestMethod.GET)
	public String requestForm(HttpSession session, Model model) {
		Foodtruck foody = foodtruckService.findBySeller((String) session.getAttribute("loginUserId"));
		model.addAttribute("truck", foody);
		return "../view/foodtruck/foodtruckAdvertise.jsp";
	}

	@RequestMapping(value = "foodtruck/reqest.do", method = RequestMethod.POST)
	public String request(HttpSession session, Advertise advertise) {

		String sellerId = ((String) session.getAttribute("loginUserId"));
		System.out.println(1);
		System.out.println(advertise.toString());

		advertiseService.register(advertise);
		System.out.println(advertise.toString());
		return "redirect:searchById.do";
	
	}

	@RequestMapping("advertise/approve.do")
	public String approve(String advId) {
		String[] Adv = advId.split(",");
		List<Advertise> list = advertiseService.findByAsc(0);
		List<Advertise> list1 = new ArrayList<>();
		for (int i = 0; i < Adv.length; i++) {
			if (list.get(i).getAdvId().equals(Adv[i])) {
				System.out.println(Adv[i]);
				list.get(i).setAdvId(Adv[i]);
				list.get(i).setApprove(1);
				list1.add(list.get(i));
			}
		}
		for (int a = 0; a < list1.size(); a++) {
			list1.get(a).setApprove(1);
			advertiseService.modify(list.get(a));
		}
		return "redirect:/advertise/list/asc.do";
	}

	@RequestMapping("advertise/remove.do")
	public String remove(String advId) {
		String[] Adv = advId.split(",");
		for (int i = 0; i < Adv.length; i++) {
			System.out.println(Adv[i]);
			advertiseService.remove(Adv[i]);
		}
		return "redirect:/advertise/list/asc.do";
	}

	@RequestMapping("/advertise/list/asc.do")
	public String searchByAsc(Model model) {
		List<Advertise> list1 = advertiseService.findByAsc(0);
		List<Advertise> list = advertiseService.findByAsc(1);
		String truckname;
		for (int k = 0; k < list.size(); k++) {
			Foodtruck food = foodtruckService.findBySeller(list.get(k).getSellerId());
			System.out.println(list.get(k).getSellerId());
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

	@RequestMapping("/advertise/list/list.do")
	public String searchList(Model model) {
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

}
