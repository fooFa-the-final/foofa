package fofa.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fofa.domain.SurveyItem;
import fofa.service.SurveyItemService;
import fofa.store.SurveyItemStore;

@Service
public class SurveyItemServiceLogic implements SurveyItemService {
	
	@Autowired
	private SurveyItemStore itemStore;

	@Override
	public boolean register(String question) {
		return itemStore.insert(question)>0;
	}

	@Override
	public boolean modify(SurveyItem surveyItem) {
		return itemStore.update(surveyItem)>0;
	}

	@Override
	public boolean remove(String surveyItemId) {
		return itemStore.delete(surveyItemId)>0;
	}

	@Override
	public List<SurveyItem> findAll() {
		return itemStore.selectAll();
	}

}
