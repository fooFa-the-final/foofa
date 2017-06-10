package fofa.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;

@XmlRootElement(name="foodtrucks")
@XmlAccessorType(XmlAccessType.FIELD)
@Component
public class Foodtrucks {
	@XmlElement(name="foodtruck")
	private List<Foodtruck> foodtrucks;

	public List<Foodtruck> getFoodtrucks() {
		return foodtrucks;
	}

	public void setFoodtrucks(List<Foodtruck> foodtrucks) {
		this.foodtrucks = foodtrucks;
	}
}
