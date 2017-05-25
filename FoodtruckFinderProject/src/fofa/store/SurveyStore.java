package fofa.store;

import java.util.List;

import fofa.domain.Survey;

public interface SurveyStore {

	public int insert(Survey survey);
	public List<Survey> selectByTruckId(String foodtruckId);
	public List<Survey> selectAvgByAges(String foodtruckId, String itemId);
	public List<Survey> selectAvgByGender(String foodtruckId, String itemId);
}
