package fofa.controller.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import fofa.service.FavoriteService;
import fofa.service.FoodtruckService;
import fofa.service.MemberService;

@Controller
public class FavoriteController {
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private FoodtruckService foodtruckService;
	@Autowired
	private MemberService memberService;
	
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
