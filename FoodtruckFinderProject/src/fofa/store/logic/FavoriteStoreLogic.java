package fofa.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import fofa.domain.Favorite;
import fofa.store.FavoriteStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.FavoriteMapper;

public class FavoriteStoreLogic implements FavoriteStore{
	private SqlSessionFactory factory;
	
	public FavoriteStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public int insert(Favorite favorite) {
		SqlSession session = factory.openSession();
		int insert = 0;
		try{
			FavoriteMapper mapper = session.getMapper(FavoriteMapper.class);
			insert = mapper.insert(favorite);
			session.commit();
		}finally{
			session.close();
		}
		return insert;
	}

	@Override
	public int delete(Favorite favorite) {
		SqlSession session = factory.openSession();
		int delete = 0;
		try{
			FavoriteMapper mapper = session.getMapper(FavoriteMapper.class);
			delete = mapper.delete(favorite);
			session.commit();
		}finally{
			session.close();
		}
		return delete;
	}

	@Override
	public List<Favorite> selectByMemberId(String memberId) {
		SqlSession session = factory.openSession();
		List<Favorite> list = null;
		try{
			FavoriteMapper mapper = session.getMapper(FavoriteMapper.class);
			list = mapper.selectByMemberId(memberId);
		}finally{
			session.close();
		}
		return list;
	}

	@Override
	public int selectByTruckId(String foodtruckId) {
		SqlSession session = factory.openSession();
		int count = 0;
		try{
			FavoriteMapper mapper = session.getMapper(FavoriteMapper.class);
			count = mapper.selectByTruckId(foodtruckId);
		}finally{
			session.close();
		}
		return count;
	}

}
