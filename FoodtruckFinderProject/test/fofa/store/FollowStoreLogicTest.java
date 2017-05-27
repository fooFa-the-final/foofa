package fofa.store;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;

import fofa.domain.Follow;
import fofa.store.logic.FollowStoreLogic;

public class FollowStoreLogicTest {
	
	private FollowStore store= new FollowStoreLogic();
	
	
//	@Test
//	public void testinset(){
//		Follow follow = new Follow();
//		follow.setFromId("mina");
//		follow.setToId("momo");
//		
//		assertEquals(1, store.insert(follow));
//		
//	}

//	@Test
//	public void deleteTest() {
//		Follow m = new Follow();
//		m.setToId("momo");
//		m.setFromId("mina");
//		int delete = store.delete(m);
//		assertEquals(1, delete);
//	}
//	
	
	@Test
	public void testselectFrom(){
		List<Follow> m = store.selectByFromId("momo");
		assertEquals(2, m.size());
	}
	
//	@Test
//	public void testselectto(){
//		List<Follow> m = store.selectByToId("momo");
//		assertEquals(3, m.size());
//	}
	
}
