package fofa.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;

import fofa.domain.Review;
import fofa.store.ReviewStore;
import fofa.store.factory.SqlSessionFactoryProvider;

public class ReviewStoreLogic implements ReviewStore {
	private SqlSessionFactory factory;
	
	public ReviewStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	@Override
	public int insert(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String reviewId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Review selectById(String reviewId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> selectByMemberId(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> selectByTruckId(String foodtruckId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> selectByRecommand() {
		// TODO Auto-generated method stub
		return null;
	}

}
