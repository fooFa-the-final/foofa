package fofa.controller.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fofa.domain.Sale;
import fofa.service.SalesService;
import fofa.service.logic.SalesServiceLogic;

@Controller
public class SalesController {

	@Autowired
	private SalesServiceLogic service;

	@RequestMapping(value = "sales/create.do", method = RequestMethod.POST)
	public String create(HttpSession session, Sale sale) {
		return "redirect:sales/truck.do";
	}

	@RequestMapping(value = "sales/modify.do", method = RequestMethod.POST)
	public String modify(Sale sale) {
		return "redirect:sales/truck.do";
	}

	@RequestMapping("sales/remove.do")
	public String remove(String saleId) {
		return "redirect:sales/truck.do";
	}

	@RequestMapping("sales/truck.do")
	public String searchTruckSales(String foodtruckId, Model model) {
		return "/view/foodtruck/foodtruckSales.jsp";
	}

	@RequestMapping(value = "sales/date.do", method = RequestMethod.POST)
	public void searchDateSale(Sale sale, Model model) {

	}

	@RequestMapping(value = "sales/year.do")
	public void search1YearSales(String foodtruckId) {
		List<Sale> list = service.find1YearSales(foodtruckId);

	}

	@RequestMapping(value = "sales/10days.do")
	public void search10DaysSales(String foodtruckId) {
		List<Sale> list = service.find10DaysSales(foodtruckId);

	}

	@RequestMapping(value = "sales/month.do")
	public void search1MonthSales(String foodtruckId, String month) {

		List<Sale> list = service.find1MonthSales(foodtruckId, month);

	}
}
