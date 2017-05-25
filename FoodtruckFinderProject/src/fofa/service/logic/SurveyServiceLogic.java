package fofa.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fofa.domain.Survey;
import fofa.domain.SurveyReply;
import fofa.service.SurveyService;
import fofa.store.SurveyReplyStore;
import fofa.store.SurveyStore;

@Service
public class SurveyServiceLogic implements SurveyService{
	
	@Autowired
	private SurveyStore surveyStore;
	@Autowired
	private SurveyReplyStore replyStore;

	@Override
	public boolean register(Survey survey) {
		String surveyId = surveyStore.insert(survey);
		List<SurveyReply> replies = survey.getReplies();
		for(SurveyReply reply : replies){
			reply.setSurveyId(surveyId);
			replyStore.insert(reply);
		}
		
		return !surveyId.equals("");
	}

	@Override
	public List<Survey> findByTruckId(String foodtruckId) {
		return surveyStore.selectByTruckId(foodtruckId);
	}

	@Override
	public List<Survey> findAvgByAges(String foodtruckId, String itemId) {
		return surveyStore.selectAvgByAges(foodtruckId, itemId);
	}

	@Override
	public List<Survey> findAvgByGender(String foodtruckId, String itemId) {
		return surveyStore.selectAvgByGender(foodtruckId, itemId);
	}

	@Override
	public List<SurveyReply> findAvgScoreBySurveyItem(String foodtruckId) {
		return replyStore.selectAvgBySurveyItem(foodtruckId);
	}

}
