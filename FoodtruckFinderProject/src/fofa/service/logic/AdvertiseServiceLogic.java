package fofa.service.logic;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fofa.domain.Advertise;
import fofa.service.AdvertiseService;
import fofa.store.AdvertiseStore;

@Service
public class AdvertiseServiceLogic implements AdvertiseService {

	@Autowired
	private AdvertiseStore advertiseStore;

	@Override
	public List<Advertise> findByAsc(int approve) {
		List<Advertise> list = new ArrayList<>();
		list = advertiseStore.selectByAsc(approve);
		return list;
	}

	@Override
	public List<Advertise> findByDesc(int approve) {
		List<Advertise> list = new ArrayList<>();
		list = advertiseStore.selectByDesc(approve);
		return list;
	}

	@Override
	public List<Advertise> findNowAd() {
		List<Advertise> list = new ArrayList<>();
		list = advertiseStore.selectNowAd();
		return list;
	}

	@Override
	public boolean modify(Advertise advertise) {
		int sucess = advertiseStore.update(advertise);
		return sucess > 0;
	}

	@Override
	public boolean register(Advertise advertise) {
		int sucess;
		sucess = advertiseStore.insert(advertise);
		if (sucess == 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean remove(String advertiseId) {
		int sucess;
		sucess = advertiseStore.delete(advertiseId);
		if (sucess == 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public List<Advertise> findExpired() {
		return advertiseStore.selectExpired();
	}

	
}
