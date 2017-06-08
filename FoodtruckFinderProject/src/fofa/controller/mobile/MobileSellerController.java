package fofa.controller.mobile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import fofa.domain.Seller;
import fofa.service.SellerService;

@Controller
public class MobileSellerController {

	@Autowired
	private SellerService sellerService;
	
	
	@RequestMapping(value="/mobile/slogin.do")
	public @ResponseBody String sellerLogin(String id, String password) {
		
		Seller seller = new Seller();
		seller.setSellerId(id);
		seller.setPassword(password);
		

		boolean result;
		
		result = sellerService.checkPw(id, password);
		
		if(result == false) {
			return "false";
		} else {
			return "true";
		}
		
	}	
}
