package fofa.controller.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import fofa.service.FollowService;
import fofa.service.MemberService;

@Controller
public class FollowController {
	
	@Autowired
	private MemberService memberSerivce;
	@Autowired
	private FollowService followService;
	
	@RequestMapping("follow/create.do")
	public boolean create(String followingId, HttpSession session){
		
		return true;
	}
	public boolean remove(String followingId, HttpSession session){
		return false;
	}
	@RequestMapping("follow/list.do")
	public String search(HttpSession session, Model model){
		
		return "../view/member/memberFollowList.jsp";
	}
	@RequestMapping("follow/count.do")
	public int searchCount(String memberId){
		
		return 0;
	}
	
}
