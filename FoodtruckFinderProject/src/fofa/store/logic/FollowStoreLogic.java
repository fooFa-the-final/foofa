package fofa.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import fofa.domain.Follow;
import fofa.store.FollowStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.FollowMapper;

@Repository
public class FollowStoreLogic implements FollowStore {

	private SqlSessionFactory factory;
	
	public FollowStoreLogic(){
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public int insert(Follow follow) {
		SqlSession session = factory.openSession();
		int insert = 0;
		try{
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			insert= mapper.insert(follow);
			session.commit();
		}finally{
			session.close();
		}
		return insert;
	}

	@Override
	public int delete(Follow follow) {
		SqlSession session = factory.openSession();
		int delete = 0;
		try{
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			delete = mapper.delete(follow);
			session.commit();
		}finally{
			session.close();
		}
		return delete;
	}

	@Override
	public List<Follow> selectByFromId(String fromId) {
		SqlSession session = factory.openSession();
		List<Follow> list = null;
		try{
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			list = mapper.selectByFromId(fromId);
		}finally{
			session.close();
		}
		return list;
	}

	@Override
	public int selectByToId(String toId) {
		SqlSession session = factory.openSession();
		int count = 0;
		try{
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			count = mapper.selectByToId(toId);
		}finally{
			session.close();
		}
		return count;
	}
}
