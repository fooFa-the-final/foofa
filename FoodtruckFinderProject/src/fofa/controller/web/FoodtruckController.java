package fofa.controller.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import fofa.domain.Foodtruck;
import fofa.domain.Member;
import fofa.domain.Menu;
import fofa.service.AdvertiseService;
import fofa.service.FavoriteService;
import fofa.service.FoodtruckService;

@RequestMapping("/foodtruck")
@Controller
public class FoodtruckController {
	@Autowired
	private FoodtruckService foodtruckService;
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private AdvertiseService advertiseService;
	
	
	@RequestMapping(value="/create.do", method=RequestMethod.POST)
	public String create(Foodtruck foodtruck, HttpServletRequest request){
		foodtruck.setOperationTime((String)request.getParameter("startTime")+ "/" +(String)request.getParameter("endTime"));	
		foodtruck.setCategory1(foodtruck.getCategory1() + "/" + foodtruck.getCategory2() + "/" + foodtruck.getCategory3());
		foodtruck.setSpot(foodtruck.getLocation());
		
		foodtruck.setFoodtruckImg("user.jsp");
		
		List<Menu> menus = new ArrayList<>();
		
		String[] menuNames = request.getParameterValues("menuName");
		String[] menuPrices = request.getParameterValues("menuPrice");
		String[] menuStates = request.getParameterValues("menuState");
		
		if(menuNames!=null){
			for(int i = 0; i< menuNames.length; i++){
				Menu menu = new Menu();
				menu.setMenuName(menuNames[i]);
				menu.setPrice(Integer.parseInt(menuPrices[i]));
				menu.setMenuState(Boolean.parseBoolean(menuStates[i]));
				menus.add(menu);
			}
			foodtruck.setMenus(menus);
		}
		
		foodtruckService.register(foodtruck);
		return "redirect: ../view/user/login.jsp";
	}
	
	@RequestMapping(value="/modifyForm.do", method=RequestMethod.GET)
	public String modifyForm(String sellerId, Model model, HttpSession session){
		Foodtruck foodtruck = foodtruckService.findBySeller((String)session.getAttribute("loginUserId"));
		String[] category = foodtruck.getCategory1().split("/");
		foodtruck.setCategory1(category[0]);
		if(category.length == 2){
			foodtruck.setCategory2(category[1]);
		}
		if(category.length == 3){
			foodtruck.setCategory2(category[1]);
			foodtruck.setCategory3(category[2]);
		}
		model.addAttribute("truck", foodtruck);
		
		String[] operationTime = foodtruck.getOperationTime().split("/");
		String startTime = operationTime[0];
		String endTime = operationTime[1];
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		
		return "../view/foodtruck/modifyFoodtruck.jsp";
	}
	
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public String modify(Foodtruck foodtruck, HttpServletRequest request){
		foodtruck.setOperationTime((String)request.getParameter("startTime") + "/" + (String)request.getParameter("endTime"));
		List<Menu> menus = new ArrayList<>();
		
		String[] menuId = request.getParameterValues("menuId");
		String[] menuNames = request.getParameterValues("menuName");
		String[] menuPrices = request.getParameterValues("menuPrice");
		String[] menuStates = request.getParameterValues("menuState");
		
		for(int i = 0; i< menuNames.length; i++){
			Menu menu = new Menu();
			menu.setMenuId(menuId[i]);
			menu.setMenuName(menuNames[i]);
			menu.setPrice(Integer.parseInt(menuPrices[i]));
			menu.setMenuState(Boolean.parseBoolean(menuStates[i]));
			menus.add(menu);
		}
		foodtruck.setMenus(menus);
		foodtruckService.modify(foodtruck);
		return "redirect:/foodtruck/searchById.do";
	}
	
	@ResponseBody
	@RequestMapping(value="/modifyPicture.do", method=RequestMethod.POST)
	public String modifyPicture(MultipartHttpServletRequest request){
		
		String img= null;
        // 저장 경로 설정
        String root = request.getSession().getServletContext().getRealPath("/");
        String path = root+"resources\\img\\food\\";
        String newFileName = ""; // 업로드 되는 파일명
         
        File dir = new File(path);
        if(!dir.isDirectory()){
            dir.mkdir();
        }
         
        Iterator<String> files = request.getFileNames();
        while(files.hasNext()){
            String uploadFile = files.next();
                         
            MultipartFile mFile = request.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            newFileName = System.currentTimeMillis() + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
            Foodtruck foodtruck = foodtruckService.findBySeller((String)request.getSession().getAttribute("loginUserId"));
            foodtruck.setFoodtruckImg(newFileName);
            foodtruckService.modify(foodtruck);
            
            try {
                mFile.transferTo(new File(path+newFileName));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "success";
	}
	
	@ResponseBody
	@RequestMapping(value="/modifyState.do", method=RequestMethod.GET)
	public boolean modifyState(HttpSession session, boolean operation_state){
		System.out.println("controller");
		
		Foodtruck foodtruck = foodtruckService.findBySeller((String)session.getAttribute("loginUserId"));
		
		if(operation_state){
			foodtruck.setState(false);
		}else{
			foodtruck.setState(true);
		}
		
		foodtruckService.modify(foodtruck);

		return foodtruck.isState();
	}
	
	@RequestMapping("/searchById.do")
	public String searchById(Model model, HttpSession session){
		Foodtruck foodtruck = foodtruckService.findBySeller((String)session.getAttribute("loginUserId"));
		
		String[] operationTime = foodtruck.getOperationTime().split("/");
		String startTime = operationTime[0];
		String endTime = operationTime[1];
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		model.addAttribute("truck", foodtruck);
		return "../view/foodtruck/foodtruckInfo.jsp";
	}
	
	
	@RequestMapping(value="/searchByKeyLoc.do", method=RequestMethod.GET)
	public String searchByKeyLoc(String keyword, String location, int currentIndex, Model model){
		List<HashMap<String, String>> sqlMap;
		List<Foodtruck> trucks = new ArrayList<>();
		int allCount = 0;

		if(keyword==null || keyword==""){
			sqlMap = foodtruckService.findByLoc(currentIndex, location);
		} else {
			sqlMap = foodtruckService.findByKeyLoc(currentIndex, keyword, location);
		}
		
		for(int i = 0; i < sqlMap.size(); i++){
			Foodtruck t = new Foodtruck();
			t.setFoodtruckId(sqlMap.get(i).get("foodtruckId"));
			t.setFoodtruckName(sqlMap.get(i).get("foodtruckName"));
			t.setFoodtruckImg(sqlMap.get(i).get("foodtruckImg"));
			t.setCategory1(sqlMap.get(i).get("category1"));
			t.setSpot(sqlMap.get(i).get("spot"));
			t.setLocation(sqlMap.get(i).get("location"));
			trucks.add(t);
		}
		if(!sqlMap.isEmpty()){
			allCount = Integer.parseInt(sqlMap.get(0).get("allCount"));
		}
		model.addAttribute("currentIndex", currentIndex);
		model.addAttribute("allCount", allCount);
		model.addAttribute("trucks", trucks);
		model.addAttribute("keyword", keyword);
		model.addAttribute("location", location);
		return "../view/foodtruck/listFoodtruck.jsp";
	}
	
	@RequestMapping(value="/searchByKeyLoc.do", method=RequestMethod.POST)
	public String searchByKeyLoc(Integer currentIndex, String keyword, String location, Model model){
		if(currentIndex==null){
			currentIndex = 1;
		}
		List<HashMap<String, String>> sqlMap;
		List<Foodtruck> trucks = new ArrayList<>();
		int allCount = 0;
		if(keyword.isEmpty()){
			sqlMap = foodtruckService.findByLoc(currentIndex, location);
		} else {
			sqlMap = foodtruckService.findByKeyLoc(currentIndex, keyword, location);
		}
		
		for(int i = 0; i < sqlMap.size(); i++){
			Foodtruck t = new Foodtruck();
			t.setFoodtruckId(sqlMap.get(i).get("foodtruckId"));
			t.setFoodtruckName(sqlMap.get(i).get("foodtruckName"));
			t.setFoodtruckImg(sqlMap.get(i).get("foodtruckImg"));
			t.setCategory1(sqlMap.get(i).get("category1"));
			t.setSpot(sqlMap.get(i).get("spot"));
			t.setLocation(sqlMap.get(i).get("location"));
			trucks.add(t);
		}
		if(!sqlMap.isEmpty()){
			allCount = Integer.parseInt(sqlMap.get(0).get("allCount"));
		}
		model.addAttribute("currentIndex", currentIndex);
		model.addAttribute("allCount", allCount);
		model.addAttribute("trucks", trucks);
		model.addAttribute("keyword", keyword);
		model.addAttribute("location", location);
		return "../view/foodtruck/listFoodtruck.jsp";
	}
	
	
	
	@RequestMapping(value="/searchByFilter.do", method=RequestMethod.POST)
	public String searchByFilter(HttpServletRequest request, Model model){
		Foodtruck foodtruck = new Foodtruck();
		String location = request.getParameter("location");
		String keyword = request.getParameter("keyword");
		String checked = request.getParameter("checking");
		int currentIndex = 1;
		boolean state = Boolean.parseBoolean(request.getParameter("openstate"));
//		String state = request.getParameter("openstate");
		
		if(request.getParameter("currentIndex") != null){
			currentIndex = Integer.parseInt(request.getParameter("currentIndex"));
		}
		if(state){
//			System.out.println("state true");
			foodtruck.setState(state);
			model.addAttribute("openState", true);
		}
		
		
		String[] filter = checked.split("/");
		for(int i = 0; i < filter.length; i++){
			if(filter[i].equals("card")){
				foodtruck.setCard(true);
				model.addAttribute("card", true);
			}
			if(filter[i].equals("drinking")){
				foodtruck.setDrinking(true);
				model.addAttribute("drinking", true);
			}
			if(filter[i].equals("parking")){
				foodtruck.setParking(true);
				model.addAttribute("parking", true);
			}
			if(filter[i].equals("catering")){
				foodtruck.setCatering(true);
				model.addAttribute("catering", true);
			}
		}
		
//		System.out.println("loc:"+location+" key:"+keyword+" index:"+currentIndex + " checked:" + checked);
		foodtruck.setLocation(location);
		foodtruck.setFoodtruckName(keyword);
		
		List<HashMap<String, String>> sqlMap = foodtruckService.findByFilter(currentIndex, foodtruck);
		List<Foodtruck> trucks = new ArrayList<>();
		int allCount = 0;
//		System.out.println("궁금궁금 : " + sqlMap.size() + "/" + Integer.parseInt(sqlMap.get(0).get("allCount")));
		
		for(int i = 0; i < sqlMap.size(); i++){
			Foodtruck t = new Foodtruck();
			t.setFoodtruckId(sqlMap.get(i).get("foodtruckId"));
			t.setFoodtruckName(sqlMap.get(i).get("foodtruckName"));
			t.setFoodtruckImg(sqlMap.get(i).get("foodtruckImg"));
			t.setCategory1(sqlMap.get(i).get("category1"));
			t.setSpot(sqlMap.get(i).get("spot"));
			t.setLocation(sqlMap.get(i).get("location"));
			trucks.add(t);
		}
		if(!sqlMap.isEmpty()){
			allCount = Integer.parseInt(sqlMap.get(0).get("allCount"));
		}
		model.addAttribute("currentIndex", currentIndex);
		model.addAttribute("allCount", allCount);
		model.addAttribute("trucks", trucks);
		model.addAttribute("keyword", foodtruck.getFoodtruckName());
		model.addAttribute("location", foodtruck.getLocation());
		
		return "../view/foodtruck/listFoodtruck.jsp";
	}
	
	@RequestMapping("/createMenu.do")
	public List<Menu> createMenu(Menu menu){
		
		return null;
	}
	
	@RequestMapping("/modifyMenu.do")
	public List<Menu> modifyMenu(Menu menu){
		
		return null;
	}
	
	@RequestMapping("/removeMenu.do")
	public List<Menu> removeMenu(String menuId, String foodtruckId){
		
		return null;
	}
	
	
}

