package fofa.controller.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fofa.domain.Member;
import fofa.domain.Seller;
import fofa.service.SellerService;

@Controller
public class SellerController {

	@Autowired
	private SellerService sellerService;

	@RequestMapping(value = "seller/create.do", method = RequestMethod.GET)
	public String createForm() {
		return "../view/seller/registerSeller.jsp";
	}

	@ResponseBody
	@RequestMapping(value = "seller/checkId.do")
	public String checkId(HttpServletRequest req) {
		String sellerId = req.getParameter("sellerId");
		System.out.println(sellerId);
		boolean result;
		result = sellerService.checkId(sellerId);
		if (result == true) {
			return "yes";
		}
		return "no";
	}

	@RequestMapping(value = "seller/checkPw.do", method = RequestMethod.GET)
	public String checkPwForm() {
		return "../view/seller/checkPassword.jsp";
	}

	@ResponseBody
	@RequestMapping(value = "seller/checkPw.do", method = RequestMethod.POST)
	public String checkPw(HttpSession session, String password) {
		Seller seller = sellerService.findById((String) (session.getAttribute("loginUserId")));
		String sellerId = seller.getSellerId();
		boolean result;
		result = sellerService.checkPw(sellerId, password);
		System.out.println(result);

		if (result == true) {
			return "yes";
		}

		return "no";
	}

	@RequestMapping(value = "seller/remove.do", method = RequestMethod.GET)
	public String removeForm() {
		return "../view/seller/removeSeller.jsp";
	}

	@RequestMapping(value = "seller/remove.do", method = RequestMethod.POST)
	public String remove(HttpSession session) {
		String sellerId = (String) session.getAttribute("loginUserId");
		System.out.println(sellerId);
		sellerService.remove(sellerId);
		return "redirect:/index.do";
	}
	
	
	@RequestMapping(value = "seller/create.do", method = RequestMethod.POST)
	public String create(Seller seller, Model model) {
		sellerService.register(seller);
		model.addAttribute("sellerId", seller.getSellerId());
		return "../view/foodtruck/registerTruck.jsp";
	}

	@RequestMapping(value = "seller/modify.do", method = RequestMethod.GET)
	public String modifyForm(HttpSession session, Model model) {
		String sellerId = (String) session.getAttribute("loginUserId");
		Seller seller = sellerService.findById(sellerId);
		model.addAttribute(seller);
		return "../view/seller/modifySeller.jsp";
	}

	@RequestMapping(value = "seller/modify.do", method = RequestMethod.POST)
	public String modify(Seller seller) {
		sellerService.modify(seller);
		return "../view/foodtruck/foodtruckInfo.jsp";
	}



}