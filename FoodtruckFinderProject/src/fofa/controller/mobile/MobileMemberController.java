package fofa.controller.mobile;

import java.util.ArrayList; 
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import fofa.domain.Favorite;
import fofa.domain.Follow;
import fofa.domain.Foodtruck;
import fofa.domain.Foodtrucks;
import fofa.domain.Image;
import fofa.domain.Images;
import fofa.domain.Member;
import fofa.domain.Members;
import fofa.domain.Review;
import fofa.domain.Reviews;
import fofa.service.FavoriteService;
import fofa.service.FollowService;
import fofa.service.FoodtruckService;
import fofa.service.MemberService;
import fofa.service.ReviewService;

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
	
	
	@RequestMapping(value="/mobile/memberRegister.do", produces="application/json", method=RequestMethod.POST)
	public @ResponseBody String memberLogin(@RequestBody Member member) {
		System.out.println("여기까지왔군"+member.getMemberId());

		if(!memberService.checkId(member.getMemberId())){
			if(memberService.register(member)){
				return "true";
			}else{
				return "false";
			}
		}else {
			return "duplicatedId";
		}
	}
	
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
	
	@RequestMapping(value = "/mobile/review/member/list.do", produces="application/xml")
	public @ResponseBody Reviews searchReviewByMember(String memberId){
		List<Review> review = reviewService.findByMemberId(memberId);
		Reviews reviews = new Reviews();
		reviews.setReviews(review);
		return reviews;
	}
	
	@RequestMapping(value = "/mobile/follow/list.do", produces="application/xml")
	public @ResponseBody Members searchFollowers(String fromId){
		List<Follow> follow = followService.findFollow(fromId);
		List<Member> member = new ArrayList<>();
		for(Follow f : follow){
			member.add(memberService.findById(f.getToId()));
		}
		
		Members members = new Members();
		members.setMembers(member);
		return members;
	}
	@RequestMapping("/mobile/follow/remove")
	public String removeFollow(@RequestParam("memberId") String toId, HttpServletRequest req){
		HttpSession session = req.getSession(false);
		if(session == null || session.getAttribute("loginUserId")==null){
			return "redirect:/mobile/memberlogin.do";
		}
		Follow follow = new Follow();
		String fromId = (String) session.getAttribute("loginUserId");
		follow.setFromId(fromId);
		follow.setToId(toId);
		System.out.println(follow);
		followService.remove(follow);
		
		return "redirect:/mobile/follow/list.do";
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
		
		System.out.println("^^");
		return foodtrucks;
	}
	
	@RequestMapping(value="mobile/review/detail.do")
	public @ResponseBody Images searchReviewImage(String reviewId){
		Review review = reviewService.findById(reviewId);
		
		List<Image> images = review.getImages();
		Images image = new Images();
		image.setImages(images);
		return image;
	}

	@RequestMapping(value = "/mobile/member/detail.do", produces="application/xml")
	public @ResponseBody Member detail(String id){
		Member member = memberService.findById(id);
		return member;
	}
	@RequestMapping(value ="/mobile/member/modify.do", produces="application/xml")
	public @ResponseBody void modifyMember(Member member){
		memberService.mobileupdate(member);
	}
	@RequestMapping(value ="/moblie/member/reviewList.do", produces="application/xml")
	public @ResponseBody Reviews memberReviews(String id){
	List<Review> list = new ArrayList<>();
	Reviews memberReviews = new Reviews();
	list = reviewService.findByMemberId(id);
	memberReviews.setReviews(list);
	return memberReviews;	
	}
	
}
