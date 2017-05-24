package fofa.service;

import java.util.List;

import fofa.domain.Recommand;
import fofa.domain.Report;
import fofa.domain.Review;

public interface ReviewService {
	boolean register(Review review);
	boolean modify(Review review);
	boolean remove(String reviewId);
	Review findById(String reivewId);
	List<Review> findByMemberId(String memberId);
	List<Review> findByFromId(String memberId);
	List<Review> findByTruckId(String foodtruckId);
	List<Review> findByRecommand();
	List<Review> findAllByReported();
	boolean registerReport(Report report);
	Report findReport(String reportId);
	boolean registerRecommand(Recommand recommand);
	boolean deleteRecommand(Recommand recommand);
}
