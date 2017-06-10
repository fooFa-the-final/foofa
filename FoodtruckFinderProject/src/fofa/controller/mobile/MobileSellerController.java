package fofa.controller.mobile;

import java.util.ArrayList; 
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import fofa.domain.Foodtruck;
import fofa.domain.Seller;
import fofa.service.FoodtruckService;
import fofa.service.SellerService;

@Controller
public class MobileSellerController {

	@Autowired
	private SellerService sellerService;
	@Autowired
	private FoodtruckService truckService;
	
	@RequestMapping(value="/mobilelogin.do")
	public @ResponseBody String sellerLogin(String id, String password) {
		
		Seller seller = new Seller();
		seller.setSellerId(id);
		seller.setPassword(password);
		

		boolean result;
		
		result = sellerService.checkPw(id, password);
		
		if(result == false) {
			return "false";
		} else {
			return "redirect:trucklist";
		}
		
	}	
	@RequestMapping(value="/trucklist.do")
	public @ResponseBody Foodtruck getMusicToXMl(String id, HttpServletRequest req){
			Foodtruck truck = new Foodtruck();
			truck = truckService.findById(id);
			return truck;
	}
	
	@RequestMapping(value = "/mobile/detail.do", produces="application/xml")
	public @ResponseBody Foodtruck detailTruck(String id){
		Foodtruck foodtruck = truckService.findBySeller(id);
		return foodtruck;
	}
	
}			
	
	
