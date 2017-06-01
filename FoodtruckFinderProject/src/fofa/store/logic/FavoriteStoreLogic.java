package fofa.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import fofa.domain.Favorite;
import fofa.store.FavoriteStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.FavoriteMapper;

@Repository
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
			System.out.println(insert);
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

	@Override
	public int select(Favorite favorite) {
		SqlSession session = factory.openSession();
		int count = 0;
		try{
			FavoriteMapper mapper = session.getMapper(FavoriteMapper.class);
			count = mapper.select(favorite);
		}finally{
			session.close();
		}
		return count;
	}

}
