package fofa.store.mapper;

import java.util.List;

import fofa.domain.Advertise;

public interface AdvertiseMapper {

	int delete(String advid);

	int insert(Advertise advertise);

	int update(String advId);

	List<Advertise> selectNowAd();

	List<Advertise> selectByAsc(int approve);

	List<Advertise> selectByDesc(int approve);
	
	List<Advertise> selectExpired();

}
