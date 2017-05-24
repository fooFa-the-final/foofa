package fofa.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import fofa.domain.Menu;
import fofa.store.MenuStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.MenuMapper;

@Repository
public class MenuStoreLogic implements MenuStore{
	private SqlSessionFactory factory;
	
	public MenuStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public int insert(Menu menu) {
		SqlSession session = factory.openSession();
		int insert = 0;
		try{
		MenuMapper mapper = session.getMapper(MenuMapper.class);
		insert = mapper.insert(menu);
		session.commit();
		} finally {
			session.close();
		}
		return insert;
	}

	@Override
	public int update(Menu menu) {
		SqlSession session = factory.openSession();
		int update = 0;
		try{
			MenuMapper mapper = session.getMapper(MenuMapper.class);
			update = mapper.update(menu);
			session.commit();
		} finally {
			session.close();
		}
		return update;
	}

	@Override
	public int delete(String menuId, String foodtruckId) {
		SqlSession session = factory.openSession();
		int delete = 0;
		try{
			MenuMapper mapper = session.getMapper(MenuMapper.class);
			delete = mapper.delete(menuId, foodtruckId);
			session.commit();
		} finally {
			session.close();
		}
		return delete;
	}

	@Override
	public List<Menu> selectByTruckId(String foodtruckId) {
		SqlSession session = factory.openSession();
		List<Menu> list = null;
		try{
			MenuMapper mapper = session.getMapper(MenuMapper.class);
			list = mapper.selectByTruckId(foodtruckId);
		} finally {
			session.close();
		}
		return list;
	}

}
