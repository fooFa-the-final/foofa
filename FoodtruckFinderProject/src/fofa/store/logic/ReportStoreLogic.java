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
		} 
		return delete;
	}

	@Override
	public Report selectById(Report report) {
		SqlSession session = factory.openSession();
		try{
			ReportMapper mapper = session.getMapper(ReportMapper.class);
			report = mapper.selectById(report);

		} finally {
			session.close();
		} 
		return report;
	}

	@Override
	public List<Report> selectAll() {
		SqlSession session = factory.openSession();
		List<Report> list = null;
		try{
			ReportMapper mapper = session.getMapper(ReportMapper.class);
			list = mapper.selectAll();

		} finally {
			session.close();
		} 
		return list;
	}

}
