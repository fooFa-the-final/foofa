package fofa.service;

import java.util.List;

import fofa.domain.Advertise;

public interface AdvertiseService {

	boolean register(Advertise advertise);
	boolean modify(String advertiseId);
	boolean remove(String advertiseId);
	List<Advertise> findByAsc(Boolean approve);
	List<Advertise> findByDesc(Boolean approve);
	List<Advertise> findNowAd();
	
}
