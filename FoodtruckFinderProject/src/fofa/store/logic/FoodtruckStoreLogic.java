package fofa.store.logic;

import java.util.List;

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
		int insert = 0;
		try{
			FoodtruckMapper mapper = session.getMapper(FoodtruckMapper.class);
			insert = mapper.insert(foodtruck);
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
	public Foodtruck selectById(String sellerId) {
		SqlSession session = factory.openSession();
		Foodtruck foodtruck = null;
		try{
			FoodtruckMapper mapper = session.getMapper(FoodtruckMapper.class);
			foodtruck = mapper.selectById(sellerId);
		} finally {
			session.close();
		}
		return foodtruck;
	}

	@Override
	public List<Foodtruck> selectByLoc(String location) {
		SqlSession session = factory.openSession();
		List<Foodtruck> list = null;
		try{
			FoodtruckMapper mapper = session.getMapper(FoodtruckMapper.class);
			list = mapper.selectByLoc(location);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Foodtruck> selectByKeyLoc(String keyword, String location) {
		SqlSession session = factory.openSession();
		List<Foodtruck> list = null;
		try{
			FoodtruckMapper mapper = session.getMapper(FoodtruckMapper.class);
			list = mapper.selectByKeyLoc(keyword, location);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Foodtruck> selectByFilter(Foodtruck foodtruck) {
		SqlSession session = factory.openSession();
		List<Foodtruck> list = null;
		try{
			FoodtruckMapper mapper = session.getMapper(FoodtruckMapper.class);
			list = mapper.selectByFilter(foodtruck);
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
