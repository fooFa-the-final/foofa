package fofa.controller.mobile;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import fofa.domain.Favorite;
import fofa.domain.Follow;
import fofa.domain.Foodtruck;
import fofa.domain.Foodtrucks;
import fofa.domain.Member;
import fofa.domain.Members;
import fofa.domain.Review;
import fofa.domain.Reviews;
import fofa.domain.Seller;
import fofa.service.FavoriteService;
import fofa.service.FollowService;
import fofa.service.FoodtruckService;
import fofa.service.MemberService;
import fofa.service.ReviewService;
import fofa.service.SellerService;

@Controller
public class MobileMemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private FollowService followService;
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private FoodtruckService truckService;
	
	@RequestMapping(value="/mobile/memberlogin.do")
	public @ResponseBody String memberLogin(String id, String password) {

		Member member = new Member();
		member.setMemberId(id);
		member.setPassword(password);

		boolean result;
		
		result = memberService.checkPw(id, password);

		System.out.println(result+"m");
		if(result == false) {
			return "false";
		} else {
			return "true";
		}
		
	}	
	@RequestMapping(value = "/mobile/review/list/truck.do", produces="application/xml")
	public @ResponseBody Reviews searchReviewBytruckId(String foodtruckId){
		List<Review> review = reviewService.findByTruckId(foodtruckId);
		Reviews reviews = new Reviews();
		reviews.setReviews(review);
		return reviews;
	}

	@RequestMapping(value = "/mobile/review/followReview.do", produces="application/xml")
	public @ResponseBody Reviews searchReviewByFollow(String memberId){
		List<Review> review = reviewService.findByFromId(memberId);
		Reviews reviews = new Reviews();
		reviews.setReviews(review);
		return reviews;
	}
	
	@RequestMapping(value = "/mobile/follow/list.do", produces="application/xml")
	public @ResponseBody Members searchFollowers(String toId){
		List<Follow> follow = followService.findFollow(toId);
		List<Member> member = new ArrayList<>();
		for(Follow f : follow){
			member.add(memberService.findById(f.getToId()));
		}
		
		Members members = new Members();
		members.setMembers(member);
		
		return members;
	}
	
	@RequestMapping(value="/mobile/favorite/list.do", produces="application/xml")
	public @ResponseBody Foodtrucks searchFavorites(String memberId){
		List<Favorite> favorite = favoriteService.findMemberId(memberId);
		List<Foodtruck> foodtruck = new ArrayList<>();
		for(Favorite f : favorite){
			foodtruck.add(truckService.findById(f.getFoodtruckId()));
		}
		
		Foodtrucks foodtrucks = new Foodtrucks();
		foodtrucks.setFoodtrucks(foodtruck);
		
		return foodtrucks;
	}
}
