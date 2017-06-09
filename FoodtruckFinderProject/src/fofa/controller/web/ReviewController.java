package fofa.controller.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import fofa.domain.Foodtruck;
import fofa.domain.Image;
import fofa.domain.Member;
import fofa.domain.Recommand;
import fofa.domain.Report;
import fofa.domain.Review;
import fofa.domain.Survey;
import fofa.domain.SurveyItem;
import fofa.domain.SurveyReply;
import fofa.service.FoodtruckService;
import fofa.service.MemberService;
import fofa.service.ReviewService;
import fofa.service.SurveyItemService;
import fofa.service.SurveyService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private FoodtruckService truckService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SurveyService surveyService;
	
	@Autowired
	private SurveyItemService itemService;
	@RequestMapping("/review/list/member.do")
	public String searchByMemberId(String memberId, HttpSession session, Model model){
		if(memberId == null){
			memberId = (String)session.getAttribute("loginUserId");
		}
		Member member = memberService.findById(memberId);
		model.addAttribute("member", member);
		model.addAttribute("nowId", (String)session.getAttribute("loginUserId"));
		List<Review> list = reviewService.findByMemberId(memberId);
		model.addAttribute("list", list);
		return "../../view/user/memberReviewList.jsp";
	}

	@RequestMapping("/review/list/follow.do")
	public String searchByFollower(String fromId, HttpSession session, Model model){
		if(fromId == null){
			fromId = (String)session.getAttribute("loginUserId");
		}
		List<Review> list = reviewService.findByFromId(fromId);

		model.addAttribute("list", list);
		Member member = memberService.findById(fromId);
		model.addAttribute("member", member);
		return "../../view/user/memberNewsfeed.jsp";
	}
	
	@RequestMapping("/review/list/truck.do")
	public String searchByFoodtruckId(String foodtruckId, Model model, HttpSession session){
		Foodtruck truck = truckService.findById(foodtruckId);
		List<Review> reviewList = reviewService.findByTruckId(foodtruckId);
		String[] operationTime = truck.getOperationTime().split("/");
		String startTime = operationTime[0];
		String endTime = operationTime[1];
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		model.addAttribute("truck", truck);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("memberId", (String)session.getAttribute("loginUserId"));
		System.out.println(truck.getFoodtruckId());
		return "../../view/foodtruck/detailFoodtruck.jsp";
	}
	@RequestMapping(value="/review/create.do", method=RequestMethod.GET)
	public String createReviewForm(String foodtruckId, Model model){
		Foodtruck truck = truckService.findById(foodtruckId);
		model.addAttribute("review", "null");
		model.addAttribute("truck", truck);
		List<SurveyItem> itemlist = itemService.findAll();
		model.addAttribute("itemlist", itemlist);
		return "/view/user/registerReview.jsp";
	}
	
	@RequestMapping(value="/review/create.do", method=RequestMethod.POST)
	public String createReview(Review review, Model model, MultipartHttpServletRequest req){
		String foodtruckId = (String)req.getParameter("foodtruckId");
		Foodtruck truck = truckService.findById(foodtruckId);
		review.setFoodtruck(truck);
		HttpSession session = req.getSession();
//		System.out.println((String)session.getAttribute("loginUserId"));
		Member member = memberService.findById((String)session.getAttribute("loginUserId"));
		System.out.println(member.toString());
		review.setWriter(member);
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)req;
	    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	    MultipartFile multipartFile = null;
	    List<Image> images = new ArrayList<>();
	    String root = req.getSession().getServletContext().getRealPath("\\");
        String path = root+"\\resources\\img\\reviewImg\\";
        String newFileName = "";
        File dir = new File(path);
        if(!dir.isDirectory()){
            dir.mkdir();
        }
	    while(iterator.hasNext()){
	        multipartFile = multipartHttpServletRequest.getFile(iterator.next());
	        if(multipartFile.isEmpty() == false){
	        	Image image = new Image();
	        	String fileName = multipartFile.getOriginalFilename();
	        	newFileName = System.currentTimeMillis()+"."
	                    +fileName.substring(fileName.lastIndexOf(".")+1);
	        	image.setFilename(newFileName);
	        	images.add(image);
	            /*System.out.println("name : "+multipartFile.getName());
	            System.out.println("filename : "+multipartFile.getOriginalFilename());
	            System.out.println("size : "+multipartFile.getSize());*/
	        	
	        	try {
	                multipartFile.transferTo(new File(path+newFileName));
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    
	    review.setImages(images);
		reviewService.register(review);
		if(req.getParameter("isSurvey") != null){
			Survey survey = new Survey();
			survey.setFoodtruckId(foodtruckId);
			survey.setGender(member.getGender().charAt(0));
			survey.setAges(calAges(member.getBirthday()));
			String op = req.getParameter("ourtext");
			if(op == null || op.trim().equals(""))
				survey.setSuggestion("");
			else
				survey.setSuggestion(op);
			
			List<String> itemId = new ArrayList<>();
			List<SurveyItem> itemList = itemService.findAll();
			List<SurveyReply> replyList = new ArrayList<>();
			for(SurveyItem s : itemList){
				String id = s.getItemId();
				itemId.add(id);
			}
			
			for(String s : itemId){
				SurveyReply reply = new SurveyReply();
				reply.setScore(Integer.parseInt(req.getParameter("q" + s)));
				reply.setItemId(s);
				replyList.add(reply);
			}
			
			survey.setReplies(replyList);
			surveyService.register(survey);
		}
		
		return "redirect:/review/list/truck.do?foodtruckId="+review.getFoodtruck().getFoodtruckId();
	}
	
	private int calAges(String birth){
		birth = birth.substring(2, 4);
		Date date = new Date();
		int year = date.getYear() + 1;
		int age = year - Integer.parseInt(birth);
		int ageRange = age/10 * 10;
		return ageRange;
	}
	@RequestMapping(value="/review/modify.do", method=RequestMethod.GET)
	public String modifyReviewForm(String reviewId, Model model){
		Review review = reviewService.findById(reviewId);
		model.addAttribute("review", review);
		model.addAttribute("img1", review.getImages().get(0).getFilename());
		model.addAttribute("img2", review.getImages().get(1).getFilename());
		return "/view/user/registerReview.jsp";
	}
	
	@RequestMapping(value="/review/modify.do", method=RequestMethod.POST)
	public String modifyReview(Review review2, MultipartHttpServletRequest req, HttpSession session){
		Review review = reviewService.findById(req.getParameter("reviewId"));
		review.setContents(req.getParameter("contents"));
		review.setScore(Integer.parseInt(req.getParameter("score")));
		System.out.println(review.toString());
		String memberId = (String)session.getAttribute("loginUserId");
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)req;
	    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	    MultipartFile multipartFile = null;
	    List<Image> images = new ArrayList<>();
	    String root = req.getSession().getServletContext().getRealPath("\\");
        String path = root+"\\resources\\img\\reviewImg\\";
        String newFileName = "";
        File dir = new File(path);
        if(!dir.isDirectory()){
            dir.mkdir();
        }
        int count = 0;
	    while(iterator.hasNext()){
	        multipartFile = multipartHttpServletRequest.getFile(iterator.next());
	        if(multipartFile.isEmpty() == false){
	        	Image image = new Image();
	        	for(Image i : review.getImages()){
	        		System.out.println(i.toString());
	        	}
	        	image.setImageId(review.getImages().get(count).getImageId());
	        	String fileName = multipartFile.getOriginalFilename();
	        	newFileName = System.currentTimeMillis()+"."
	                    +fileName.substring(fileName.lastIndexOf(".")+1);
	        	image.setFilename(newFileName);
	        	images.add(image);
	            /*System.out.println("name : "+multipartFile.getName());
	            System.out.println("filename : "+multipartFile.getOriginalFilename());
	            System.out.println("size : "+multipartFile.getSize());*/
	        	count++;
	        	try {
	                multipartFile.transferTo(new File(path+newFileName));
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    review.setImages(images);
	    reviewService.modify(review);
		return "redirect:list/member.do?memberId="+memberId;
	}
	
	@RequestMapping("/review/remove.do")
	@ResponseBody
	public String removeReview(String reviewId){
		reviewService.remove(reviewId);
		return "true";
	}
	
	@RequestMapping("/review/report/create.do")
	@ResponseBody
	public String createReport(HttpServletRequest req){
		HttpSession session = req.getSession();
		Report report = new Report();
		report.setMemberId((String)session.getAttribute("loginUserId"));
		String reasonContents = req.getParameter("reasonContents");
		if(req.getParameter("reason").equals("direct")){
			if(reasonContents == null || reasonContents.trim().equals(""))
				return "false";
			report.setReason(reasonContents);
		} else {
			report.setReason(req.getParameter("reason"));
		}
		report.setReviewId(req.getParameter("reviewId"));
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
