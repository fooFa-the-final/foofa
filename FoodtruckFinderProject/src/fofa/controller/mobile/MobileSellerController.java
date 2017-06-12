package fofa.controller.mobile;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import fofa.domain.Foodtruck;
import fofa.domain.Review;
import fofa.domain.Reviews;
import fofa.domain.Seller;
import fofa.service.FoodtruckService;
import fofa.service.ReviewService;
import fofa.service.SellerService;

@Controller
public class MobileSellerController {

	@Autowired
	private SellerService sellerService;
	@Autowired
	private FoodtruckService truckService;
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/mobile/sellerlogin.do")
	public @ResponseBody String sellerLogin(String id, String password) {
		
		Seller seller = new Seller();
		seller.setSellerId(id);
		seller.setPassword(password);
		

		boolean result;
		
		result = sellerService.checkPw(id, password);
		
		System.out.println(result+"s");
		
		if(result == false) {
			return "false";
		} else {
			return "true";
		}
		
	}	
	@RequestMapping(value="/mobile/trucklist.do", produces="application/xml")
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
	
	@RequestMapping(value ="/mobile/truck/modify.do", produces="application/xml")
	public @ResponseBody void modifyTruck(Foodtruck foodtruck){
		truckService.modify(foodtruck);
	}
	
	@RequestMapping(value = "/mobile/review/list/turck.do", produces="application/xml")
	public @ResponseBody Reviews truckReviews(String id){
		Foodtruck foodtruck = truckService.findBySeller(id);
		List<Review> list = new ArrayList<>();
		Reviews truckReviews = new Reviews();
		list = reviewService.findByTruckId(foodtruck.getFoodtruckId());
		truckReviews.setReviews(list);
		return truckReviews;
	}
	
	@RequestMapping(value="/mobile/foodtruck/modify.do", method=RequestMethod.POST, produces="application/json")
	public @ResponseBody String modifyFoodtruck(@RequestBody String data){
		String result = "";
		try {
			
			/*JSONParser jsonParser = new JSONParser();
				
			JSONObject jsonObject = (JSONObject) jsonParser.parse(data);*/
										
			result = "ok";
			
			Foodtruck foodtruck = new Gson().fromJson(data, Foodtruck.class);
			foodtruck.toString();
			System.out.println(data);
				
			//Do something..
		}
		catch (Exception e) {
			result = "fail";
		}
	
		return result;
	}
}			

