package fofa.controller.web;

import java.io.IOException; 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@ResponseBody
	@RequestMapping(value="member/checkId.do", method=RequestMethod.POST)
	public String checkId(HttpServletRequest req){
		String memberId = req.getParameter("id");
		boolean result;
		result = service.checkId(memberId);
		System.out.println(result);
		
		
		if(result == true){
			return "yes";
		}
			return "no";
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
		model.addAttribute(member);
		return "../view/member/modifyMember.jsp";
	}
	@RequestMapping(value="member/modify.do", method=RequestMethod.POST)
	public String modify(Member member){
		service.modify(member);
		return "redirect:review/list/member.do";
	}
	@RequestMapping(value="member/checkPw.do", method=RequestMethod.GET)
	public String checkPwForm(HttpSession session){
		
		
		return "../view/member/checkPassword.jsp";
	}
	
	@ResponseBody
	@RequestMapping(value="member/checkPw.do", method=RequestMethod.POST)
	public String checkPw(HttpSession session, String password){
		Member member = service.findById((String)(session.getAttribute("loginUserId")));
		String memberId = member.getMemberId();
		boolean result;
		result = service.checkPw(memberId, password);
		System.out.println(result);
		
		if(result == true){
			return "yes";
		}
			
			return "no";
		}
	@RequestMapping(value="member/remove.do", method= RequestMethod.GET)
	public String removeForm(HttpSession session, Model model){
		Member member = service.findById((String)(session.getAttribute("loginUserId")));
		return "../view/member/removeMember.jsp";
	}
	
	@RequestMapping(value= "member/remove.do", method=RequestMethod.POST)
	public String remove(HttpSession session){
		 service.remove((String)(session.getAttribute("loginUserId")));
		return "../view/index.jsp";
	}
	@RequestMapping("member/modifypic.do")
	public String modifyPicture(HttpSession session, String img){
		
		
		return "redirect:review/list/member.do";
	}
}
