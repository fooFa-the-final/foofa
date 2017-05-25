package fofa.controller;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Test;

import fofa.domain.Member;
import fofa.store.MemberStore;
import fofa.store.logic.MemberStoreLogic;

public class MemberStoreLogicTest {
	
private MemberStore store = new MemberStoreLogic();

@Test
public void testMemberInsert(){
	Member member = new Member();
	
	member.setMemberId("aaaa");
	member.setPassword("1234");
	member.setEmail("1234");
	member.setProfileImg("1234");
	
	assertEquals(1, store.insert(member));
	}


@Test
public void testMemberdelete(){
	
	
}

}
