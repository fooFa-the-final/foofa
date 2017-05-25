package fofa.store;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import fofa.domain.Member;
import fofa.domain.Review;
import fofa.store.logic.ReviewStoreLogic;

public class ReviewStoreLogicTest {

	private ReviewStore store;
	
	@Before
	public void setUp(){
		store = new ReviewStoreLogic();
	}
	@Test
	public void testInsert() {
		Review review = new Review();
		review.setContents("짱짱");
		review.setFoodtruckId("F11");
		review.setReviewId("R01");
		review.setScore(5);
		Member m = new Member();
		m.setMemberId("momo");
		review.setWriter(m);
		int insert = store.insert(review);
		assertEquals(1, insert);
	}

	@Test
	public void testUpdate() {
		Review review = new Review();
		review.setContents("사실 맛없는데 맛있다고 해준거");
		review.setFoodtruckId("F11");
		review.setReviewId("R01");
		review.setScore(1);
		Member m = new Member();
		m.setMemberId("momo");
		review.setWriter(m);
		int update = store.update(review);
		assertEquals(1, update);
	}

	@Test
	public void testDelete() {
		
		int delete = store.delete("R4");
		assertEquals(1, delete);
	}

	@Test
	public void testSelectById() {
		Review review = store.selectById("R1");
		assertEquals("F1",review.getFoodtruckId());
	}

	@Test
	public void testSelectByMemberId() {
		Review review = store.selectById("R1");
		List<Review> list = store.selectByMemberId("momo");
		assertEquals(1, list.size());
	}

	@Test
	public void testSelectByTruckId() {
		List<Review> review = store.selectByTruckId("F1");
		assertEquals(2,review.size());
	}

	@Test
	public void testSelectByRecommand() {
		
	}

}
