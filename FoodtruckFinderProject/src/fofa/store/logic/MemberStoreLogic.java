package fofa.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import fofa.domain.Member;
import fofa.store.MemberStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.MemberMapper;

@Repository
public class MemberStoreLogic implements MemberStore{
	private SqlSessionFactory factory;
	
	public MemberStoreLogic(){
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public int insert(Member member) {
		SqlSession session = factory.openSession();
		int insert = 0;
		try{
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			insert = mapper.insert(member);
			session.commit();
		}finally{
			session.close();
		}
		
		return insert;
	}

	@Override
	public int update(Member member) {
		SqlSession session = factory.openSession();
		int update = 0;
		try{
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			update = mapper.update(member);
			session.commit();
		}finally{
			session.close();
		}
		
		return update;
	}

	@Override
	public int delete(String memberId) {
		SqlSession session = factory.openSession();
		int delete = 0;
		try{
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			delete = mapper.delete(memberId);
			session.commit();
		}finally{
			session.close();
		}
		return delete;
	}

	@Override
	public Member select(String memberId) {
		SqlSession session = factory.openSession();
		Member member = null;
		
		try{
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			member = mapper.select(memberId);
		}finally{
			session.close();
		}
		return member;
	}

}
