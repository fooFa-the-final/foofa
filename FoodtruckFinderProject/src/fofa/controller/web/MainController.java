package fofa.controller.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import fofa.domain.Advertise;
import fofa.domain.Foodtruck;
import fofa.domain.Member;
import fofa.domain.Review;
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
	

	@RequestMapping("index.do")
	public String showMain(Model model){
		List<Review> allReview = reviewService.findByRecommand();
		List<Review> reviews = new ArrayList<>();
		reviews.add(allReview.get(1));
		reviews.add(allReview.get(2));
		reviews.add(allReview.get(3));
		model.addAttribute("reviews", reviews);
		model.addAttribute("hotReview", allReview.get(0));

		Review mainReview;
		while(true){
			double mainRandom = Math.random();
			int intMain = (int)(mainRandom*allReview.size());
			mainReview = reviewService.findById(allReview.get(intMain).getReviewId());		
			
			if(mainReview.getImages().size()>=1){
				break;
			}
		}

		model.addAttribute("mainFoodImg",mainReview.getImages().get(0).getFilename());	
		model.addAttribute("mainMember", memberService.findById(mainReview.getWriter().getMemberId()));

		List<Advertise> allAdv = advertiseService.findNowAd();
		List<Foodtruck> adTrucks = new ArrayList<>();

		for(int i=0; i<9; i++){
			String sellerId = allAdv.get(i).getSellerId();
			adTrucks.add(foodtruckService.findBySeller(sellerId));
		}
		model.addAttribute("adTrucks", adTrucks);
		
		List<HashMap<String, Object>> allTrucks = foodtruckService.findByLoc(1, "가산동");
		List<Foodtruck> nearTrucks = new ArrayList<>();
		for(int i=0; i<9; i++){
			Foodtruck t = new Foodtruck();
			t.setFoodtruckId((String)allTrucks.get(i).get("foodtruckId"));
			t.setFoodtruckName((String)allTrucks.get(i).get("foodtruckName"));
			t.setFoodtruckImg((String)allTrucks.get(i).get("foodtruckImg"));
			t.setCategory1((String)allTrucks.get(i).get("category1"));
			t.setSpot((String)allTrucks.get(i).get("spot"));
			t.setLocation((String)allTrucks.get(i).get("location"));
			if(allTrucks.get(i).get("score")!=null){
			t.setFavoriteCount((int)allTrucks.get(i).get("favoriteCount"));
			}
			if(allTrucks.get(i).get("score")!=null){
			t.setFavoriteCount((int)allTrucks.get(i).get("favoriteCount"));
			}
			t.setReviewCount((int)allTrucks.get(i).get("reviewCount"));
			if(allTrucks.get(i).get("score")!=null){
				t.setScore((double)allTrucks.get(i).get("score"));
			}
			nearTrucks.add(t);
		}
		
        HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null)
            ip = req.getRemoteAddr();
         
        System.out.println("접속 ip"+ip);
		model.addAttribute("nearTrucks", nearTrucks);
		return "view/index.jsp";
	}

	@RequestMapping("main.do")
	public String showMainLogin(HttpSession session, Model model){
		String memberId = (String)session.getAttribute("loginUserId");
		List<Review> followReviews = reviewService.findByFromId(memberId);

		List<Review> reviews = new ArrayList<>();
		if(followReviews.size()!=0){
			for(int i = 0; i < 20; i++){
			reviews.add(followReviews.get(i));
				}
			}
		
		model.addAttribute("reviews", reviews);

		List<Review> allReview = reviewService.findByRecommand();
		Review mainReview = new Review();
		while(true){
			double mainRandom = Math.random();
			int intMain = (int)(mainRandom*allReview.size());
			Review randomReview = reviewService.findById(allReview.get(intMain).getReviewId());
			if((!randomReview.getImages().isEmpty()) && randomReview.getImages().get(0)!=null){
				mainReview = randomReview;
				break;
			}
		}
		
		model.addAttribute("mainFoodImg", mainReview.getImages().get(0).getFilename());
		model.addAttribute("mainMember", memberService.findById(mainReview.getWriter().getMemberId()));
		
		return "view/main.jsp";
	}

	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String showLoginForm(){
		return "view/user/login.jsp";
	}
	

	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:index.do";
	}
	
	@RequestMapping(value="/googleLogin.do", method=RequestMethod.POST)
	public String googleLogin(HttpSession session, Member member){
		if(memberService.checkPw(member.getMemberId(), member.getPassword())){
			memberService.register(member);
		}
		session.setAttribute("loginUserId", member.getMemberId());
		session.setAttribute("isGoogle", true);
		
		return "redirect:main.do";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login(HttpServletRequest request, Member member){
		String[] isSeller = request.getParameterValues("isSeller");
		String id = member.getMemberId();
		String pw = member.getPassword();
		HttpSession session = request.getSession();
		
		if(id.equals("admin") && pw.equals("admin")){
			session.setAttribute("loginUserId", id);	
			
			return "redirect:review/report/list.do";
		}else if(isSeller!=null && isSeller[0] != null){
			if(sellerService.checkPw(id, pw)){
				session.setAttribute("loginUserId", id);
				session.setAttribute("isSeller", true);
				session.setAttribute("loginTruckId",	foodtruckService.findBySeller(id).getFoodtruckId());
				return "redirect:foodtruck/searchById.do";
			}
		}else{
			if(memberService.checkPw(id, pw)){
				request.getSession().setAttribute("loginUserId", id);
				return "redirect:main.do";
			}
		}
		
		return "redirect:login.do";
	}

}