package fofa.store;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import fofa.domain.SurveyItem;
import fofa.store.logic.SurveyItemStoreLogic;

public class SurveyItemStoreLogicTest {
	
	private SurveyItemStoreLogic store;
	
	@Before
	public void init(){
		store = new SurveyItemStoreLogic();
	}

	@Test
	public void testInsert() {
		
		int insert = store.insert("다음에 다시 방문할 의사가 있나요?");
		assertTrue(insert>0);
	}

	@Test
	public void testUpdate() {
		SurveyItem item = new SurveyItem();
		item.setItemId("I2");
		item.setQuestion("음식은 맛있었나요?");
		
		int update = store.update(item);
		assertTrue(update>0);
	}

	@Test
	public void testDelete() {
		int delete = store.delete("I5");
		assertTrue(delete>0);
	}

	@Test
	public void testSelectAll() {
		assertEquals(4, store.selectAll().size());
	}

}
