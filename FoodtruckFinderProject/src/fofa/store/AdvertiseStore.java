package fofa.store;

import java.util.List;

import fofa.domain.Advertise;

public interface AdvertiseStore {

	
	boolean delete(String advid);
	boolean insert(Advertise advertise);
	boolean update(Advertise advertise);
	List<Advertise> selectByAsc(Boolean approve);
	List<Advertise> selectByDesc(Boolean approve);
	List<Advertise> selectNowAd();
	
}
