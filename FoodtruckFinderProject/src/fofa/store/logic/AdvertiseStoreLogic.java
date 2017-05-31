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
			sucess = mapper.delete(advid);
			session.commit();

		} finally {
			session.close();
		}
		return sucess;
	}

	@Override
	public int insert(Advertise advertise) {
		SqlSession session = factory.openSession();
		try {
			AdvertiseMapper mapper = session.getMapper(AdvertiseMapper.class);
			sucess = mapper.insert(advertise);
			session.commit();

			if (advertise != null) {
				sucess = 1;
			} else {
				sucess = 0;
			}
		} finally {
			session.close();
		}
		return sucess;
	}

	@Override
	public int update(String advid) {
		SqlSession session = factory.openSession();
		int sucess = 0;
		try {
			AdvertiseMapper mapper = session.getMapper(AdvertiseMapper.class);
			sucess = mapper.update(advid);
			session.commit();
		} finally {
			session.close();
		}
		return sucess;
	}

	 @Override
	 public List<Advertise> selectByAsc(int approve) {
	 List<Advertise> list = null;
	 SqlSession session = factory.openSession();
	 try {
	 AdvertiseMapper mapper = session.getMapper(AdvertiseMapper.class);
	 list = mapper.selectByAsc(approve);
	 session.commit();
	
	 } finally {
	 session.close();
	 }
	 return list;
	 }

	 @Override
	 public List<Advertise> selectByDesc(int approve) {
	 List<Advertise> list = null;
	 SqlSession session = factory.openSession();
	 try {
	 AdvertiseMapper mapper = session.getMapper(AdvertiseMapper.class);
	 list = mapper.selectByDesc(approve);
	 session.commit();
	
	 } finally {
	 session.close();
	 }
	 return list;
	 }

	@Override
	public List<Advertise> selectNowAd() {
		List<Advertise> list = null;
		SqlSession session = factory.openSession();
		try {
			AdvertiseMapper mapper = session.getMapper(AdvertiseMapper.class);
			list = mapper.selectNowAd();
			session.commit();

		} finally {
			session.close();
		}
		return list;
	}


	@Override
	public List<Advertise> selectExpired() {
		SqlSession session = factory.openSession();
		List<Advertise> list = null;
		try{
			AdvertiseMapper mapper = session.getMapper(AdvertiseMapper.class);
			list = mapper.selectExpired();
		} finally {
			session.close();
		}
		return list;
	}

}
