package fofa.service.logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fofa.domain.Seller;
import fofa.service.SellerService;
import fofa.store.SellerStore;

@Service
public class SellerServiceLogic implements SellerService {

	@Autowired
	public SellerStore sellerStore;

	@Override
	public boolean checkId(String sellerId) {
		Seller seller = sellerStore.select(sellerId);
		if (seller != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean checkPw(String sellerId, String password) {
		Seller seller = sellerStore.select(sellerId);
		if (seller.getPassword() != password) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public Seller findById(String sellerId) {
		return sellerStore.select(sellerId);
	}

	@Override
	public boolean login(Seller seller) {
		Seller seller1 = sellerStore.select(seller.getSellerId());
		if (seller1.getPassword() != seller.getPassword()) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean modify(Seller seller) {
		return sellerStore.update(seller) > 0;
	}

	@Override
	public boolean register(Seller seller) {
		return sellerStore.insert(seller) > 0;
	}

	@Override
	public boolean remove(String sellerId) {
		return sellerStore.delete(sellerId) > 0;
	}
}
