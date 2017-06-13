package fofa.controller.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fofa.domain.Favorite;
import fofa.domain.Foodtruck;
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
	@ResponseBody
	public boolean create(HttpSession session, String foodtruckId){
		Favorite favorite = new Favorite();
		favorite.setMemberId((String)session.getAttribute("loginUserId"));
		favorite.setFoodtruckId(foodtruckId);
		System.out.println("merge");
		return favoriteService.register(favorite);
	}

	@RequestMapping(value="/remove.do", method=RequestMethod.GET)
	@ResponseBody
	public boolean remove(HttpSession session, String foodtruckId){
		Favorite favorite = new Favorite();
		favorite.setMemberId((String)session.getAttribute("loginUserId"));
		favorite.setFoodtruckId(foodtruckId);
		
		return favoriteService.remove(favorite);
	}
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String search(HttpSession session, String memberId, Model model){
		if(memberId == null ||memberId.equals("")){
			memberId = (String)session.getAttribute("loginUserId");
			if(memberId==null || memberId.equals("")){
				return "redirect:/login.do";
			}
		}
		List<Foodtruck> trucks = new ArrayList<>();
		for(Favorite f :  favoriteService.findMemberId(memberId))  {
			Foodtruck truck = new Foodtruck();
			truck = foodtruckService.findById(f.getFoodtruckId());
			trucks.add(truck);
		}
		model.addAttribute("trucks", trucks);
		model.addAttribute("member", memberService.findById(memberId));
		
		return "../view/member/memberFavoriteList.jsp";
	}
	
	@RequestMapping(value="/count.do", method=RequestMethod.GET)
	@ResponseBody
	public int searchCount(String foodtruckId){
		return favoriteService.foodtruckCount(foodtruckId);
	}	
	@RequestMapping(value="/exist.do", method=RequestMethod.GET)
	@ResponseBody
	public boolean exist(String foodtruckId, HttpSession session){
		Favorite favorite = new Favorite();
		favorite.setFoodtruckId(foodtruckId);
		favorite.setMemberId((String)session.getAttribute("loginUserId"));
		
	System.out.println(favorite.getMemberId()+":"+favorite.getFoodtruckId());
		return favoriteService.alreadyFavorite(favorite);
	}	
}
