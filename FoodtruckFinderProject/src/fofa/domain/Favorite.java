package fofa.domain;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;

@XmlRootElement(name="favorite")
@XmlAccessorType(XmlAccessType.FIELD)
@Component
public class Favorite {

	private String foodtruckId;
	private String memberId;
	
	
	public String getFoodtruckId() {
		return foodtruckId;
	}
	public void setFoodtruckId(String foodtruckId) {
		this.foodtruckId = foodtruckId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "Favorite [foodtruckId=" + foodtruckId + ", memberId=" + memberId + "]";
	}
	
	
	
	
	
}
