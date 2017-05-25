package fofa.controller.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import fofa.domain.Member;
import fofa.domain.Seller;
import fofa.service.AdvertiseService;
import fofa.service.FoodtruckService;
import fofa.service.MemberService;
import fofa.service.ReviewService;
import fofa.service.SellerService;

@Controller
public class MainController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private SellerService sellerService;
	@Autowired
	private FoodtruckService foodtruckService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private AdvertiseService advertiseService;
	

	@RequestMapping("/index.do")
	public String showMain(Model model){
		return "view/index.jsp";
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
