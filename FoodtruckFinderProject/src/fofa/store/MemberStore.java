package fofa.store;

import fofa.domain.Member;

public interface MemberStore {

	int insert(Member member);
	int update(Member member);
	int delete(String memberId);
	Member select(String memberId);
	int imgupdate(Member member);
}

