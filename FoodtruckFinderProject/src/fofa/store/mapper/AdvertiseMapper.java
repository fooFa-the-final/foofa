package fofa.store.mapper;

import java.util.List;

import fofa.domain.Advertise;

public interface AdvertiseMapper {

	int delete(String advid);
	int insert(Advertise advertise);
	int update(Advertise advertise);
	List<Advertise> selectByAsc(Boolean approve);
	List<Advertise> selectByDesc(Boolean approve);
	List<Advertise> selectNowAd();
	
}
