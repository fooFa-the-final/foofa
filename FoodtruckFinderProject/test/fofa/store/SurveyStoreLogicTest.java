package fofa.store;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import fofa.domain.Survey;
import fofa.domain.SurveyReply;
import fofa.store.logic.SurveyReplyStoreLogic;
import fofa.store.logic.SurveyStoreLogic;

public class SurveyStoreLogicTest {
	
	private SurveyStoreLogic surveyStore;
	private SurveyReplyStoreLogic replyStore;
	
	@Before
	public void init() {
		surveyStore = new SurveyStoreLogic();
		
	}

	@Test
	public void testInsert() {
		
		Survey survey = new Survey();
		survey.setFoodtruckId("F1");
		survey.setAges(20);
		survey.setGender('F');
		survey.setSuggestion("음료가 있었으면 좋겠어요.");
		
		String surveyId = surveyStore.insert(survey);
		
		List<SurveyReply> replies = new ArrayList<SurveyReply>();
		for(int i=1; i<5; i++){
			SurveyReply r = new SurveyReply();
			r.setSurveyId(surveyId);
			r.setItemId("I"+i);
			r.setScore(i);
			
			replyStore.insert(r);
		}
		survey.setReplies(replies);
		
		assertEquals(4, replies.size());
		System.out.println(surveyId);
		
	}

	@Test
	public void testSelectByTruckId() {
		List<Survey> surveies = surveyStore.selectByTruckId("F1");
		
		assertEquals(6,surveies.size());
	}

	@Test
	public void testSelectAvgByAges() {
		surveyStore.selectAvgByAges("F1", "I1");
		
	}

	@Test
	public void testSelectAvgByGender() {
		surveyStore.selectAvgByGender("F1", "I1");
		
	}

}
