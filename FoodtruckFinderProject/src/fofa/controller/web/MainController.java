package fofa.controller.web;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import fofa.domain.Member;
import fofa.domain.Seller;
import fofa.service.AdvertiseService;
import fofa.service.FoodtruckService;
import fofa.service.MemberService;
import fofa.service.ReviewService;
import fofa.service.SellerService;

public class MainController {
	
	private MemberService memberService;
	private SellerService sellerService;
	private FoodtruckService foodtruckService;
	private ReviewService reviewService;
	private AdvertiseService advertiseService;
	
	public String showMain(Model model){
		return null;
	}
	
	public String showMainLogin(HttpSession session, Model model){
		return null;
	}

	public String showLoginForm(){
		return null;
	}
	
	public String logout(HttpSession session){
		return null;
	}
	
	public String loginMember(HttpSession session, Member member){
		return null;
	}
	
	public String loginSeller(HttpSession session, Seller seller){
		return null;
	}
}
