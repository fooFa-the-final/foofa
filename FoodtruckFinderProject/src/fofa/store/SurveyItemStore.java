package fofa.store;

import java.util.List;

import fofa.domain.SurveyItem;

public interface SurveyItemStore {

	public int insert(String question);
	public int update(SurveyItem surveyItem);
	public int delete(String surveyItemId);
	public List<SurveyItem> selectAll();
}
