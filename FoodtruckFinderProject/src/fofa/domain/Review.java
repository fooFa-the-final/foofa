package fofa.domain;

import java.sql.Date;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;

import fofa.store.RecommandStore;
import fofa.store.logic.RecommandStoreLogic;

@XmlRootElement(name="review")
@XmlAccessorType(XmlAccessType.FIELD)
@Component
public class Review {
	private String reviewId;
	private Foodtruck foodtruck;
	private String contents;
	private int score;
	private List<Image> images;
	private Member writer;
	private int recommand;
	private Date writeDate;

	public String getReviewId() {
		return reviewId;
	}

	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}

	public Foodtruck getFoodtruck() {
		return foodtruck;
	}

	public void setFoodtruck(Foodtruck foodtruck) {
		this.foodtruck = foodtruck;
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
		RecommandStore store = new RecommandStoreLogic();
		this.recommand = store.selectReviewCount(reviewId);
		return recommand;
	}

	public void setRecommand(int recommand) {
		this.recommand = recommand;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	public Image getMainImage(){
		if(this.images.size()==0){
			Image image = new Image();
			image.setFilename("noimagefound.jpg");
			return image;
		}
		return this.images.get(0);
	}

	@Override
	public String toString() {
		return "Review [reviewId=" + reviewId + ", foodtruck=" + foodtruck + ", contents=" + contents + ", score="
				+ score + ", images=" + images + ", writer=" + writer + ", recommand=" + recommand + ", writeDate="
				+ writeDate + "]";
	}
	
}
