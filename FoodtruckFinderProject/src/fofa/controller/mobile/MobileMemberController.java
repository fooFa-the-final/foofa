package fofa.controller.mobile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import fofa.domain.Member;
import fofa.domain.Seller;
import fofa.service.MemberService;
import fofa.service.SellerService;

@Controller
@RequestMapping("/mobile/member")
public class MobileMemberController {

	@Autowired
	private MemberService memberService;
	

	
	@RequestMapping(value="/login.do")
	public @ResponseBody String memberLogin(String id, String password) {

		Member member = new Member();
		member.setMemberId(id);
		member.setPassword(password);

		boolean result;
		
		result = memberService.checkPw(id, password);
		
		if(result == false) {
			return "false";
		} else {
			return "true";
		}
		
	}	


	
}
