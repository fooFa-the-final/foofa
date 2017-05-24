package fofa.domain;

import java.util.List;

public class Review {
	private String reviewId;
	private String foodtruckId;
	private String contents;
	private int score;
	private List<Image> images;
	private Member writer;
	private int recommand;
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public String getFoodtruckId() {
		return foodtruckId;
	}
	public void setFoodtruckId(String foodtruckId) {
		this.foodtruckId = foodtruckId;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public List<Image> getImages() {
		return images;
	}
	public void setImages(List<Image> images) {
		this.images = images;
	}
	public Member getWriter() {
		return writer;
	}
	public void setWriter(Member writer) {
		this.writer = writer;
	}
	public int getRecommand() {
		return recommand;
	}
	public void setRecommand(int recommand) {
		this.recommand = recommand;
	}
	@Override
	public String toString() {
		return "Review [reviewId=" + reviewId + ", foodtruckId=" + foodtruckId + ", contents=" + contents + ", score="
				+ score + ", images=" + images + ", writer=" + writer + ", recommand=" + recommand + "]";
	}
	
	
}
