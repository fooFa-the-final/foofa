package fofa.controller.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fofa.domain.Member;
import fofa.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	
	@RequestMapping(value="member/createForm.do", method= RequestMethod.GET)
	public String createForm(){
		return "../view/member/registerMember.jsp";
	}		
	
	@RequestMapping(value="member/checkId.do", method=RequestMethod.POST)
	public String checkId(HttpServletRequest req, HttpServletResponse res) throws IOException{
		String memberId = req.getParameter("id");
		boolean result;
		result = service.checkId(memberId);
		System.out.println(result);
		
		PrintWriter out = res.getWriter();
		
		if(result == true){
			out.print("no");
			System.out.println("사용불가능");
			return "result";
		}else{
			out.print("yes");
			System.out.println("사용가능");
			return "result";
		}
	}
	@RequestMapping(value="member/create.do", method = RequestMethod.POST)
	public String create(Model model,Member member){
		service.register(member);
		model.addAttribute(member);
		return "../view/user/login.jsp";
	}
	@RequestMapping(value="member/modify.do", method= RequestMethod.GET)
	public String modifyForm(HttpSession session, Model model){
		Member member = service.findById((String)(session.getAttribute("loginUserId")));
		System.out.println(member.toString());
		model.addAttribute(member);
		return "../view/member/modifyMember.jsp";
	}
	@RequestMapping(value="member/modify.do", method=RequestMethod.POST)
	public String modify(Member member){
		service.modify(member);
		return "redirect:review/list/member.do";
	}
	@RequestMapping("member/checkPw.do")
	public String checkPw(HttpSession session, String password){
		
		
		
		return "../view/member/deleteMember.jsp";
	}
	@RequestMapping("member/remove.do")
	public String remove(HttpSession session){
		service.remove(session.getId());
		return "../view/member/index.jsp";
	}
	@RequestMapping("member/modifypic.do")
	public String modifyPicture(HttpSession session, String img){
		
		
		return "redirect:review/list/member.do";
	}
}
