package fofa.controller.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FollowController {
	
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
