package fofa.service;

import java.util.List;

import fofa.domain.Survey;
import fofa.domain.SurveyReply;

public interface SurveyService {

	public boolean register(Survey survey);
	public List<Survey> findByTruckId(String foodtruckId);
	public List<Survey> findAvgByAges(String foodtruckId);
	public List<Survey> findAvgByGender(String foodtruckId, String itemId);
	public List<SurveyReply> findAvgScoreBySurveyItem(String foodtruckId);
	
}
