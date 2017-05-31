package fofa.controller.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fofa.domain.Foodtruck;
import fofa.domain.Member;
import fofa.domain.Recommand;
import fofa.domain.Report;
import fofa.domain.Review;
import fofa.domain.Survey;
import fofa.service.FoodtruckService;
import fofa.service.MemberService;
import fofa.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private FoodtruckService truckService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/review/list/member.do")
	public String searchByMemberId(String memberId, Model model){
		Member member = memberService.findById(memberId);
		model.addAttribute("member", member);
		List<Review> list = reviewService.findByMemberId(memberId);
		model.addAttribute("list", list);
		return "../../view/user/memberReviewList.jsp";
	}

	@RequestMapping("/review/list/follow.do")
	public String searchByFollower(HttpSession session, Model model){
		String memberId = (String)session.getAttribute("loginUserId");
		List<Review> list = reviewService.findByFromId(memberId);
		System.out.println(list.size());
		for(Review r : list){
			System.out.println(r.getFoodtruck().getFoodtruckName());
		}
		model.addAttribute("list", list);
		return "../../view/user/memberNewsfeed.jsp";
	}
	
	@RequestMapping("/review/list/truck.do")
	public String searchByFoodtruckId(String foodtruckId, Model model){
		Foodtruck truck = truckService.findById(foodtruckId);
		List<Review> reviewList = reviewService.findByTruckId(foodtruckId);
		model.addAttribute("truck", truck);
		model.addAttribute("reviewList", reviewList);
		return "../../view/foodtruck/detailFoodtruck.jsp";
	}
	@RequestMapping(value="/review/create.do", method=RequestMethod.GET)
	public String createReviewForm(String foodtruckId, Model model){
		Foodtruck truck = truckService.findById(foodtruckId);
		model.addAttribute("truck", truck);
		return "/view/user/registerReview.jsp";
	}
	
	@RequestMapping(value="/review/create.do", method=RequestMethod.POST)
	public String createReview(Review review, Survey survey, Model model){
		System.out.println(review.toString());
		return "redirect:review/list/truck.do?foodtruckid="+review.getFoodtruck().getFoodtruckId();
	}
	
	@RequestMapping(value="/review/modify.do", method=RequestMethod.GET)
	public String modifyReviewForm(String reviewId, Model model){
		return "../../view/user/registerReview.jsp";
	}
	
	@RequestMapping(value="/review/modify.do", method=RequestMethod.POST)
	public String modifyReview(Review review){
		return "redirect:list/member.do";
	}
	
	@RequestMapping("/review/remove.do")
	public String removeReview(String reviewId){
		return "redirect:list/truck.do";
	}
	
	@RequestMapping("/review/report/create.do")
	@ResponseBody
	public String createReport(Report report, HttpSession session){
		report.setMemberId((String)session.getAttribute("loginUserId"));
		System.out.println(report.toString());
		boolean reg = reviewService.registerReport(report);
		if(!reg){
			return "false";
		}
		return "true"; // ajax
	}
	
	
	@RequestMapping("/review/report/list.do")
	public String selectReviewByReport(Model model){
		return "../../view/admin/adminReport.jsp"; // ajax
	}
	
	@RequestMapping("/review/reported/remove.do")
	public String removeReivewByReport(String reviewId){
		return "../view/admin/adminReport.jsp";
	}
	
	@RequestMapping("/review/report/remove.do")
	public String removeReport(String reportId){
		return "redirect:report/list.do";
	}
	
	@RequestMapping("/review/recommand.do")
	@ResponseBody
	public String createRecommand(String reviewId, HttpSession session){
		Recommand recommand = new Recommand();
		recommand.setReviewId(reviewId);
		recommand.setWriterId((String)session.getAttribute("loginUserId"));
		boolean reg = reviewService.registerRecommand(recommand);
		if(!reg){
			reviewService.deleteRecommand(recommand);
			return "false";
		}
		return "true"; // ajax
	}
	
	@RequestMapping("/review/removerecommand.do")
	public String removeRecommand(String reviewId, HttpSession session){
		return null; // ajax
	}
	
}
