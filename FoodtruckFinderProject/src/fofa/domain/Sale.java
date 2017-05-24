package fofa.domain;

import java.sql.Date;

public class Sale {

	private String location;
	private String foodtruckId;
	private Date date;
	
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
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
	private int revenue;
	private String salesId;
}
