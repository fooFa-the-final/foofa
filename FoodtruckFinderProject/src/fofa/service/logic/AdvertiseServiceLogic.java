package fofa.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fofa.domain.Advertise;
import fofa.service.AdvertiseService;
import fofa.store.SellerStore;

@Service
public class AdvertiseServiceLogic implements AdvertiseService {

	@Autowired
	private SellerStore sellerStore;
	
	@Override
	public List<Advertise> findByAsc(Boolean approve) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Advertise> findByDesc(Boolean approve) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Advertise> findNowAd() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public boolean modify(Advertise advertise) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public boolean register(Advertise advertise) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public boolean remove(String advertiseId) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
