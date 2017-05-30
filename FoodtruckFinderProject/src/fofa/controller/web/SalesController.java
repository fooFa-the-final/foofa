package fofa.controller.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import fofa.domain.Sale;
import fofa.service.logic.SalesServiceLogic;

@Controller
public class SalesController {

	@Autowired
	private SalesServiceLogic service;

	@RequestMapping(value = "sales/create.do", method = RequestMethod.POST)
	public String create(HttpSession session, Sale sale) {
		service.register(sale);
		return "redirect:sales/truck.do";
	}

	@RequestMapping(value = "sales/modify.do", method = RequestMethod.POST)
	public String modify(Sale sale) {
		service.modify(sale);
		return "redirect:sales/truck.do";
	}

	@RequestMapping("sales/remove.do")
	public String remove(String saleId) {
		service.remove(saleId);
		return "redirect:sales/truck.do";
	}

	@RequestMapping("sales/truck.do")
	public String searchTruckSales(String foodtruckId, Model model) {

		return "/view/foodtruck/foodtruckSales.jsp";
	}

	@RequestMapping(value = "sales/date.do", method = RequestMethod.POST)
	public void searchDateSale(Sale sale, Model model) {
		String date = sale.getDate();
		String foodtruckId = sale.getFoodtruckId();
		Sale sale1 = service.findDateSale(date, foodtruckId);

	}

	@RequestMapping(value = "sales/year.do")
	public @ResponseBody JSONArray search1YearSales(HttpServletRequest req) {
		/*
		 * HttpSession session = req.getSession(); String foodtruckId = (String)
		 * session.getAttribute("loginTruckId");
		 */
		List<Sale> list = new ArrayList<>();

		list = service.find1YearSales("1");

		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < list.size(); i++) {

			JSONObject obj = new JSONObject();
			obj.put("re", list.get(i).getRevenue());
			jsonArray.add(obj);

		}

		System.out.println(jsonArray);
		return jsonArray;

	}

	@RequestMapping(value = "sales/10days.do")
	public void search10DaysSales(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String foodtruckId = (String) session.getAttribute("loginTruckId");
		List<Sale> list = service.find10DaysSales(foodtruckId);

	}

	@RequestMapping(value = "sales/month.do")
	public void search1MonthSales(HttpServletRequest req, String month) {
		HttpSession session = req.getSession();
		String foodtruckId = (String) session.getAttribute("loginTruckId");
		List<Sale> list = service.find1MonthSales(foodtruckId, month);

	}
}
