package fofa.store.mapper;

import java.util.List;

import fofa.domain.Survey;

public interface SurveyMapper {
	public int insert(Survey survey);
	public List<Survey> selectByTruckId(String foodtruckId);
	public List<Survey> selectAvgByAges(String foodtruckId);
	public List<Survey> selectAvgByGender(String foodtruckId);
}
