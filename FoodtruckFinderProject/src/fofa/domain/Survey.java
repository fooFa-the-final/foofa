package fofa.domain;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Survey {

	private String surveyId;
	private String foodtruckId;
	private int ages;
	private char gender;
	private String suggestion;
	private List<SurveyReply> replies;
	private float score;
	
	public String getSurveyId() {
		return surveyId;
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
