package fofa.service;

import java.util.List;

import fofa.domain.SurveyItem;

public interface SurveyItemService {
	
	public boolean register(String question);
	public boolean modify(SurveyItem surveyItem);
	public boolean remove(String surveyItemId);
	public List<SurveyItem> findAll();

}
