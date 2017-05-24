package fofa.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import fofa.domain.Foodtruck;
import fofa.domain.Menu;
import fofa.service.AdvertiseService;
import fofa.service.FavoriteService;
import fofa.service.FoodtruckService;
import fofa.service.logic.AdvertiseServiceLogic;
import fofa.service.logic.FavoriteServiceLogic;
import fofa.service.logic.FoodtruckServiceLogic;

public class FoodtruckController {
	private FoodtruckService foodtruckService;
	private FavoriteService favoriteService;
	private AdvertiseService advertiseService;
	
	public FoodtruckController() {
		foodtruckService = new FoodtruckServiceLogic();
		favoriteService = new FavoriteServiceLogic();
		advertiseService = new AdvertiseServiceLogic();
	}

	public String create(Foodtruck foodtruck){
		
		return null;
	}
	
	public String modifyForm(String foodtruckId){
		
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
	
	public String searchById(String foodtruckId){
		
		return null;
	}
	
	public String searchByLoc(String location){
		
		return null;
	}
	
	public String searchByKeyLoc(String keyword, String location){
		
		return null;
	}
	
	public String searchByFilter(HttpServletRequest request){
		
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











