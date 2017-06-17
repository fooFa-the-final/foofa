package fofa.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;

@XmlRootElement(name="surveyItems")
@XmlAccessorType(XmlAccessType.FIELD)
@Component
public class SurveyItems {
	
	@XmlElement(name="surveyItem")
	private List<SurveyItem> surveyItems;

	public List<SurveyItem> getSurveyItems() {
		return surveyItems;
	}

	public void setSurveyItems(List<SurveyItem> surveyItems) {
		this.surveyItems = surveyItems;
	}
	
	
}
