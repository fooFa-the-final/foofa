package fofa.domain;

public class Image {
	private String imageId;
	private String category;
	private String categoryId;
	private String filename;
	public String getImageId() {
		return imageId;
	}
	public void setImageId(String imageId) {
		this.imageId = imageId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	@Override
	public String toString() {
		return "Image [imageId=" + imageId + ", category=" + category + ", categoryId=" + categoryId + ", filename="
				+ filename + "]";
	}
	
	
}
