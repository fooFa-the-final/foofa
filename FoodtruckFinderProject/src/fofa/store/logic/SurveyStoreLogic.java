package fofa.store.logic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import fofa.domain.Survey;
import fofa.store.SurveyStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.SurveyMapper;

@Repository
public class SurveyStoreLogic implements SurveyStore{
	
	private SqlSessionFactory factory;
	
	public SurveyStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public String insert(Survey survey) {
		SqlSession session = factory.openSession();
		String insert = "";
		try{
			SurveyMapper mapper = session.getMapper(SurveyMapper.class);
		mapper.insert(survey);
		insert = survey.getSurveyId();
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
			Map<String, String> params = new HashMap<>();
			params.put("foodtruckId", foodtruckId);
			params.put("itemId", itemId);
			surveys = mapper.selectAvgByAges(params);
			session.commit();
		} finally {
			session.close();
		}
		return surveys;
	}

	@Override
	public List<Survey> selectAvgByGender(String foodtruckId, String itemId) {
		SqlSession session = factory.openSession();
		System.out.println("store : " + foodtruckId + itemId);
		List<Survey> surveys = new ArrayList<>();
		try {
			SurveyMapper mapper = session.getMapper(SurveyMapper.class);
			HashMap<String, String> params = new HashMap<>();
			

			params.put("foodtruckId", foodtruckId);
			params.put("itemId", itemId);
			surveys = mapper.selectAvgByGender(params);
			session.commit();
		} finally {
			session.close();
		}
		for(int i = 0;i<surveys.size();i++){
			System.out.println("gender : " +surveys.get(i).getGender());
		}
		
		return surveys;
	}

}
