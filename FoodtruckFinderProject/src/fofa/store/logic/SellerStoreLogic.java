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

	int sucess= 0;

	public SellerStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public int insert(Seller seller) {
		SqlSession session = factory.openSession();
		int insert = 0;
		try {
			SellerMapper mapper = session.getMapper(SellerMapper.class);
			insert = mapper.insert(seller);
			session.commit();
		} finally {
			session.close();
		}
		return insert;
	}

	@Override
	public int update(Seller seller) {
		SqlSession session = factory.openSession();
		try {
			
			
			
			SellerMapper mapper = session.getMapper(SellerMapper.class);
			Seller seller1 = mapper.select(seller.getSellerId());

			
			sucess = mapper.update(seller);
			session.commit();
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
			session.commit();

//			Seller seller = mapper.select(id);
			sucess = mapper.delete(id);
			session.commit();

//			if (seller != null) {
//				sucess = 1;
//			} else {
//				sucess = 0;
//			}
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
			session.commit();
		} finally {
			session.close();
		}
		return seller;
	}

}
