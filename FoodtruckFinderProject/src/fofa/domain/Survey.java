package fofa.domain;

import java.util.List;

public class Survey {

	private String surveyId;
	private String foodtruckId;
	private int ages;
	private char gender;
	private String suggestion;
	private List<SurveyReply> replies;
	
	public String getSurveyId() {
		return surveyId;
	}
	public void setSurveyId(String surveyId) {
		this.surveyId = surveyId;
	}
	public String getFoodtruckId() {
		return foodtruckId;
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
