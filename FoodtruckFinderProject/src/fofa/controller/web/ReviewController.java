package fofa.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import fofa.domain.Recommand;
import fofa.domain.Report;
import fofa.domain.Review;
import fofa.domain.Survey;

@Controller
public class ReviewController {
	public String searchByMemberId(String memberId, Model model){
		return null;
	}
	
	public String searchByFollower(String memberId, Model model){
		return null;
	}
	
	public String searchByFoodtruckId(String foodtruckId, Model model){
		return null;
	}
	
	public String createReviewForm(String foodtruckId, Model model){
		return null;
	}
	
	public String createForm(Review review, Survey survey, Model model){
		return null;
	}
	
	public String modifyReviewForm(String reviewId, Model model){
		return null;
	}
	
	public String modifyReview(Review review){
		return null;
	}
	
	public String removeReview(String reviewId){
		return null;
	}
	public void createReport(Report report){
		
	}
	
	public String selectReviewByReport(Model model){
		return null;
	}
	
	public String removeReivewByReport(String reviewId){
		return null;
	}
	
	public String removeReport(String reportId){
		return null;
	}
	
	public String searchReport(String reportId){
		return null;
	}
	
	public String createRecommand(Recommand recommand){
		return null;
	}
	
	public String removeRecommand(Recommand recommand){
		return null;
	}
	
}