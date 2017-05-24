package fofa.store.mapper;

import java.util.List;

import fofa.domain.Survey;
import fofa.domain.SurveyItem;

public interface SurveyItemMapper {

	public int insert(String question);
	public int update(SurveyItem surveyItem);
	public int delete(String surveyItemId);
	public List<SurveyItem> selectAll();
}
