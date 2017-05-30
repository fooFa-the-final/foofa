package fofa.service.logic;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fofa.domain.Member;
import fofa.service.MemberService;
import fofa.store.MemberStore;

@Service
public class MemberServiceLogic implements MemberService{
	
	@Autowired
	private MemberStore store;
	
	
	@Override
	public boolean register(Member member) {
		return store.insert(member)>0;
		
		
	}

	@Override
	public boolean modify(Member member) {
		int sucess;
		sucess = store.update(member);
		if(sucess ==0){
			return false;
		} else{
			return true;
		}
	}

	@Override
	public boolean remove(String memberId) {
	
		return store.delete(memberId) >0;
	}

	@Override
	public boolean checkId(String memberId) {
		Member member = store.select(memberId);
		if(member !=null){
		
			return true;
		}else{
			
		}
		return false;
	}

	@Override
	public boolean checkPw(String memberId, String password) {
		Member member = store.select(memberId);
		if(member != null){
			return true;
		}
		return false;
	}

	@Override
	public Member findById(String memberId) {
		Member member =store.select(memberId);
		return member;
	}

}
