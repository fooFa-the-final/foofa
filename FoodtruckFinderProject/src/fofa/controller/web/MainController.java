package fofa.controller.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String showLoginForm(){
		return "view/user/login.jsp";
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/index.do";
	}
	

	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(HttpServletRequest request, Member member){
		String[] isSeller = request.getParameterValues("isSeller");
		String id = member.getMemberId();
		String pw = member.getPassword();
		HttpSession session = request.getSession();
		
		if(id.equals("admin") && pw.equals("admin")){
			session.setAttribute("loginUserId", id);	
			
			return "redirect:/review/report/list.do";
		}else if(isSeller != null){
			if(sellerService.checkPw(id, pw)){
				session.setAttribute("loginUserId", id);
				session.setAttribute("isSeller", true);
				session.setAttribute("truckId",	foodtruckService.findBySeller(id).getFoodtruckId());
				return "redirect:/truck/id.do";
			}
		}else{
			if(memberService.checkPw(id, pw)){
				request.getSession().setAttribute("loginUserId", id);
				return "redirect:/main.do";
			}
		}
		
		return "redirect:/login.do";
	}

}
