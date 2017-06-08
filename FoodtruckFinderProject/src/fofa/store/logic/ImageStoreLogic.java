package fofa.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import fofa.domain.Image;
import fofa.store.ImageStore;
import fofa.store.factory.SqlSessionFactoryProvider;
import fofa.store.mapper.ImageMapper;

@Repository
public class ImageStoreLogic implements ImageStore {

	private SqlSessionFactory factory;
	
	public ImageStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	@Override
	public List<Image> selectReviewImage(String reviewId) {
		SqlSession session = factory.openSession();
		List<Image> list = null;
		try{
			ImageMapper mapper = session.getMapper(ImageMapper.class);
			list= mapper.selectReviewImage(reviewId);
		} finally {
			session.close();
		} 
		return list;
	}

	@Override
	public int insertImage(Image image) {
		SqlSession session = factory.openSession();
		int insert = 0;
		try{
			ImageMapper mapper = session.getMapper(ImageMapper.class);
			insert = mapper.insertImage(image);
			session.commit();
		} finally {
			session.close();
		} 
		return insert;
	}

	@Override
	public int updateImage(Image image) {
		SqlSession session = factory.openSession();
		int update = 0;
		try{
			ImageMapper mapper = session.getMapper(ImageMapper.class);
			update = mapper.updateImage(image);
			session.commit();
		} finally {
			session.close();
		} 
		return update;
	}

	@Override
	public int deleteImage(String imageId) {
		SqlSession session = factory.openSession();
		int delete = 0;
		try{
			ImageMapper mapper = session.getMapper(ImageMapper.class);
			delete = mapper.deleteImage(imageId);
			session.commit();
		} finally {
			session.close();
		} 
		return delete;
	}

}
