package fofa.service.logic;

import fofa.domain.Member;
import fofa.service.MemberService;
import fofa.store.MemberStore;

public class MemberServiceLogic implements MemberService{
	private MemberStore store;
	
	
	@Override
	public boolean register(Member member) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modify(Member member) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(String memberId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkId(String memberId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkPw(String memberId, String password) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Member findById(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

}
