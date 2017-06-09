package fofa.controller;

import static org.junit.Assert.*; 

import java.util.Date;

import org.junit.Test;

import fofa.domain.Member;
import fofa.domain.Report;
import fofa.service.MemberService;
import fofa.service.logic.MemberServiceLogic;
import fofa.store.MemberStore;
import fofa.store.logic.MemberStoreLogic;

public class MemberStoreLogicTest {
	
private MemberStore store = new MemberStoreLogic();
//@Test
//public void testMemberInsert(){
//	Member member = new Member();
//	member.setMemberId("3232");
//	member.setPassword("1234");
//	member.setBirthday("19930212");
//	member.setEmail("1234");
//	member.setProfileImg("1234");
//	
//	assertEquals(1, store.insert(member));
//	}

//@Test
//public void deleteTest() {
//	Member m = new Member();
//	int delete = store.delete("1");
//	assertEquals(1, delete);
//}



//@Test
//public void selectTest(){
//	Member select = store.select("momo");
//	System.out.println(select);
//}

  @Test
  public void imgTest(){
	  MemberService service = new MemberServiceLogic();
	  Member m = store.select("sana");
	  System.out.println("update 전" + m.toString());
	  m.setProfileImg("profile1.jpg");
	  System.out.println("update 후 " +m.toString());;
	  System.out.println("update 후 " +service.modifyImg(m));
	  assertTrue(service.modifyImg(m));
  }

}
