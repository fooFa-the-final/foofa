package fofa.store.mapper;

import java.util.List;

import fofa.domain.Image;

public interface ImageMapper {
	List<Image> selectReviewImage(String reviewId);
	int insertImage(Image image);
	int updateImage(Image image);
	int deleteImage(String imageId);
}
