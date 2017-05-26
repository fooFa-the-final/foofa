package fofa.controller.web;

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

@RequestMapping("foodtruck")
@Controller
public class FoodtruckController {
	@Autowired
	private FoodtruckService foodtruckService;
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private AdvertiseService advertiseService;
	
	
	@RequestMapping(value="/create.do", method=RequestMethod.GET)
	public String create(Foodtruck foodtruck){
		return "login.jsp";
	}
	
	@RequestMapping(value="/modifyForm.do", method=RequestMethod.GET)
	public String modifyForm(String foodtruckId, Model model){
		
		return "view/foodtruck/modifyFoodtruck.jsp";
	}
	
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public String modify(Foodtruck foodtruck){
		
		return "view/foodtruck/foodtruckInfo.jsp";
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
		
		return "view/foodtruck/foodtruckInfo.jsp";
	}
	
	@RequestMapping("/searchByLoc.do")
	public String searchByLoc(String location, Model model){
		
		return "view/foodtruck/listFoodtruck.jsp";
	}
	
	@RequestMapping("/searchByKeyLoc.do")
	public String searchByKeyLoc(String keyword, String location, Model model){
		
		return "view/foodtruck/listFoodtruck.jsp";
	}
	
	@RequestMapping("/searchByFilter.do")
	public String searchByFilter(HttpServletRequest request, Model model){
		
		return "view/foodtruck/listFoodtruck.jsp";
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

