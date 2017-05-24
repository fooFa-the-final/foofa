package fofa.domain;

public class Recommand {
	private String reviewId;
	private String writerId;
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	@Override
	public String toString() {
		return "Recommand [reviewId=" + reviewId + ", writerId=" + writerId + "]";
	}
	
	
}

