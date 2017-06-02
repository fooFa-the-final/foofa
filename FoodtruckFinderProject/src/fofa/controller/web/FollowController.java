package fofa.controller.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fofa.domain.Favorite;
import fofa.domain.Follow;
import fofa.domain.Member;
import fofa.service.FollowService;
import fofa.service.MemberService;
import fofa.service.ReviewService;

@Controller
public class FollowController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private FollowService followService;
	@Autowired
	private ReviewService reviewService;
	
	@ResponseBody
	@RequestMapping(value="follow/create.do", method=RequestMethod.GET)
	public boolean create(String memberId, HttpSession session){
		Follow follow = new Follow();
		follow.setFromId((String)session.getAttribute("loginUserId"));
		follow.setToId(memberId);
		return followService.register(follow);
	}
	@ResponseBody
	@RequestMapping(value="follow/remove.do", method=RequestMethod.GET)
	public boolean remove(String fromId, HttpSession session){
		Member member = memberService.findById((String)(session.getAttribute("loginUserId")));
		String toId = member.getMemberId();
		Follow follow = new Follow();
		follow.setToId(toId);
		follow.setFromId(fromId);
		return followService.remove(follow);
	}
	@RequestMapping("follow/list.do")
	public String search(HttpSession session, Model model){
		Member member = memberService.findById((String)(session.getAttribute("loginUserId")));
		model.addAttribute(member);
		String toId = member.getMemberId();
		List<Follow> follow =  followService.findFollow(toId);
		model.addAttribute("follow", follow);
		
		return "../view/user/memberFollowerList.jsp";
	}
	@RequestMapping("follow/count.do")
	public int searchCount(String memberId,HttpSession session, Model model){
		Member member = memberService.findById((String)(session.getAttribute("loginUserId")));
		model.addAttribute(member);
		String toId = member.getMemberId();
		List<Follow> follow =  followService.findFollow(toId);
		
		return 0;
	}
	
}
