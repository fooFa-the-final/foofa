package fofa.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import fofa.domain.Seller;
import fofa.service.SellerService;

@Controller
public class SellerController {

	@Autowired
	private SellerService sellerService;
	
	
	@RequestMapping("seller/createForm.do") 
	public String createForm(){
		return "user/registerSeller.jsp";
	}	

	
	@RequestMapping("seller/create.do") 
	public String create(Seller seller, Model model){
		sellerService.register(seller);
		model.addAttribute(seller);
		return "user/registerSeller.jsp";
	}	

	@RequestMapping("seller/create.do") 
	public String checkId(String sellerId){
		
		boolean id = sellerService.checkId(sellerId);
		if(id == true) {
			
		} else  {
			
		}
		
		
		return "user/registerSeller.jsp";

	
	}	

	
	
	
}
