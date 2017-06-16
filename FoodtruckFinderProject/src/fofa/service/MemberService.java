package fofa.service;

import fofa.domain.Member;

public interface MemberService {

	
	boolean register(Member member);
	boolean modify(Member member);
	boolean remove(String memberId);
	boolean checkId(String memberId);
	boolean checkPw(String memberId, String password);
	Member findById(String memberId);
	boolean modifyImg(Member member);
	boolean mobileupdate(Member member);
	
}
