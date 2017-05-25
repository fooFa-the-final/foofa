package fofa.store.logic;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;

import fofa.domain.Sale;
import fofa.store.SalesStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.SalesMapper;

public class SalesStoreLogic implements SalesStore {

	private SqlSessionFactory factory;

	public SalesStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public int insert(Sale sale) {
		SqlSession session = factory.openSession();
		int createCount = 0;

		try {
			SalesMapper mapper = session.getMapper(SalesMapper.class);
			createCount = mapper.insert(sale);
			session.commit();
		} finally {
			session.close();
		}
		return createCount;

	}

	@Override
	public int update(Sale sale) {
		SqlSession session = factory.openSession();
		int updateCount = 0;

		try {
			SalesMapper mapper = session.getMapper(SalesMapper.class);
			updateCount = mapper.update(sale);
			session.commit();
		} finally {
			session.close();
		}
		return updateCount;

	}

	@Override
	public int delete(String saleId) {
		SqlSession session = factory.openSession();
		int deleteCount = 0;

		try {
			SalesMapper mapper = session.getMapper(SalesMapper.class);
			deleteCount = mapper.delete(saleId);
			session.commit();
		} finally {
			session.close();
		}
		return deleteCount;

	}

	@Override
	public Sale selectDaySale(String date, String foodtruckId) {
		SqlSession session = factory.openSession();
		Sale sale = new Sale();
		sale.setDate(date);
		sale.setFoodtruckId(foodtruckId);

		try {
			SalesMapper mapper = session.getMapper(SalesMapper.class);

			sale = mapper.selectDaySale(sale);
		} finally {
			session.close();
		}
		return sale;
	}

	@Override
	public List<Sale> select1MonthSales(String foodtruckId, String month) {
		SqlSession session = factory.openSession();
		Map<String, String> map = new HashMap<>();
		map.put("month", month);
		map.put("foodtruckId", foodtruckId);

		List<Sale> list = new ArrayList<>();
		try {
			SalesMapper mapper = session.getMapper(SalesMapper.class);
			list = mapper.select1MonthSales(map);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Sale> select1YearSales(String foodtruckId) {
		SqlSession session = factory.openSession();
		List<Sale> list = new ArrayList<>();
		try {
			SalesMapper mapper = session.getMapper(SalesMapper.class);
			list = mapper.select1YearSales(foodtruckId);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Sale> select10DaysSales(String foodtruckId) {
		SqlSession session = factory.openSession();
		List<Sale> list = new ArrayList<>();
		try {
			SalesMapper mapper = session.getMapper(SalesMapper.class);
			list = mapper.select10DaysSales(foodtruckId);
		} finally {
			session.close();
		}
		return list;
	}

}
