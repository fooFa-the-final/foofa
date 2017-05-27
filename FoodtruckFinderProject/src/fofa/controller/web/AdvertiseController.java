package fofa.controller.web;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fofa.domain.Advertise;
import fofa.service.AdvertiseService;

@Controller
public class AdvertiseController {

	@Autowired
	private AdvertiseService advertiseService;
		
	
	@RequestMapping(value = "advertise/reqest.do", method = RequestMethod.GET) 
	public String requestForm(){
	
		return "../view/foodtruck/foodtruckAdvertise.jsp";
	}

	
	@RequestMapping(value = "advertise/reqest.do", method = RequestMethod.POST) 
	public String request(){
	
		return "../view/foodtruck/foodtruckAdvertise.jsp";
	}
	

	@RequestMapping("advertise/approve.do")
	public String approve(){
	
		return "../view/admin/adminAdvertise.jsp";
	}	
	
	@RequestMapping("advertise/remove.do")
	public String remove(){
	
		return "../view/admin/adminAdvertise.jsp";
	}
	
	
	@RequestMapping("/advertise/list/asc.do")
	public String searchByAsc(boolean approve, Model model){
		approve = true;
		List<Advertise> list = advertiseService.findByAsc(approve);
		
		
		
		String from1 = null;
		for(int k = 0 ; k < list.size() ; k++) {
			SimpleDateFormat transFormat1 = new SimpleDateFormat("yyyyMMdd");
			try {
				from1 = list.get(k).getStartdate();
				Date to1 = transFormat1.parse(from1);
				list.get(k).setSt(to1);
				Calendar cal = Calendar.getInstance();
				cal.setTime(to1);
				cal.add(Calendar.DATE, Integer.parseInt(list.get(k).getPeriod()));
				Date to2 = cal.getTime();
				list.get(k).setEnd(to2);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	

		model.addAttribute("advertise", list);
		
		return "/view/admin/adminAdvertise.jsp";
	}

	@RequestMapping("advertise/list/desc.do")
	public String searchByDesc(boolean approve, Model model){
		approve = true;
		List<Advertise> list = advertiseService.findByDesc(approve);
		return "../../view/admin/adminAdvertise.jsp";
	}
	
	
}
