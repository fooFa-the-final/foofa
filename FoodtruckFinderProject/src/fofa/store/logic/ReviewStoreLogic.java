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
	public String insert(Review review) {
		SqlSession session = factory.openSession();
		String insert = "";
		try{
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			mapper.insert(review);
			insert = review.getReviewId();
			session.commit();
		} finally {
			session.close();
		} 
		System.out.println("reviewId : " + insert);
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
			delete = mapper.delete(reviewId);
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
			for(Review r : review){
				r.setRecommand(r.getRecommand());
			}
		} finally {
			session.close();
		} 
		return review;
	}

	@Override
	public List<Review> selectByFromId(String fromId) {
		SqlSession session = factory.openSession();
		List<Review> review = null;
		try{
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			review = mapper.selectByFromId(fromId);

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
		SqlSession session = factory.openSession();
		List<Review> review = null;
		try{
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			review = mapper.selectByRecommand();

		} finally {
			session.close();
		} 
		return review;
	}
	@Override
	public double avgScore(String foodtruckId) {
		SqlSession session = factory.openSession();
		double score = 0;
		try{
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			score = mapper.avgScore(foodtruckId);

		} finally {
			session.close();
		} 
		return score;
	}
	@Override
	public int selectTruckCount(String foodtruckId) {
		SqlSession session = factory.openSession();
		int count = 0;
		try{
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			count = mapper.selectTruckCount(foodtruckId);

		} finally {
			session.close();
		} 
		return count;
	}
	@Override
	public int selectMemberCount(String foodtruckId) {
		SqlSession session = factory.openSession();
		int count = 0;
		try{
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			count = mapper.selectMemberCount(foodtruckId);

		} finally {
			session.close();
		} 
		return count;
	}
	@Override
	public Review selectMainReview() {
		SqlSession session = factory.openSession();
		Review review = new Review();
		try{
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			review = mapper.selectMainReview();

		} finally {
			session.close();
		} 
		return review;
	}
}
