package fofa.store.logic;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import fofa.domain.SurveyItem;
import fofa.store.SurveyItemStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.SurveyItemMapper;

public class SurveyItemStoreLogic implements SurveyItemStore{
	
	private SqlSessionFactory factory;
	
	public SurveyItemStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public int insert(String question) {
		SqlSession session = factory.openSession();
		int insert = 0;
		try {
			SurveyItemMapper mapper = session.getMapper(SurveyItemMapper.class);
			insert = mapper.insert(question);
			session.commit();
		} finally {
			session.close();
		}
		return insert;
	}

	@Override
	public int update(SurveyItem surveyItem) {
		SqlSession session = factory.openSession();
		int update = 0;
		try {
			SurveyItemMapper mapper = session.getMapper(SurveyItemMapper.class);
			update = mapper.update(surveyItem);
			session.commit();
		} finally {
			session.close();
		}
		return update;
	}

	@Override
	public int delete(String surveyItemId) {
		SqlSession session = factory.openSession();
		int delete = 0;
		try {
			SurveyItemMapper mapper = session.getMapper(SurveyItemMapper.class);
			delete = mapper.delete(surveyItemId);
			session.commit();
		} finally {
			session.close();
		}
		return delete;
	}

	@Override
	public List<SurveyItem> selectAll() {
		SqlSession session = factory.openSession();
		List<SurveyItem> items = new ArrayList<>();
		try {
			SurveyItemMapper mapper = session.getMapper(SurveyItemMapper.class);
			items = mapper.selectAll();
			session.commit();
		} finally {
			session.close();
		}
		return items;
	}

}
