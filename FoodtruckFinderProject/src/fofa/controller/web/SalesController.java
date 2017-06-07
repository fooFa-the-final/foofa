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

import fofa.domain.Sale;
import fofa.service.SalesService;
import fofa.service.logic.SalesServiceLogic;

@Controller
public class SalesController {

	@Autowired
	private SalesServiceLogic service;

	@RequestMapping(value = "sales/create.do", method = RequestMethod.POST)
	public String create(HttpServletRequest req, Sale sale) {
		/*
		 * HttpSession session = req.getSession(); String foodtruckId = (String)
		 * session.getAttribute("loginTruckId");
		 */

		sale.setFoodtruckId("F1");
		service.register(sale);
		return "redirect:/truck.do";
	}

	@RequestMapping(value = "sales/modify.do", method = RequestMethod.POST)
	public String modify(HttpServletRequest req,Sale sale) {
		/*
		 * HttpSession session = req.getSession(); String foodtruckId = (String)
		 * session.getAttribute("loginTruckId");
		 */
		sale.setFoodtruckId("F1");
		service.modify(sale);
		return "redirect:/truck.do";
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
	public @ResponseBody JSONObject searchDateSale(String date, HttpServletRequest req) {
		/*
		 * HttpSession session = req.getSession(); String foodtruckId = (String)
		 * session.getAttribute("loginTruckId");
		 */
		Sale sale = service.findDateSale(date, "F1");
		
	
			JSONObject obj = new JSONObject();
			obj.put("re", sale.getRevenue());
			obj.put("lo", sale.getLocation());
			obj.put("da", sale.getDate());

		System.out.println("date : " + obj);

		return obj;
	}

	@RequestMapping(value = "sales/year.do")
	public @ResponseBody JSONArray search1YearSales(HttpServletRequest req) {
		/*
		 * HttpSession session = req.getSession(); String foodtruckId = (String)
		 * session.getAttribute("loginTruckId");
		 */
		List<Sale> list = new ArrayList<>();

		for (int i = 0; i < 12; i++) {
			Sale sale = new Sale();
			sale.setRevenue(0);
			list.add(i, sale);
		}

		for (int i = 0; i < 12; i++) {
			for (int j = 0; j < service.find1YearSales("F1").size(); j++) {
				if ("0".equals(service.find1YearSales("F1").get(j).getDate().substring(5))) {
					list.remove(9);
					list.add(9, service.find1YearSales("F1").get(j));
				} else if ("1".equals(service.find1YearSales("F1").get(j).getDate().substring(5))) {
					if ("01".equals(service.find1YearSales("F1").get(j).getDate().substring(4))) {
						list.remove(0);
						list.add(0, service.find1YearSales("F1").get(j));
					}
					if ("11".equals(service.find1YearSales("F1").get(j).getDate().substring(4))) {
						list.remove(10);
						list.add(10, service.find1YearSales("F1").get(j));
					}
				} else if ("2".equals(service.find1YearSales("F1").get(j).getDate().substring(5))) {
					if ("02".equals(service.find1YearSales("F1").get(j).getDate().substring(4))) {
						list.remove(1);
						list.add(1, service.find1YearSales("F1").get(j));
					}
					if ("12".equals(service.find1YearSales("F1").get(j).getDate().substring(4))) {
						list.remove(11);
						list.add(11, service.find1YearSales("F1").get(j));
					}
				}

				else if (Integer.toString(i + 1).equals(service.find1YearSales("F1").get(j).getDate().substring(5))) {
					list.remove(i);
					list.add(i, service.find1YearSales("F1").get(j));
				}
			}
		}

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
	public @ResponseBody JSONArray search10DaysSales(HttpServletRequest req) {
		/*
		 * HttpSession session = req.getSession(); String foodtruckId = (String)
		 * session.getAttribute("loginTruckId");
		 */
		List<Sale> list = new ArrayList<>();

		for (int i = 0; i < 10; i++) {
			Sale sale = new Sale();
			sale.setDate("NONE");
			sale.setRevenue(0);
			list.add(i, sale);
		}

		int k = 0;
		for (Sale sale : service.find10DaysSales("F1")) {
			String date = sale.getDate().substring(4);
			sale.setDate(date);
			list.remove(9 - k);
			list.add(9 - k, sale);
			k++;
		}

		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < list.size(); i++) {

			JSONObject obj = new JSONObject();
			obj.put("re", list.get(i).getRevenue());
			obj.put("da", list.get(i).getDate());
			jsonArray.add(obj);

		}

		System.out.println(jsonArray);
		return jsonArray;

	}

	@RequestMapping(value = "sales/month.do")
	public @ResponseBody JSONArray search1MonthSales(HttpServletRequest req) {
		/*
		 * HttpSession session = req.getSession(); String foodtruckId = (String)
		 * session.getAttribute("loginTruckId");
		 */

		List<Sale> list = service.find1MonthSales("F1");
		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < list.size(); i++) {

			JSONObject obj = new JSONObject();
			obj.put("re", list.get(i).getRevenue());
			obj.put("da", list.get(i).getDate());
			jsonArray.add(obj);

		}
		System.out.println(list.size());
		System.out.println(jsonArray);
		return jsonArray;

	}
}
