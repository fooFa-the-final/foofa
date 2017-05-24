package fofa.controller.web;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import fofa.domain.Member;

public class MemberController {

	public String createForm(){
		return null;
	}
	
	public String create(String memberId){
		return null;
	}
	public String checkId(String memberId){
		return null;
	}
	public String create(Member member){
		return null;
	}
	public String modifyForm(HttpSession session, Model model){
		return null;
	}
	public String modify(Member member){
		return null;
	}
	public String checkPw(HttpSession session, String password){
		return null;
	}
	public String remove(HttpSession session){
		return null;
	}
	public String modifyPicture(HttpSession session, String img){
		return null;
	}
}
