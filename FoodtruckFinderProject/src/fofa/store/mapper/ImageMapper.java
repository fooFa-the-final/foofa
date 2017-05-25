package fofa.store.mapper;

import java.util.List;

import fofa.domain.Image;

public interface ImageMapper {
	List<Image> selectReviewImage(String reviewId);
	void insertImage(String reviewId, Image image);
	void updateImage(Image image);
	void deleteImage(String imageId);
}
