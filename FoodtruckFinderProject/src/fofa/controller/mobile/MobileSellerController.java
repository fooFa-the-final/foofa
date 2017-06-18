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
import com.google.gson.GsonBuilder;

import fofa.domain.Advertise;
import fofa.domain.Foodtruck;
import fofa.domain.Menu;
import fofa.domain.Menus;
import fofa.domain.Review;
import fofa.domain.Reviews;
import fofa.domain.Sale;
import fofa.domain.Sales;
import fofa.domain.Seller;
import fofa.service.AdvertiseService;
import fofa.service.FoodtruckService;
import fofa.service.ReviewService;
import fofa.service.SalesService;
import fofa.service.SellerService;

@Controller
public class MobileSellerController {

	@Autowired
	private SellerService sellerService;
	@Autowired
	private FoodtruckService truckService;
	@Autowired
	private SalesService salesService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private AdvertiseService advertiseService;

	@RequestMapping(value = "/mobile/sellerlogin.do")
	public @ResponseBody String sellerLogin(String id, String password) {

		Seller seller = new Seller();
		seller.setSellerId(id);
		seller.setPassword(password);

		boolean result;

		result = sellerService.checkPw(id, password);

		System.out.println(result + "s");

		if (result == false) {
			return "false";
		} else {
			return "true";
		}

	}

	@RequestMapping(value = "/mobile/trucklist.do", produces = "application/xml")
	public @ResponseBody Foodtruck getMusicToXMl(String id, HttpServletRequest req) {
		Foodtruck truck = new Foodtruck();
		truck = truckService.findById(id);
		return truck;
	}

	@RequestMapping(value = "/mobile/detail.do", produces = "application/xml")
	public @ResponseBody Foodtruck detailTruck(String id) {
		Foodtruck foodtruck = truckService.findBySeller(id);
		return foodtruck;
	}

	@RequestMapping(value = "/mobile/menu/detail.do", produces = "application/xml")
	public @ResponseBody Menus detailTruckMenu(String id) {
		List<Menu> menus = new ArrayList<>();

		Foodtruck foodtruck = truckService.findBySeller(id);
		menus = foodtruck.getMenus();
		Menus truckmenu = new Menus();
		truckmenu.setMenus(menus);

		return truckmenu;
	}

	@RequestMapping(value = "/mobile/truck/modify.do", produces = "application/xml")
	public @ResponseBody void modifyTruck(Foodtruck foodtruck) {
		truckService.modify(foodtruck);
	}

	@RequestMapping(value = "/mobile/review/list/turck.do", produces = "application/xml")
	public @ResponseBody Reviews truckReviews(String id) {
		Foodtruck foodtruck = truckService.findBySeller(id);
		List<Review> list = new ArrayList<>();
		Reviews truckReviews = new Reviews();
		list = reviewService.findByTruckId(foodtruck.getFoodtruckId());
		truckReviews.setReviews(list);
		return truckReviews;
	}

	@RequestMapping(value = "/mobile/foodtruck/open.do", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String openFoodtruck(@RequestBody String data) {
		Gson gson = new GsonBuilder().create();
		String result = "";
		try {
			JSONParser jsonParser = new JSONParser();

			Foodtruck foodtruck = gson.fromJson(((JSONObject) jsonParser.parse(data)).toJSONString(), Foodtruck.class);
			foodtruck.setState(true);
			String[] img = foodtruck.getFoodtruckImg().split("/");
			foodtruck.setFoodtruckImg(img[img.length - 1]);
			truckService.modify(foodtruck);
			System.out.println(foodtruck.toString());

			result = "ok";
		} catch (Exception e) {
			result = "fail";
		}

		return result;
	}

	@RequestMapping(value = "/mobile/advertiseRegister.do", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody String memberLogin(@RequestBody Advertise advertise) {

		advertiseService.register(advertise);

		if (!advertiseService.register(advertise)) {
			return "true";
		} else {
			return "false";
		}
	}

	@RequestMapping(value = "/mobile/foodtruck/modify.do", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String modifyFoodtruck(@RequestBody String data) {
		Gson gson = new GsonBuilder().create();
		String result = "";
		try {
			JSONParser jsonParser = new JSONParser();

			Foodtruck foodtruck = gson.fromJson(((JSONObject) jsonParser.parse(data)).toJSONString(), Foodtruck.class);
			String[] img = foodtruck.getFoodtruckImg().split("/");
			foodtruck.setFoodtruckImg(img[img.length - 1]);
			truckService.modify(foodtruck);

			result = "ok";
		} catch (Exception e) {
			result = "fail";
		}
		return result;
	}

	///////////////////// foodtruck_Close

	@RequestMapping(value = "/mobile/closeTruck.do")
	public @ResponseBody void closeTrcuk(String id, String revenue, String today) {

		System.out.println("동작됨");
		Foodtruck foodtruck = truckService.findBySeller(id);
		foodtruck.setState(false);

		System.out.println("this is foodtruck: " + foodtruck.toString() + "today is : " + today + "revenue : " +revenue);

		truckService.modify(foodtruck);// 영업종료로 DB수정
///////////////////////////////////////////////////////////////////////////
		Sale sale = new Sale();///////////////매출을 여기 넣어서 보내야함

		sale.setFoodtruckId(foodtruck.getFoodtruckId());
		sale.setLocation(foodtruck.getLocation());
		sale.setRevenue(Integer.parseInt(revenue));
		sale.setDate(today);

		salesService.register(sale);// 영업날 매출 입력

	}

}
