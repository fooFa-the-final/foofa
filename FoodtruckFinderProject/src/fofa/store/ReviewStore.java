package fofa.store;

import java.util.List;

import fofa.domain.Review;

public interface ReviewStore {
	String insert(Review review);
	int update(Review review);
	int delete(String reviewId);
	Review selectById(String reviewId);
	List<Review> selectByMemberId(String memberId);
	List<Review> selectByTruckId(String foodtruckId);
	List<Review> selectByRecommand();
	double avgScore(String foodtruckId);
	int selectTruckCount(String foodtruckId);
	List<Review> selectByFromId(String fromId);
	int selectMemberCount(String foodtruckId);
}

