package fofa.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import fofa.domain.Recommand;
import fofa.store.RecommandStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.RecommandMapper;

@Repository
public class RecommandStoreLogic implements RecommandStore {

	private SqlSessionFactory factory;
	
	public RecommandStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public int insert(Recommand recommand) {
		SqlSession session = factory.openSession();
		int insert = 0;
		try{
			RecommandMapper mapper = session.getMapper(RecommandMapper.class);
			insert = mapper.insert(recommand);
			session.commit();
		} finally {
			session.close();
		} 
		return insert;
	}

	@Override
	public int delete(Recommand recommand) {
		SqlSession session = factory.openSession();
		int delete = 0;
		try{
			RecommandMapper mapper = session.getMapper(RecommandMapper.class);
			delete = mapper.delete(recommand);
			session.commit();
		} finally {
			session.close();
		} 
		return delete;
	}

	@Override
	public List<Recommand> selectAll(String reviewId) {
		SqlSession session = factory.openSession();
		List<Recommand> list = null;
		try{
			RecommandMapper mapper = session.getMapper(RecommandMapper.class);
			list = mapper.selectAll(reviewId);
		} finally {
			session.close();
		} 
		return list;
	}
}
