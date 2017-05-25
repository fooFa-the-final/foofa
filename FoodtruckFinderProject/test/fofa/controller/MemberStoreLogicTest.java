package fofa.controller;

import static org.junit.Assert.*; 

import java.util.Date;

import org.junit.Test;

import fofa.domain.Member;
import fofa.domain.Report;
import fofa.store.MemberStore;
import fofa.store.logic.MemberStoreLogic;

public class MemberStoreLogicTest {
	
private MemberStore store = new MemberStoreLogic();

//@Test
//public void testMemberInsert(){
//	Member member = new Member();
//	member.setMemberId("aaaa");
//	member.setPassword("1234");
//	member.setBirthday(null);
//	member.setEmail("1234");
//	member.setProfileImg("1234");
//	member.setGender('m');
//	
//	assertEquals(1, store.insert(member));
//	}

//@Test
//public void deleteTest() {
//	Member m = new Member();
//	m.setMemberId("d1");
//	int delete = store.delete("1");
//	assertEquals(1, delete);
//}



@Test
public void selectTest(){
	Member select = store.select("momo");
	System.out.println(select);
}


}
