package fofa.store;

import java.util.List;

import fofa.domain.Advertise;

public interface AdvertiseStore {

	
	int delete(String advid);
	int insert(Advertise advertise);
	int update(String advId);
	List<Advertise> selectByAsc(int approve);
	List<Advertise> selectByDesc(int approve);
	List<Advertise> selectNowAd();
	List<Advertise> selectExpired();

	
	
}
