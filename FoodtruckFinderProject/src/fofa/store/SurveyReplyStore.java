package fofa.store;

import java.util.List;

import fofa.domain.SurveyReply;

public interface SurveyReplyStore {

	public int insert(SurveyReply surveyReply);
	public List<SurveyReply> selectAvgBySurveyItem(String foodtruckId);
	public List<SurveyReply> selectBySurveyId(String surveyId);

}
