package fofa.controller.web;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fofa.domain.Seller;
import fofa.service.SellerService;

@Controller
public class SellerController {

	@Autowired
	private SellerService sellerService;
	
	
	@RequestMapping(value = "seller/create.do", method = RequestMethod.GET) 
	public String createForm(){
		return "user/registerSeller.jsp";
	}	


	@RequestMapping(value = "seller/checkId.do") 
	public String checkId(String sellerId){
		boolean id = sellerService.checkId(sellerId);
		if(id == true) {
			return sellerId;
		} else  {

		}
		return "user/registerSeller.jsp";
	
	}	
	
	@RequestMapping("seller/checkPw.do")
	public String checkPw(HttpSession session, String sellerPw) {
		return "user/checkPassword.jsp";
	}
	
	@RequestMapping(value = "seller/create.do", method = RequestMethod.POST) 
	public String create(Seller seller, Model model){
		sellerService.register(seller);
		model.addAttribute(seller);
		return "foodtruck/registerTruck.jsp";
	}	

	
	@RequestMapping(value = "seller/modify.do", method = RequestMethod.GET) 
	public String modifyForm(HttpSession session, Model model){
		String sellerId = null;
		Seller seller = sellerService.findById(sellerId);
		model.addAttribute(seller);
		return "user/modifySeller.jsp";
	}	
	

	@RequestMapping(value = "seller/modify.do", method = RequestMethod.POST) 
	public String modify(Seller seller){
		sellerService.modify(seller);
		return "user/registerSeller.jsp";
	}	

	@RequestMapping(value = "seller/remove.do", method = RequestMethod.GET) 
	public String removeForm(){
		return "user/checkPassword.jsp";
	}

	@RequestMapping(value = "seller/remove.do", method = RequestMethod.POST) 
	public String remove(HttpSession session){
		String sellerId = null;
		sellerService.remove(sellerId);
		return "redirect:/index.do";
	}
	

	
	
	
}
