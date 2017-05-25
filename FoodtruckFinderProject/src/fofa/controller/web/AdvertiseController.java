package fofa.controller.web;

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
	
		return "foodtruck/foodtruckAdvertise.jsp";
	}

	
	@RequestMapping(value = "advertise/reqest.do", method = RequestMethod.POST) 
	public String request(){
	
		return "foodtruck/foodtruckAdvertise.jsp";
	}
	

	@RequestMapping("advertise/approve.do")
	public String approve(){
	
		return "admin/adminAdvertise.jsp";
	}	
	
	@RequestMapping("advertise/remove.do")
	public String remove(){
	
		return "admin/adminAdvertise.jsp";
	}
	
	
	@RequestMapping("advertise/list/asc.do")
	public String searchByAsc(boolean approve, Model model){
		approve = true;
		List<Advertise> list = advertiseService.findByAsc(approve);
		return "admin/adminAdvertise.jsp";
	}

	@RequestMapping("advertise/list/desc.do")
	public String searchByDesc(boolean approve, Model model){
		approve = true;
		List<Advertise> list = advertiseService.findByDesc(approve);
		return "admin/adminAdvertise.jsp";
	}
	
	
}
