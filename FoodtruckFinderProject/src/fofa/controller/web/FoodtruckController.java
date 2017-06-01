package fofa.controller.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fofa.domain.Foodtruck;
import fofa.domain.Menu;
import fofa.service.AdvertiseService;
import fofa.service.FavoriteService;
import fofa.service.FoodtruckService;

@RequestMapping("/foodtruck")
@Controller
public class FoodtruckController {
	@Autowired
	private FoodtruckService foodtruckService;
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private AdvertiseService advertiseService;
	
	
	@RequestMapping(value="/create.do", method=RequestMethod.POST)
	public String create(Foodtruck foodtruck, HttpServletRequest request){
		foodtruck.setOperationTime((String)request.getParameter("startTime")+ "/" +(String)request.getParameter("endTime"));	
		foodtruck.setCategory1(foodtruck.getCategory1() + "/" + foodtruck.getCategory2() + "/" + foodtruck.getCategory3());
		foodtruck.setSpot(foodtruck.getLocation());
		
		foodtruck.setFoodtruckImg("user.jsp");
		
		List<Menu> menus = new ArrayList<>();
		
		String[] menuNames = request.getParameterValues("menuName");
		String[] menuPrices = request.getParameterValues("menuPrice");
		String[] menuStates = request.getParameterValues("menuState");
		
		for(int i = 0; i< menuNames.length; i++){
			Menu menu = new Menu();
			menu.setMenuName(menuNames[i]);
			menu.setPrice(Integer.parseInt(menuPrices[i]));
			menu.setMenuState(Boolean.parseBoolean(menuStates[i]));
			menus.add(menu);
		}
		foodtruck.setMenus(menus);
		
		foodtruckService.register(foodtruck);
		return "redirect: ../view/user/login.jsp";
	}
	
	@RequestMapping(value="/modifyForm.do", method=RequestMethod.GET)
	public String modifyForm(String foodtruckId, Model model){
		Foodtruck foodtruck = foodtruckService.findById(foodtruckId);
		String[] category = foodtruck.getCategory1().split("/");
		foodtruck.setCategory1(category[0]);
		if(category.length == 2){
			foodtruck.setCategory2(category[1]);
		}
		if(category.length == 3){
			foodtruck.setCategory2(category[1]);
			foodtruck.setCategory3(category[2]);
		}
		model.addAttribute("truck", foodtruck);
		
		String[] operationTime = foodtruck.getOperationTime().split("/");
		String startTime = operationTime[0];
		String endTime = operationTime[1];
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		
		return "../view/foodtruck/modifyFoodtruck.jsp";
	}
	
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public String modify(Foodtruck foodtruck, HttpServletRequest request){
		foodtruck.setOperationTime((String)request.getParameter("startTime") + "/" + (String)request.getParameter("endTime"));
		List<Menu> menus = new ArrayList<>();
		
		String[] menuId = request.getParameterValues("menuId");
		String[] menuNames = request.getParameterValues("menuName");
		String[] menuPrices = request.getParameterValues("menuPrice");
		String[] menuStates = request.getParameterValues("menuState");
		
		for(int i = 0; i< menuNames.length; i++){
			Menu menu = new Menu();
			menu.setMenuId(menuId[i]);
			menu.setMenuName(menuNames[i]);
			menu.setPrice(Integer.parseInt(menuPrices[i]));
			menu.setMenuState(Boolean.parseBoolean(menuStates[i]));
			menus.add(menu);
		}
		foodtruck.setMenus(menus);
		foodtruckService.modify(foodtruck);
		return "redirect:/foodtruck/searchById.do?foodtruckId="+foodtruck.getFoodtruckId();
	}
	
	@RequestMapping(value="/modifyPicture.do", method=RequestMethod.GET)
	public String modifyPicture(String foodtruckId, String file_name){
		
		return null;
	}
	
	@RequestMapping(value="/modifyState.do", method=RequestMethod.GET)
	public boolean modifyState(String foodtruckId, boolean operation_state){
		
		return false;
	}
	
	@RequestMapping("/searchById.do")
	public String searchById(String foodtruckId, Model model){
		Foodtruck foodtruck = foodtruckService.findById(foodtruckId);
//		Foodtruck foodtruck = foodtruckService.findById("F40");
		String[] category = foodtruck.getCategory1().split("/");
		foodtruck.setCategory1(category[0]);
			if(category.length >= 2){
				foodtruck.setCategory2(category[1]);
			}
			if(category.length >= 3){
				foodtruck.setCategory2(category[1]);
				foodtruck.setCategory3(category[2]);
			}
		String[] operationTime = foodtruck.getOperationTime().split("/");
		String startTime = operationTime[0];
		String endTime = operationTime[1];
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		model.addAttribute("truck", foodtruck);
		return "../view/foodtruck/foodtruckInfo.jsp";
	}
	
	@RequestMapping("/searchByLoc.do")
	public String searchByLoc(String location, Model model){
		List<Foodtruck> foodtrucks = foodtruckService.findByLoc(location);
		model.addAttribute("trucks", foodtrucks);
		return "../view/foodtruck/listFoodtruck.jsp";
	}
	
	@RequestMapping("/searchByKeyLoc.do")
	public String searchByKeyLoc(String keyword, String location, Model model){
		
		return "../view/foodtruck/listFoodtruck.jsp";
	}
	
	@RequestMapping("/searchByFilter.do")
	public String searchByFilter(HttpServletRequest request, Model model){
		
		return "../view/foodtruck/listFoodtruck.jsp";
	}
	
	@RequestMapping("/createMenu.do")
	public List<Menu> createMenu(Menu menu){
		
		return null;
	}
	
	@RequestMapping("/modifyMenu.do")
	public List<Menu> modifyMenu(Menu menu){
		
		return null;
	}
	
	@RequestMapping("/removeMenu.do")
	public List<Menu> removeMenu(String menuId, String foodtruckId){
		
		return null;
	}
	
	
}

