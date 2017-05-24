package fofa.controller.web;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import fofa.service.FavoriteService;
import fofa.service.FoodtruckService;
import fofa.service.MemberService;
import fofa.service.logic.FavoriteServiceLogic;
import fofa.service.logic.FoodtruckServiceLogic;

public class FavoriteController {
	private FavoriteService favoriteService;
	private FoodtruckService foodtruckService;
	private MemberService memberService;
	
	public FavoriteController() {
		favoriteService = new FavoriteServiceLogic();
		foodtruckService = new FoodtruckServiceLogic();		
	}
	
	public boolean create(HttpSession session, String foodtruckId){
		
		return false;
	}

	public boolean remove(HttpSession session, String foodtruckId){
		
		return false;
	}
	
	public String search(HttpSession session, Model model){
		
		return null;
	}
	
	public int searchCount(String foodtruckId){
		
		return 0;
	}
	
}
