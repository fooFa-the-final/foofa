package fofa.service.logic;

import java.util.List;

import fofa.domain.Recommand;
import fofa.domain.Report;
import fofa.domain.Review;
import fofa.service.ReviewService;

public class ReviewServiceLogic implements ReviewService {

	@Override
	public boolean register(Review review) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modify(Review review) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(String reviewId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Review findById(String reivewId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> findByMemberId(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> findByFromId(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> findByTruckId(String foodtruckId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> findByRecommand() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> findAllByReported() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean registerReport(Report report) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Report findReport(Report report) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean registerRecommand(Recommand recommand) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteRecommand(Recommand recommand) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeReport(Report report) {
		// TODO Auto-generated method stub
		return false;
	}

}
