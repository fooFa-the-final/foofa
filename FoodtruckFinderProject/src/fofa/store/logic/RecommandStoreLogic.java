package fofa.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import fofa.domain.Recommand;
import fofa.store.RecommandStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.ReportMapper;

public class RecommandStoreLogic implements RecommandStore {

private SqlSessionFactory factory;
	
	public RecommandStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public int insert(Recommand recommand) {
		SqlSession session = factory.openSession();
		int delete = 0;
		try{
			ReportMapper mapper = session.getMapper(ReportMapper.class);
			delete = mapper.delete(report);
			session.commit();
		} finally {
			session.close();
		} 
		return delete;
	}

	@Override
	public int delete(Recommand recommand) {
		// TODO Auto-generated method stub
		return 0;
	}

}
