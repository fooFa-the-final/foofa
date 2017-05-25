package fofa.store;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import fofa.domain.Image;
import fofa.store.logic.ImageStoreLogic;

public class ImageStoreLogicTest {

	ImageStore store = null;
	@Before
	public void setUp(){
		store = new ImageStoreLogic();
	}

	@Test
	public void testSelectReviewImage() {
		List<Image> image = store.selectReviewImage("R1");
		assertEquals("momo.jpg", image.get(0).getFilename());
	}

	@Test
	public void testInsertImage() {
		Image image = new Image();
		image.setCategoryId("R1");
		image.setFilename("momo.jpg");
		
		assertEquals(1, store.insertImage(image.getCategoryId(), image));
	}

	@Test
	public void testUpdateImage() {
		Image image = new Image();
		
		image.setCategoryId("R1");
		image.setImageId("P1");
		image.setFilename("sana.jjpg");
		store.updateImage(image);
		assertEquals(1, store.updateImage(image));
	}

	@Test
	public void testDeleteImage() {
		assertEquals(1, store.deleteImage("P1"));
	}
}
