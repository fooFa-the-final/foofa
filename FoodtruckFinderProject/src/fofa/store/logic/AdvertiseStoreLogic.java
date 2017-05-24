package fofa.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import fofa.domain.Advertise;
import fofa.store.AdvertiseStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.AdvertiseMapper;

@Repository
public class AdvertiseStoreLogic implements AdvertiseStore {

	private SqlSessionFactory factory;

	int sucess;
	
	public AdvertiseStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public int delete(String advid) {
		SqlSession session = factory.openSession();
		try {
			AdvertiseMapper mapper = session.getMapper(AdvertiseMapper.class);
			mapper.delete(advid);
		} finally {
			session.close();
		}
		return sucess;
	}
	
	@Override
	public int insert(Advertise advertise) {
		// TODO Auto-generated method stub
		return sucess;
	}
	
	@Override
	public List<Advertise> selectByAsc(Boolean approve) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Advertise> selectByDesc(Boolean approve) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int update(Advertise advertise) {
		// TODO Auto-generated method stub
		return sucess;
	}
	

	@Override
	public List<Advertise> selectNowAd() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
