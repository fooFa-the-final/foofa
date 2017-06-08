package fofa.service.logic;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fofa.domain.Follow;
import fofa.domain.Image;
import fofa.domain.Recommand;
import fofa.domain.Report;
import fofa.domain.Review;
import fofa.service.ReviewService;
import fofa.store.FollowStore;
import fofa.store.ImageStore;
import fofa.store.RecommandStore;
import fofa.store.ReportStore;
import fofa.store.ReviewStore;

@Service
public class ReviewServiceLogic implements ReviewService {

	@Autowired
	private ReviewStore reviewStore;
		
	@Autowired
	private ReportStore reportStore;
	
	@Autowired
	private RecommandStore recommandStore;
	
	@Autowired
	private ImageStore imageStore;
	
	@Override
	public String register(Review review) {
		String reviewId = reviewStore.insert(review);
		for(Image image : review.getImages()){
			imageStore.insertImage(reviewId, image);
		}
		return reviewId;
	}

	@Override
	public boolean modify(Review review) {
		return reviewStore.update(review) > 0;
	}

	@Override
	public boolean remove(String reviewId) {
		return reviewStore.delete(reviewId) > 0;
	}

	@Override
	public Review findById(String reviewId) {
		return reviewStore.selectById(reviewId);
	}

	@Override
	public List<Review> findByMemberId(String memberId) {
		return reviewStore.selectByMemberId(memberId);
	}

	@Override
	public List<Review> findByFromId(String memberId) {
		List<Review> reviewList = reviewStore.selectByFromId(memberId);
		return reviewList;
	}

	@Override
	public List<Review> findByTruckId(String foodtruckId) {
		return reviewStore.selectByTruckId(foodtruckId);
	}

	@Override
	public List<Review> findByRecommand() {
		return reviewStore.selectByRecommand();
	}

	@Override
	public List<Review> findAllByReported() {
		List<Report> reportList = reportStore.selectAll();
		HashSet<String> hs = new HashSet<>();
		for(Report r: reportList){
			hs.add(r.getReviewId());
		}
		List<Review> list = new ArrayList<>();
		for(String r : hs){
			list.add(reviewStore.selectById(r));
		}
		
		return list;
	}

	@Override
	public boolean registerReport(Report report) {
		return reportStore.insert(report) > 0;
	}

	@Override
	public List<Report> findReport(String reviewId) {
		return reportStore.selectById(reviewId);
	}

	@Override
	public boolean registerRecommand(Recommand recommand) {
		return recommandStore.insert(recommand) > 0;
	}

	@Override
	public boolean deleteRecommand(Recommand recommand) {
		return recommandStore.delete(recommand) > 0;
	}

	@Override
	public boolean removeReport(String reviewId) {
		return reportStore.delete(reviewId) > 0;
	}
}
