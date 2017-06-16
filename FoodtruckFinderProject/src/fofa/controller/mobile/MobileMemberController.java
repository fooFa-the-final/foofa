package fofa.controller.mobile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;

import fofa.domain.Favorite;
import fofa.domain.Follow;
import fofa.domain.Foodtruck;
import fofa.domain.Foodtrucks;
import fofa.domain.Image;
import fofa.domain.Images;
import fofa.domain.Member;
import fofa.domain.Members;
import fofa.domain.Recommand;
import fofa.domain.Report;
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
	
	@RequestMapping(value = "/mobile/review/create.do")
	public @ResponseBody String createReview(@RequestBody String data){
		Gson gson = new GsonBuilder().create();
		String result = "";
		try {
			JSONParser jsonParser = new JSONParser();
				
			Review review = gson.fromJson(((JSONObject) jsonParser.parse(data)).toJSONString(), Review.class);
			String reviewId = reviewService.register(review);
			System.out.println(reviewId);
			result = reviewId;
		}
		catch (Exception e) {
			result = "fail";
		}
		
		return result;
	}
	
	@RequestMapping(value="/mobile/review/image.do", method=RequestMethod.POST)
	@ResponseBody
	public String reviewImage(MultipartFile file, HttpServletRequest req, String reviewId){
		System.out.println(reviewId);
		List<Image> images = new ArrayList<>();
		if(file == null)
			System.out.println("null");
		else{
			Image image = new Image();
			String root = req.getSession().getServletContext().getRealPath("\\");
			String path = root+"\\resources\\img\\reviewImg\\";
			String fileName = file.getOriginalFilename();
			String newFileName = System.currentTimeMillis()+"."+fileName.substring(fileName.lastIndexOf(".")+1);
			System.out.println(path+newFileName);
			image.setCategoryId(reviewId);
			image.setFilename(newFileName);
			images.add(image);
			reviewService.registerImage(image);
			try {
				byte[] fileData = file.getBytes();
				FileOutputStream output = new FileOutputStream(path + newFileName);
				output.write(fileData);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}	
		return reviewId;
	}
	
	@RequestMapping("mobile/review/recommand.do")
	@ResponseBody
	public String createRecommand(String reviewId, String memberId){
		Recommand recommand = new Recommand();
		recommand.setReviewId(reviewId);
		recommand.setWriterId(memberId);
		boolean reg = reviewService.registerRecommand(recommand);
		System.out.println(recommand.toString());
		if(!reg){
			reviewService.deleteRecommand(recommand);
			return "false";
		}
		return "true";
	}
	
	@RequestMapping(value="/mobile/report/create.do", method=RequestMethod.POST, produces="application/json")
	public @ResponseBody String createReport(@RequestBody String data) throws JsonSyntaxException, ParseException{
		Gson gson = new GsonBuilder().create();
		JSONParser jsonParser = new JSONParser();
			
		Report report = gson.fromJson(((JSONObject) jsonParser.parse(data)).toJSONString(), Report.class);
		boolean reg = reviewService.registerReport(report);
		System.out.println(reg);
		if(!reg){
			return "false";
		}
		
		return "true";
	}
}
