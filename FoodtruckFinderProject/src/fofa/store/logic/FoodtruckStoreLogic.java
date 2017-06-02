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
	public List<Foodtruck> selectByLoc(int pageNum, String location) {
		SqlSession session = factory.openSession();
		List<Foodtruck> list = null;
		
		int nPageIndex = 0;
		int nPageRow = 10;
		
		if(pageNum != 0){
			nPageIndex = pageNum - 1;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("START", (nPageIndex * nPageRow) + 1);
		map.put("END", (nPageIndex * nPageRow) + nPageRow);
		map.put("location", location);
		try{
			FoodtruckMapper mapper = session.getMapper(FoodtruckMapper.class);
			list = mapper.selectByLoc(map);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Foodtruck> selectByKeyLoc(int pageNum, String keyword, String location) {
		SqlSession session = factory.openSession();
		List<Foodtruck> list = null;
		
		int nPageIndex = 0;
		int nPageRow = 10;
		
		Map<String, Object> map = new HashMap<>();
		map.put("START", (nPageIndex * nPageRow) + 1);
		map.put("END", (nPageIndex * nPageRow) + nPageRow);
		map.put("keyword", keyword);
		map.put("location", location);
		try{
			FoodtruckMapper mapper = session.getMapper(FoodtruckMapper.class);
			list = mapper.selectByKeyLoc(map);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Foodtruck> selectByFilter(int pageNum, Foodtruck foodtruck) {
		SqlSession session = factory.openSession();
		List<Foodtruck> list = null;
		
		int nPageIndex = 0;
		int nPageRow = 10;
		
		Map<String, Object> map = new HashMap<>();
		map.put("START", (nPageIndex * nPageRow) + 1);
		map.put("END", (nPageIndex * nPageRow) + nPageRow);
		map.put("foodtruck", foodtruck);
		try{
			FoodtruckMapper mapper = session.getMapper(FoodtruckMapper.class);
			list = mapper.selectByFilter(map);
		} finally {
			session.close();
		}
		return list;
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
