package fofa.store.mapper;

import java.util.List;

import fofa.domain.Review;

public interface ReviewMapper {
	void insert(Review review);
	void update(Review review);
	void delete(String reviewId);
	Review selectById(String reviewId);
	List<Review> selectByMemberId(String memberId);
	List<Review> selectByTruckId(String foodtruckId);
	List<Review> selectByRecommand();
}
