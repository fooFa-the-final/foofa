package fofa.controller.mobile;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;

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
	
	

	@RequestMapping(value = "/mobile/detailFoodtruckId.do", produces = "application/xml")
	public @ResponseBody Foodtruck detailFoodtruck(String id) {
		Foodtruck foodtruck = truckService.findById(id);
		return foodtruck;
	}
	
	@RequestMapping(value = "/mobile/menu/detailFoodtruckId.do", produces = "application/xml")
	public @ResponseBody Menus detailTruckMenuTruckID(String id) {
		List<Menu> menus = new ArrayList<>();

		Foodtruck foodtruck = truckService.findById(id);
		menus = foodtruck.getMenus();
		Menus truckmenu = new Menus();
		truckmenu.setMenus(menus);
		return truckmenu;
	}
	

	@RequestMapping(value="/mobile/foodtruck/open.do", method=RequestMethod.POST, produces="application/json")
	public @ResponseBody String openFoodtruck(@RequestBody String data){
		Gson gson = new GsonBuilder().create();
		String result = "";
		try {
			JSONParser jsonParser = new JSONParser();
				
			Foodtruck foodtruck = gson.fromJson(((JSONObject) jsonParser.parse(data)).toJSONString(), Foodtruck.class);
			foodtruck.setState(true);
			String[] img = foodtruck.getFoodtruckImg().split("/");
			foodtruck.setFoodtruckImg(img[img.length-1]);
			truckService.modify(foodtruck);
			System.out.println(foodtruck.toString());
				
			result = "ok";
		}
		catch (Exception e) {
			result = "fail";
		}
		
		return result;
	}
	
	@RequestMapping(value="/mobile/foodtruck/search.do", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	public @ResponseBody String getFoodtrucksToJSON(@RequestBody String data){
		Gson gson = new GsonBuilder().create();
		JSONParser jsonParser = new JSONParser();
		List<Foodtruck> foodtrucks = new ArrayList<>();
		
		try {
			Foodtruck foodtruck = gson.fromJson(((JSONObject)jsonParser.parse(data)).toJSONString(), Foodtruck.class);
			List<HashMap<String, Object>> sqlMap = truckService.findByFilter(foodtruck.getFavoriteCount(), foodtruck, foodtruck.getFoodtruckId());
			System.out.println("TEST : " + foodtruck.toString());
			//	List<HashMap<String, Object>> sqlMap = foodtruckService.findByFilter(currentIndex, foodtruck, sort);
			if(!sqlMap.isEmpty()){
				foodtrucks = sqlMapping(sqlMap);
			}
		} catch (JsonSyntaxException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String jsonList = gson.toJson(foodtrucks);
		System.out.println("TEST : " + foodtrucks.size() + " / " + foodtrucks.get(0).toString());
		return jsonList;
	}
	
	private List<Foodtruck> sqlMapping(List<HashMap<String, Object>> sqlMap){
		
		List<Foodtruck> trucks = new ArrayList<>();
		
		for(int i = 0; i < sqlMap.size(); i++){
			Foodtruck t = new Foodtruck();
			t.setFoodtruckId((String)sqlMap.get(i).get("foodtruckId"));
			t.setFoodtruckName((String)sqlMap.get(i).get("foodtruckName"));
			t.setFoodtruckImg((String)sqlMap.get(i).get("foodtruckImg"));
			t.setCategory1((String)sqlMap.get(i).get("category1"));
			t.setSpot((String)sqlMap.get(i).get("spot"));
			t.setLocation((String)sqlMap.get(i).get("location"));
			t.setFavoriteCount((int)sqlMap.get(i).get("favoriteCount"));
			t.setFavoriteCount((int)sqlMap.get(i).get("favoriteCount"));
			t.setReviewCount((int)sqlMap.get(i).get("reviewCount"));
			if(sqlMap.get(i).get("score")!=null){
				t.setScore((double)sqlMap.get(i).get("score"));
			}else {
				t.setScore(0);
			}
			trucks.add(t);
		}		
		return trucks;
		
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
	public @ResponseBody String closeTrcuk(String id, String revenue, String today) {
		String result="";

		try{
			Foodtruck foodtruck = truckService.findBySeller(id);
			foodtruck.setState(false);
			//System.out.println("this is foodtruck: " + foodtruck.toString() + "today is : " + today);
			truckService.modify(foodtruck);// 영업종료로 DB수정
	
			Sale sale = new Sale();
			sale.setFoodtruckId(foodtruck.getFoodtruckId());
			sale.setLocation(foodtruck.getLocation());
			sale.setRevenue(Integer.parseInt(revenue));
			sale.setDate(today);
			salesService.register(sale);
			
			result = "ok";
		} catch (Exception e){
			result = "fail";
		}
		return result;
	}

}
