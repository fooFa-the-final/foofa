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
			mapper.insert(advertise);
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
	public int update(Advertise advertise) {
		SqlSession session = factory.openSession();
		try {
			Advertise adv1 = advertise;

			AdvertiseMapper mapper = session.getMapper(AdvertiseMapper.class);
			sucess = mapper.update(advertise);
			session.commit();

			if (adv1 != advertise) {
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
	public List<Advertise> selectByAsc(Boolean approve) {
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
	public List<Advertise> selectByDesc(Boolean approve) {
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

}

// @Override
// public List<Advertise> selectByDesc(String approve) {
// // TODO Auto-generated method stub
// return null;
// }

// @Override
// public List<Advertise> selectByAsc(String approve) {
// List<Advertise> list = null;
// SqlSession session = factory.openSession();
// if (approve == "1") {
// AdvertiseMapper mapper = session.getMapper(AdvertiseMapper.class);
// list = mapper.selectByAsc(approve);
// }
// if (approve == "0") {
// AdvertiseMapper mapper = session.getMapper(AdvertiseMapper.class);
// list = mapper.selectByAsc(approve);
// }
// return list;
// }
