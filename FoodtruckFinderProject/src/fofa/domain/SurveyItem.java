package fofa.domain;

import org.springframework.stereotype.Component;

@Component
public class SurveyItem {

	private String itemId;
	private String question;
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
}
