package fofa.service.logic;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fofa.domain.Follow;
import fofa.domain.Recommand;
import fofa.domain.Report;
import fofa.domain.Review;
import fofa.service.ReviewService;
import fofa.store.FollowStore;
import fofa.store.RecommandStore;
import fofa.store.ReportStore;
import fofa.store.ReviewStore;

@Service
public class ReviewServiceLogic implements ReviewService {

	@Autowired
	private ReviewStore reviewStore;
	
	@Autowired
	private FollowStore followStore;
	
	@Autowired
	private ReportStore reportStore;
	
	@Autowired
	private RecommandStore recommandStore;
	
	@Override
	public boolean register(Review review) {
		return reviewStore.insert(review) > 0;
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
		List<Follow> list = followStore.selectByFromId(memberId);
		System.out.println("follow list : " + list.size());
		List<Review> reviewList = new ArrayList<>();
		for(Follow f : list){
			reviewList.addAll(reviewStore.selectByMemberId(f.getToId()));
		}
		System.out.println(reviewList.size());
		return reviewList;
	}

	@Override
	public List<Review> findByTruckId(String foodtruckId) {
		return reviewStore.selectByTruckId(foodtruckId);
	}

	@Override
	public int findByRecommand(String reviewId) {
		return recommandStore.selectReviewCount(reviewId);
	}

	@Override
	public List<Review> findAllByReported() {
		List<Report> reportList = reportStore.selectAll();
		List<Review> list = new ArrayList<>();
		for(Report r : reportList){
			list.add(reviewStore.selectById(r.getReviewId()));
		}
		return list;
	}

	@Override
	public boolean registerReport(Report report) {
		return reportStore.insert(report) > 0;
	}

	@Override
	public Report findReport(Report report) {
		return reportStore.selectById(report);
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
	public boolean removeReport(Report report) {
		return reportStore.delete(report) > 0;
	}
}
