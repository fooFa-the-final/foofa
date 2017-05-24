package fofa.domain;

import java.util.List;

public class Foodtruck {
	
	private String foodtruckId;
	private String sellerId;
	private String foodtruckName;
	private List<Image> images;
	private List<Menu> menus;
	private String spot;
	private String operationTime;
	private String notice;
	private String category1;
	private String category2;
	private String categery3;
	private String location;
	private boolean state;
	private boolean card;
	private boolean drinking;
	private boolean parking;
	private boolean catering;
	private List<Review> reviews;
	private int favoriteCount;
	
	
	public String getFoodtruckId() {
		return foodtruckId;
	}
	public void setFoodtruckId(String foodtruckId) {
		this.foodtruckId = foodtruckId;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getFoodtruckName() {
		return foodtruckName;
	}
	public void setFoodtruckName(String foodtruckName) {
		this.foodtruckName = foodtruckName;
	}
	public List<Image> getImages() {
		return images;
	}
	public void setImages(List<Image> images) {
		this.images = images;
	}
	public List<Menu> getMenus() {
		return menus;
	}
	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}
	public String getSpot() {
		return spot;
	}
	public void setSpot(String spot) {
		this.spot = spot;
	}
	public String getOperationTime() {
		return operationTime;
	}
	public void setOperationTime(String operationTime) {
		this.operationTime = operationTime;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getCategery3() {
		return categery3;
	}
	public void setCategery3(String categery3) {
		this.categery3 = categery3;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public boolean isState() {
		return state;
	}
	public void setState(boolean state) {
		this.state = state;
	}
	public boolean isCard() {
		return card;
	}
	public void setCard(boolean card) {
		this.card = card;
	}
	public boolean isDrinking() {
		return drinking;
	}
	public void setDrinking(boolean drinking) {
		this.drinking = drinking;
	}
	public boolean isParking() {
		return parking;
	}
	public void setParking(boolean parking) {
		this.parking = parking;
	}
	public boolean isCatering() {
		return catering;
	}
	public void setCatering(boolean catering) {
		this.catering = catering;
	}
	public List<Review> getReviews() {
		return reviews;
	}
	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}
	public int getFavoriteCount() {
		return favoriteCount;
	}
	public void setFavoriteCount(int favoriteCount) {
		this.favoriteCount = favoriteCount;
	}
	
//	public float getReviewScore(){
//		
//	}
	
	public int getReviewCount(){
		return reviews.size();
	}
	
	

}
