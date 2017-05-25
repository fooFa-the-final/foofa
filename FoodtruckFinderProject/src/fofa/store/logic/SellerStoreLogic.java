package fofa.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import fofa.domain.Seller;
import fofa.store.SellerStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.SellerMapper;

@Repository
public class SellerStoreLogic implements SellerStore {

	private SqlSessionFactory factory;

	int sucess;

	public SellerStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public int insert(Seller seller) {
		SqlSession session = factory.openSession();
		try {
			SellerMapper mapper = session.getMapper(SellerMapper.class);
			mapper.insert(seller);
			if (seller != null) {
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
	public int update(Seller seller) {
		SqlSession session = factory.openSession();
		try {
			Seller seller1 = seller;

			SellerMapper mapper = session.getMapper(SellerMapper.class);
			sucess = mapper.update(seller);
			if (seller1 != seller) {
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
	public int delete(String id) {
		SqlSession session = factory.openSession();
		try {
			SellerMapper mapper = session.getMapper(SellerMapper.class);
			mapper.delete(id);
			Seller seller = mapper.select(id);
			if (seller != null) {
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
	public Seller select(String sellerId) {
		SqlSession session = factory.openSession();
		Seller seller = null;
		try {
			SellerMapper mapper = session.getMapper(SellerMapper.class);
			seller = mapper.select(sellerId);
		} finally {
			session.close();
		}
		return seller;
	}

}
