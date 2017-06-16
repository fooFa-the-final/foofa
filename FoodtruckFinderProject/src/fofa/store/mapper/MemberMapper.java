package fofa.store.mapper;

import fofa.domain.Member;

public interface MemberMapper {

	int insert(Member member);
	int update(Member member);
	int delete(String memberId);
	Member select(String memberId);
	int imgupdate(Member member);
	int mobileupdate(Member member);

}
