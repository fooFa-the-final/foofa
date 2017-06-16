package fofa.service;

import java.util.List;

import fofa.domain.Image;
import fofa.domain.Recommand;
import fofa.domain.Report;
import fofa.domain.Review;

public interface ReviewService {
	String register(Review review);
	String registerImage(Image image);
	boolean modify(Review review);
	boolean remove(String reviewId);
	Review findById(String reviewId);
	List<Review> findByMemberId(String memberId);
	List<Review> findByFromId(String memberId);
	List<Review> findByTruckId(String foodtruckId);
	List<Review> findByRecommand();
	List<Review> findAllByReported();
	boolean registerReport(Report report);
	boolean removeReport(String reviewId);
	List<Report> findReport(String reviewId);
	boolean registerRecommand(Recommand recommand);
	boolean deleteRecommand(Recommand recommand);
	Review findMainReview();
}
