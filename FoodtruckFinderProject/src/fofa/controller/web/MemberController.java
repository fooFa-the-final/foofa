package fofa.controller.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fofa.domain.Member;

@Controller
public class MemberController {

	@RequestMapping(value="member/createForm.do", method= RequestMethod.GET)
	public String createForm(){
		return "../view/member/registerMember.jsp";
	}		
	@RequestMapping("member/checkId.do")
	public String checkId(String memberId){
		return "../view/member/memberRegister.jsp";
	}
	@RequestMapping(value="member/create.do", method = RequestMethod.POST)
	public String create(Member member){
		return "../view/user/login.jsp";
	}
	@RequestMapping(value="member/modifyForm.do", method= RequestMethod.GET)
	public String modifyForm(HttpSession session, Model model){
		return "../view/member/modifyMember.jsp";
	}
	@RequestMapping(value="member/modify.do", method=RequestMethod.POST)
	public String modify(Member member){
		return "redirect:review/list/member.do";
	}
	@RequestMapping("member/checkPw.do")
	public String checkPw(HttpSession session, String password){
		return "../view/member/deleteMember.jsp";
	}
	@RequestMapping("member/remove.do")
	public String remove(HttpSession session){
		return "../view/member/index.jsp";
	}
	@RequestMapping("member/modifypic.do")
	public String modifyPicture(HttpSession session, String img){
		return "redirect:review/list/member.do";
	}
}
