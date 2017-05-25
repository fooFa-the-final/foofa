package fofa.store;

import java.util.List;

import fofa.domain.Advertise;

public interface AdvertiseStore {

	
	int delete(String advid);
	int insert(Advertise advertise);
	int update(String advid);
	List<Advertise> selectByAsc(boolean approve);
	List<Advertise> selectByDesc(boolean approve);
	List<Advertise> selectNowAd();

	
	
}
