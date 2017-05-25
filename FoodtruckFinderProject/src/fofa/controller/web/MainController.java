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

	@RequestMapping("/main.do")
	public String showMainLogin(HttpSession session, Model model){
		return "view/main.jsp";
	}

	@RequestMapping("/login.do")
	public String showLoginForm(){
		return "view/user/login.jsp";
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/index.do";
	}

	@RequestMapping("/login/member.do")
	public String loginMember(HttpSession session, Member member){
		return "redirect:/main.do";
	}

	@RequestMapping("/login/seller.do")
	public String loginSeller(HttpSession session, Seller seller){
		return "redirect:/truck/id.do";
	}
}
