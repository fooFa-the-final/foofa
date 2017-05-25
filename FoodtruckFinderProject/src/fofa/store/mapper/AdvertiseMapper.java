package fofa.store.mapper;

import java.util.List;

import fofa.domain.Advertise;

public interface AdvertiseMapper {

	int delete(String advid);

	int insert(Advertise advertise);

	int update(String advid);

	List<Advertise> selectNowAd();

	List<Advertise> selectByAsc(boolean approve);

	List<Advertise> selectByDesc(boolean approve);

}
