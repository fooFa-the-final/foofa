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
	public String searchByAsc(int approve, Model model) {
		List<Advertise> list1 = advertiseService.findByAsc(approve);
		
		
//폐기될지도 모르는 코드 if varchr2 => date		
//		String yyyy;
//		String mm;
//		String dd;
//		String start;
//		String end;
//		String from1 = null;
//		String truckname;
//		for (int k = 0; k < list.size(); k++) {
//			SimpleDateFormat transFormat1 = new SimpleDateFormat("yyyyMMdd");
//			try {
//				Foodtruck food = foodtruckService.findBySeller(list.get(k).getSellerId());
//				truckname = food.getFoodtruckName();
//				list.get(k).setSellerId(truckname);
//				from1 = list.get(k).getStartdate();
//				Date to1 = transFormat1.parse(from1);
//				Calendar cal = Calendar.getInstance();
//				cal.setTime(to1);
//				cal.add(Calendar.DATE, list.get(k).getPeriod());
//				Date to2 = cal.getTime();
//				String to = transFormat1.format(cal.getTime());
//				yyyy = to.substring(0, 4);
//				mm = to.substring(4, 6);
//				dd = to.substring(6, 8);
//				list.get(k).setEnddate(yyyy + "-" + mm + "-" + dd);
//			} catch (ParseException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//		}
//		for (int i = 0; i < list.size(); i++) {
//			start = list.get(i).getStartdate();
//			yyyy = start.substring(0, 4);
//			mm = start.substring(4, 6);
//			dd = start.substring(6, 8);
//			list.get(i).setStartdate(yyyy + "-" + mm + "-" + dd);
//		}
//		model.addAttribute("advertise", list);
//		//광고리스트(승인) 완료
//		
//		List<Advertise> list1 = advertiseService.findByAsc(false);
//		for (int k = 0; k < list1.size(); k++) {
//			SimpleDateFormat transFormat1 = new SimpleDateFormat("yyyyMMdd");
//			try {
//				Foodtruck food = foodtruckService.findBySeller(list1.get(k).getSellerId());
//				truckname = food.getFoodtruckName();
//				list1.get(k).setSellerId(truckname);
//				from1 = list1.get(k).getStartdate();
//				Date to1 = transFormat1.parse(from1);
//				Calendar cal = Calendar.getInstance();
//				cal.setTime(to1);
//				cal.add(Calendar.DATE, list1.get(k).getPeriod());
//				Date to2 = cal.getTime();
//				String to = transFormat1.format(cal.getTime());
//				yyyy = to.substring(0, 4);
//				mm = to.substring(4, 6);
//				dd = to.substring(6, 8);
//				list1.get(k).setEnddate(yyyy + "-" + mm + "-" + dd);
//			} catch (ParseException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//		}
//		for (int i = 0; i < list1.size(); i++) {
//			start = list1.get(i).getStartdate();
//			yyyy = start.substring(0, 4);
//			mm = start.substring(4, 6);
//			dd = start.substring(6, 8);
//			list1.get(i).setStartdate(yyyy + "-" + mm + "-" + dd);
//		}		
		
		model.addAttribute("advertise1", list1);
		return "/view/admin/adminAdvertise.jsp";
	}

	@RequestMapping("advertise/list/desc.do")
	public String searchByDesc(int approve, Model model) {
//		approve = true;
		List<Advertise> list = advertiseService.findByDesc(approve);
		return "../../view/admin/adminAdvertise.jsp";
	}
	
}
