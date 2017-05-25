package fofa.controller.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class FollowController {
	
	public boolean create(String followingId, HttpSession session){
		return false;
	}
	public boolean remove(String followingId, HttpSession session){
		return false;
	}
	public String search(HttpSession session, Model model){
		
		return null;
	}
	public int searchCount(String memberId){
		return 0;
	}
	
}
