package fofa.controller.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fofa.service.FavoriteService;
import fofa.service.FoodtruckService;
import fofa.service.MemberService;

@RequestMapping("favorite")
@Controller
public class FavoriteController {
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private FoodtruckService foodtruckService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/create.do", method=RequestMethod.GET)
	public boolean create(HttpSession session, String foodtruckId){
		
		return false;
	}

	@RequestMapping(value="/remove.do", method=RequestMethod.GET)
	public boolean remove(HttpSession session, String foodtruckId){
		
		return false;
	}
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String search(HttpSession session, Model model){
		
		return "view/user/memberFavoriteList.jsp";
	}
	
}
