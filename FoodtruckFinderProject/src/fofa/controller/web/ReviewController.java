package fofa.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fofa.domain.Recommand;
import fofa.domain.Report;
import fofa.domain.Review;
import fofa.domain.Survey;

@Controller
public class ReviewController {
	
	@RequestMapping("/review/list/member.do")
	public String searchByMemberId(String memberId, Model model){
		return "../../view/user/memberReviewList.jsp";
	}

	@RequestMapping("/review/list/follow.do")
	public String searchByFollower(String memberId, Model model){
		return "../../view/user/memberNewsfeed.jsp";
	}
	
	@RequestMapping("/review/list/truck.do")
	public String searchByFoodtruckId(String foodtruckId, Model model){
		return "../../view/foodtruck/detailFoodtruck.jsp";
	}
	@RequestMapping(value="/review/create.do", method=RequestMethod.GET)
	public String createReviewForm(String foodtruckId, Model model){
		return "../../view/user/registerReview.jsp";
	}
	
	@RequestMapping(value="/review/create.do", method=RequestMethod.POST)
	public String createReview(Review review, Survey survey, Model model){
		return "redirect:review/list/truck.do";
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
	public void createReport(Report report){
		
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
	public String createRecommand(Recommand recommand){
		return null; // ajax
	}
	
	@RequestMapping("/review/removerecommand.do")
	public String removeRecommand(Recommand recommand){
		return null; // ajax
	}
	
}