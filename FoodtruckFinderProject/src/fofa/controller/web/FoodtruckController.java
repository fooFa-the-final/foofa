package fofa.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import fofa.domain.Foodtruck;
import fofa.domain.Menu;
import fofa.service.AdvertiseService;
import fofa.service.FavoriteService;
import fofa.service.FoodtruckService;

@Controller
public class FoodtruckController {
	@Autowired
	private FoodtruckService foodtruckService;
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private AdvertiseService advertiseService;
	
	public String create(Foodtruck foodtruck){
		
		return null;
	}
	
	public String modifyForm(String foodtruckId, Model model){
		
		return null;
	}
	
	public String modify(Foodtruck foodtruck){
		
		return null;
	}
	
	public String modifyPicture(String foodtruckId, String file_name){
		
		return null;
	}
	
	public boolean modifyState(String foodtruckId, boolean operation_state){
		
		return false;
	}
	
	public String searchById(String foodtruckId, Model model){
		
		return null;
	}
	
	public String searchByLoc(String location, Model model){
		
		return null;
	}
	
	public String searchByKeyLoc(String keyword, String location, Model model){
		
		return null;
	}
	
	public String searchByFilter(HttpServletRequest request, Model model){
		
		return null;
	}
	
	public List<Menu> createMenu(Menu menu){
		
		return null;
	}
	
	public List<Menu> modifyMenu(Menu menu){
		
		return null;
	}
	
	public List<Menu> removeMenu(String menuId, String foodtruckId){
		
		return null;
	}
	
	
}

