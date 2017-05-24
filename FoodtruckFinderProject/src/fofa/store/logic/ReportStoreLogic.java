package fofa.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import fofa.domain.Report;
import fofa.store.ReportStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.ReportMapper;

public class ReportStoreLogic implements ReportStore {

	private SqlSessionFactory factory;
	
	public ReportStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public int insert(Report report) {
		SqlSession session = factory.openSession();
		int insert = 0;
		try{
			ReportMapper mapper = session.getMapper(ReportMapper.class);
			insert = mapper.insert(report);
			session.commit();
		} finally {
			session.close();
		} return insert;
	}

	@Override
	public int delete(Report report) {
		SqlSession session = factory.openSession();
		int delete = 0;
		try{
			ReportMapper mapper = session.getMapper(ReportMapper.class);
			delete = mapper.delete(report);
			session.commit();
		} finally {
			session.close();
		} return delete;
	}

	@Override
	public Report selectById(String reportId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Report> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
