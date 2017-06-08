package fofa.controller.web;

import java.util.ArrayList;
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
	public boolean create(String toId, HttpSession session){
		Follow follow = new Follow();
		follow.setFromId((String)session.getAttribute("loginUserId"));
		follow.setToId(toId);
		return followService.register(follow);
	}
	@ResponseBody
	@RequestMapping(value="follow/remove.do", method=RequestMethod.GET)
	public boolean remove(String toId, HttpSession session){
		Member member = memberService.findById((String)(session.getAttribute("loginUserId")));
		
		String fromId = member.getMemberId();
		Follow follow = new Follow();
		follow.setToId(toId);
		follow.setFromId(fromId);
		return followService.remove(follow);
	}
	@RequestMapping("follow/list.do")
	public String search(String fromId, HttpSession session, Model model){
		if(fromId == null ){
			fromId = (String)session.getAttribute("loginUserId");
		}
		Member member = memberService.findById(fromId);
		model.addAttribute("member",member);
		List<Follow> follow =  followService.findFollow(fromId);
		List<Member> mfollow = new ArrayList<>();
		for(int i = 0 ; i < follow.size(); i++) {
			Member e = new Member();
			e = memberService.findById(follow.get(i).getToId());
			mfollow.add(e);
		}
		model.addAttribute("follow", mfollow);
		
		return "../view/user/memberFollowerList.jsp";
	}
	@RequestMapping("follow/count.do")
	public int searchCount(String memberId,HttpSession session, Model model){
		memberId = ((String)(session.getAttribute("loginUserId")));
		List<Follow> follow =  followService.findFollow(memberId);
		int count;
		count=follow.size();
		
		model.addAttribute("followCount", count);
		return count;
	}
	
}
