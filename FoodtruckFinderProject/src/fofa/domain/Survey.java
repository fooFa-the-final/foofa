package fofa.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;

@XmlRootElement(name="survey")
@XmlAccessorType(XmlAccessType.FIELD)
@Component
public class Survey {

	private String surveyId;
	private String foodtruckId;
	private int ages;
	private int count;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	private char gender;
	private String suggestion;
	private List<SurveyReply> replies;
	private float score;
	
	public String getSurveyId() {
		return surveyId;
	}
	
	@Override
	public String toString() {
		return "Survey [surveyId=" + surveyId + ", foodtruckId=" + foodtruckId + ", ages=" + ages + ", count=" + count
				+ ", gender=" + gender + ", suggestion=" + suggestion + ", replies=" + replies + ", score=" + score
				+ "]";
	}
	public void setSurveyId(String surveyId) {
		this.surveyId = surveyId;
	}
	public String getFoodtruckId() {
		return foodtruckId;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public void setFoodtruckId(String foodtruckId) {
		this.foodtruckId = foodtruckId;
	}
	public int getAges() {
		return ages;
	}
	public void setAges(int ages) {
		this.ages = ages;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public String getSuggestion() {
		return suggestion;
	}
	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}
	public List<SurveyReply> getReplies() {
		return replies;
	}
	public void setReplies(List<SurveyReply> replies) {
		this.replies = replies;
	}
}
