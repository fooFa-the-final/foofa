package fofa.domain;

import org.springframework.stereotype.Component;

@Component
public class Seller {

	private String sellerId;
	private String password;
	private String certification;
	private String phone;
	private Foodtruck foodtruck;
	
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCertification() {
		return certification;
	}
	public void setCertification(String certification) {
		this.certification = certification;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Foodtruck getFoodtruck() {
		return foodtruck;
	}
	public void setFoodtruck(Foodtruck foodtruck) {
		this.foodtruck = foodtruck;
	}
	
	
}
