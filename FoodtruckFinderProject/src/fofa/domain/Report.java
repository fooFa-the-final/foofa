package fofa.domain;

import org.springframework.stereotype.Component;

@Component
public class Report {
	private String reviewId;
	private String reason;
	private String memberId;
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "Report [reviewId=" + reviewId + ", reason=" + reason + ", memberId=" + memberId + "]";
	}
	
	
}

