package fofa.domain;

import org.springframework.stereotype.Component;

@Component
public class Sale {

	private String location;
	private String foodtruckId;
	private String date;
	private int revenue;
	private String salesId;

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getFoodtruckId() {
		return foodtruckId;
	}

	public void setFoodtruckId(String foodtruckId) {
		this.foodtruckId = foodtruckId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getRevenue() {
		return revenue;
	}

	public void setRevenue(int revenue) {
		this.revenue = revenue;
	}

	public String getSalesId() {
		return salesId;
	}

	public void setSalesId(String salesId) {
		this.salesId = salesId;
	}
}
