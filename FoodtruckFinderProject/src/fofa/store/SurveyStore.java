package fofa.store;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import fofa.domain.Survey;

public interface SurveyStore {

	public String insert(Survey survey);
	public List<Survey> selectByTruckId(String foodtruckId);
	public List<Survey> selectAvgByAges(String foodtruckId, String itemId);
	public List<Survey> selectAvgByGender(@Param("foodtruckId")String foodtruckId, @Param("itemId")String itemId);
}
