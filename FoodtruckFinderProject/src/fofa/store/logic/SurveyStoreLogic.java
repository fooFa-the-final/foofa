package fofa.store.logic;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import fofa.domain.Survey;
import fofa.domain.SurveyItem;
import fofa.store.SurveyStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.SurveyItemMapper;
import fofa.store.mapper.SurveyMapper;

public class SurveyStoreLogic implements SurveyStore{
	
	private SqlSessionFactory factory;
	
	public SurveyStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public int insert(Survey survey) {
		SqlSession session = factory.openSession();
		int insert = 0;
		try{
			SurveyMapper mapper = session.getMapper(SurveyMapper.class);
		insert = mapper.insert(survey);
		session.commit();
		} finally {
			session.close();
		}
		return insert;
	}

	@Override
	public List<Survey> selectByTruckId(String foodtruckId) {
		SqlSession session = factory.openSession();
		List<Survey> surveys = new ArrayList<>();
		try {
			SurveyMapper mapper = session.getMapper(SurveyMapper.class);
			surveys = mapper.selectByTruckId(foodtruckId);
			session.commit();
		} finally {
			session.close();
		}
		return surveys;
	}

	@Override
	public List<Survey> selectAvgByAges(String foodtruckId, String itemId) {
		SqlSession session = factory.openSession();
		List<Survey> surveys = new ArrayList<>();
		try {
			SurveyMapper mapper = session.getMapper(SurveyMapper.class);
			surveys = mapper.selectAvgByAges(foodtruckId, itemId);
			session.commit();
		} finally {
			session.close();
		}
		return surveys;
	}

	@Override
	public List<Survey> selectAvgByGender(String foodtruckId, String itemId) {
		SqlSession session = factory.openSession();
		List<Survey> surveys = new ArrayList<>();
		try {
			SurveyMapper mapper = session.getMapper(SurveyMapper.class);
			surveys = mapper.selectAvgByGender(foodtruckId, itemId);
			session.commit();
		} finally {
			session.close();
		}
		return surveys;
	}

}
