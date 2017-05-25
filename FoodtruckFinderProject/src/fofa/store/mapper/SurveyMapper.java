package fofa.store.mapper;

import java.util.List;
import java.util.Map;

import fofa.domain.Survey;

public interface SurveyMapper {
	public void insert(Survey survey);
	public List<Survey> selectByTruckId(String foodtruckId);
	public List<Survey> selectAvgByAges(Map<String, String> params);
	public List<Survey> selectAvgByGender(Map<String, String> params);
}
