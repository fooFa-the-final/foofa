package fofa.store;
import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import fofa.domain.Follow;
import fofa.domain.Member;
import fofa.domain.Review;
import fofa.store.logic.FollowStoreLogic;
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
		assertEquals("nacho트럭", review.getFoodtruck().getFoodtruckName());
	}

	@Test
	public void testSelectByMemberId() {
		List<Review> list = store.selectByMemberId("momo");
		for(Review r : list)
			System.out.println(r);
		assertEquals(0, list.size());
	}

	@Test
	public void testSelectByTruckId() {
		List<Review> review = store.selectByTruckId("F1");
		assertEquals(2,review.size());
	}

	@Test
	public void testSelectByFromId(){
		FollowStore fStore = new FollowStoreLogic();
		List<Follow> list = fStore.selectByFromId("momo");
		for(Follow f : list)
			System.out.println(f.getToId());
		assertEquals(3, list.size());
		List<Review> reviewList = new ArrayList<>();
		for(Follow f : list){
			reviewList.addAll(store.selectByMemberId(f.getToId()));
		}
		System.out.println(reviewList.size());
	}
	@Test
	public void testSelectByRecommand() {
		
	}

}
