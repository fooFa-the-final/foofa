package fofa.store.mapper;

import java.util.List;

import fofa.domain.Review;

public interface ReviewMapper {
	int insert(Review review);
	int update(Review review);
	int delete(String reviewId);
	Review selectById(String reviewId);
	List<Review> selectByMemberId(String memberId);
	List<Review> selectByTruckId(String foodtruckId);
	List<Review> selectByRecommand();
	double avgScore(String foodtruckId);
	int selectTruckCount(String foodtruckId);
}
