package fofa.controller.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
	public String searchByMemberId(String memberId, HttpSession session, Model model){
		Member member = memberService.findById(memberId);
		model.addAttribute("member", member);
		model.addAttribute("nowId", (String)session.getAttribute("loginUserId"));
		List<Review> list = reviewService.findByMemberId(memberId);
		model.addAttribute("list", list);
		return "../../view/user/memberReviewList.jsp";
	}

	@RequestMapping("/review/list/follow.do")
	public String searchByFollower(HttpSession session, Model model){
		String memberId = (String)session.getAttribute("loginUserId");
		List<Review> list = reviewService.findByFromId(memberId);
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
		String[] operationTime = truck.getOperationTime().split("/");
		String startTime = operationTime[0];
		String endTime = operationTime[1];
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		model.addAttribute("truck", truck);
		model.addAttribute("reviewList", reviewList);
		System.out.println(truck.getFoodtruckId());
		return "../../view/foodtruck/detailFoodtruck.jsp";
	}
	@RequestMapping(value="/review/create.do", method=RequestMethod.GET)
	public String createReviewForm(String foodtruckId, Model model){
		Foodtruck truck = truckService.findById(foodtruckId);
		model.addAttribute("review", "null");
		model.addAttribute("truck", truck);
		return "/view/user/registerReview.jsp";
	}
	
	@RequestMapping(value="/review/create.do", method=RequestMethod.POST)
	public String createReview(Review review, Survey survey, HttpServletRequest req, Model model){
		Foodtruck truck = truckService.findById((String)req.getParameter("foodtruckId"));
		review.setFoodtruck(truck);
		HttpSession session = req.getSession();
		Member member = memberService.findById((String)session.getAttribute("loginUserId"));
		review.setWriter(member);
		boolean insert = reviewService.register(review);
		System.out.println(insert);
		return "redirect:/review/list/truck.do?foodtruckId="+review.getFoodtruck().getFoodtruckId();
	}
	
	@RequestMapping(value="/review/modify.do", method=RequestMethod.GET)
	public String modifyReviewForm(String reviewId, Model model){
		Review review = reviewService.findById(reviewId);
		System.out.println(review.toString());
		model.addAttribute("review", review);
		return "/view/user/registerReview.jsp";
	}
	
	@RequestMapping(value="/review/modify.do", method=RequestMethod.POST)
	public String modifyReview(Review review){
		return "redirect:list/member.do";
	}
	
	@RequestMapping("/review/remove.do")
	@ResponseBody
	public String removeReview(String reviewId){
		reviewService.remove(reviewId);
		return "true";
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
		List<Review> list = reviewService.findAllByReported();
		System.out.println(list.size());
		model.addAttribute("list", list);
		return "../../view/admin/adminReport.jsp"; // ajax
	}
	
	@RequestMapping("/report/list.do")
	@ResponseBody
	public List<Report> selectReportByReviewId(String reviewId, HttpServletResponse resp){
		List<Report> list = reviewService.findReport(reviewId);
		
		System.out.println("신고 테이블 개수 : " + list.size());
		/*JSONArray js = new JSONArray();
		JSONObject jso = new JSONObject();
		jso.put("data", list);
		resp.setContentType("text/html;charset=utf-8");
		
		try {
			PrintWriter out = resp.getWriter();
			out.print(jso.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		return list;
	}
	
	
	@RequestMapping("/review/reported/remove.do")
	@ResponseBody
	public String removeReivewByReport(String reviewId){
		boolean rem = reviewService.removeReport(reviewId);
		if(rem)
			reviewService.remove(reviewId);
			
		return "true";
	}
	
	@RequestMapping("/review/report/remove.do")
	@ResponseBody
	public String removeReport(String reviewId){
		boolean rem = reviewService.removeReport(reviewId);
		if(rem)
			return "true";
		
		return "false";
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
