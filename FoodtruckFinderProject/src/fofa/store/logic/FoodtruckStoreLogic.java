package fofa.store.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import fofa.domain.Foodtruck;
import fofa.store.FoodtruckStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.FoodtruckMapper;

@Repository
public class FoodtruckStoreLogic implements FoodtruckStore{
	private SqlSessionFactory factory;
	
	public FoodtruckStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public String insert(Foodtruck foodtruck) {
		SqlSession session = factory.openSession();
		String foodtruckId = null;
		try{
			FoodtruckMapper mapper = session.getMapper(FoodtruckMapper.class);
			mapper.insert(foodtruck);
			foodtruckId = foodtruck.getFoodtruckId();
			session.commit();
		} finally {
			session.close();
		}
		return foodtruckId;
	}

	@Override
	public int update(Foodtruck foodtruck) {
		SqlSession session = factory.openSession();
		int update = 0;
		try{
			FoodtruckMapper mapper = session.getMapper(FoodtruckMapper.class);
			update = mapper.update(foodtruck);
			session.commit();
		} finally {
			session.close();
		}
		return update;
	}

	@Override
	public Foodtruck selectById(String foodtruckId) {
		SqlSession session = factory.openSession();
		Foodtruck foodtruck = null;
		try{
			FoodtruckMapper mapper = session.getMapper(FoodtruckMapper.class);
			foodtruck = mapper.selectById(foodtruckId);
		} finally {
			session.close();
		}
		return foodtruck;
	}

	@Override
	public List<HashMap<String, String>> selectByLoc(int pageNum, String location) {
		SqlSession session = factory.openSession();
		
		int nPageIndex = 0;
		int nPageRow = 10;
		
		if(pageNum != 0){
			nPageIndex = pageNum - 1;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("START", (nPageIndex * nPageRow) + 1);
		map.put("END", (nPageIndex * nPageRow) + nPageRow);
		map.put("location", location);
		List<HashMap<String, String>> sqlMap;
		try{
			FoodtruckMapper mapper = session.getMapper(FoodtruckMapper.class);
			sqlMap = mapper.selectByLoc(map);
		} finally {
			session.close();
		}
		return sqlMap;
	}

	@Override
	public List<HashMap<String, String>> selectByKeyLoc(int pageNum, String keyword, String location) {
		SqlSession session = factory.openSession();
		
		int nPageIndex = 0;
		int nPageRow = 10;
		
		if(pageNum != 0){
			nPageIndex = pageNum - 1;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("START", (nPageIndex * nPageRow) + 1);
		map.put("END", (nPageIndex * nPageRow) + nPageRow);
		map.put("keyword", keyword);
		map.put("location", location);
		
		List<HashMap<String, String>> sqlMap;
		try{
			FoodtruckMapper mapper = session.getMapper(FoodtruckMapper.class);
			sqlMap = mapper.selectByKeyLoc(map);
		} finally {
			session.close();
		}
		return sqlMap;
	}

	@Override
	public List<HashMap<String, String>> selectByFilter(int pageNum, Foodtruck foodtruck) {
		SqlSession session = factory.openSession();
		
		int nPageIndex = 0;
		int nPageRow = 10;
		
		Map<String, Object> map = new HashMap<>();
		map.put("START", (nPageIndex * nPageRow) + 1);
		map.put("END", (nPageIndex * nPageRow) + nPageRow);
		map.put("location", foodtruck.getLocation());
		map.put("keyword", foodtruck.getFoodtruckName());
		
		if(foodtruck.isCard()){
			map.put("card", true);
		}
		if(foodtruck.isCatering()){
			map.put("catering", true);
		}
		if(foodtruck.isDrinking()){
			map.put("drinking", true);
		}
		if(foodtruck.isParking()){
			map.put("parking", true);
		}
		if(foodtruck.isState()){
			map.put("state", true);
		}
		
		List<HashMap<String, String>> sqlMap;
		try{
			FoodtruckMapper mapper = session.getMapper(FoodtruckMapper.class);
			sqlMap = mapper.selectByFilter(map);
		} finally {
			session.close();
		}
		return sqlMap;
	}

	@Override
	public Foodtruck selectBySellerId(String sellerId) {
		SqlSession session = factory.openSession();
		Foodtruck foodtruck = null;
		try{
			FoodtruckMapper mapper = session.getMapper(FoodtruckMapper.class);
			foodtruck = mapper.selectBySellerId(sellerId);
		} finally {
			session.close();
		}
		return foodtruck;
	}

}
