package fofa.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import fofa.domain.Review;
import fofa.store.ReviewStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.ReviewMapper;

@Repository
public class ReviewStoreLogic implements ReviewStore {
	private SqlSessionFactory factory;
	
	public ReviewStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	@Override
	public int insert(Review review) {
		SqlSession session = factory.openSession();
		int insert = 0;
		try{
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			insert = mapper.insert(review);
			session.commit();
		} finally {
			session.close();
		} 
		return insert;
	}

	@Override
	public int update(Review review) {
		SqlSession session = factory.openSession();
		int update = 0;
		try{
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			update = mapper.update(review);
			session.commit();
		} finally {
			session.close();
		} 
		return update;
	}

	@Override
	public int delete(String reviewId) {
		SqlSession session = factory.openSession();
		int delete = 0;
		try{
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			delete = mapper.delete(review);
			session.commit();
		} finally {
			session.close();
		} 
		return delete;
	}

	@Override
	public Review selectById(String reviewId) {
		SqlSession session = factory.openSession();
		Review review = null;
		try{
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			review = mapper.selectById(reviewId);

		} finally {
			session.close();
		} 
		return review;
	}

	@Override
	public List<Review> selectByMemberId(String memberId) {
		SqlSession session = factory.openSession();
		List<Review> review = null;
		try{
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			review = mapper.selectByMemberId(memberId);

		} finally {
			session.close();
		} 
		return review;
	}

	@Override
	public List<Review> selectByTruckId(String foodtruckId) {
		SqlSession session = factory.openSession();
		List<Review> review = null;
		try{
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			review = mapper.selectByTruckId(foodtruckId);

		} finally {
			session.close();
		} 
		return review;
	}

	@Override
	public List<Review> selectByRecommand() {
		// TODO Auto-generated method stub
		return null;
	}

}
