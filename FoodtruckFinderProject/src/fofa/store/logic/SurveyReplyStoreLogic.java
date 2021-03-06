package fofa.store.logic;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import fofa.domain.SurveyReply;
import fofa.store.SurveyReplyStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.SurveyReplyMapper;

@Repository
public class SurveyReplyStoreLogic implements SurveyReplyStore {

	private SqlSessionFactory factory;

	public SurveyReplyStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public int insert(SurveyReply surveyReply) {
		SqlSession session = factory.openSession();
		int insert = 0;
		try {
			SurveyReplyMapper mapper = session.getMapper(SurveyReplyMapper.class);
			insert = mapper.insert(surveyReply);
			session.commit();
		} finally {
			session.close();
		}
		return insert;
	}

	@Override
	public List<SurveyReply> selectAvgBySurveyItem(String foodtruckId) {
		SqlSession session = factory.openSession();
		List<SurveyReply> replies = new ArrayList<>();
		try {
			SurveyReplyMapper mapper = session.getMapper(SurveyReplyMapper.class);
			replies = mapper.selectAvgBySurveyItem(foodtruckId);
			session.commit();
		} finally {
			session.close();
		}
		return replies;
	}

	@Override
	public List<SurveyReply> selectBySurveyId(String surveyId) {
		SqlSession session = factory.openSession();
		List<SurveyReply> replies = new ArrayList<>();
		try {
			SurveyReplyMapper mapper = session.getMapper(SurveyReplyMapper.class);
			replies = mapper.selectBySurveyId(surveyId);
			session.commit();
		} finally {
			session.close();
		}
		return replies;
	}
}
