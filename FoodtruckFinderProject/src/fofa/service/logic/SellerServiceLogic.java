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
	public String checkId(String sellerId) {
		Seller seller = sellerStore.select(sellerId);
		if (seller != null) {
			String sellerid = "faile";
		} else {

		}
		
		return sellerId;
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
		Seller seller = sellerStore.select(sellerId);
		return seller;
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
		int sucess;
		sucess = sellerStore.update(seller);
		if (sucess == 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean register(Seller seller) {
		int sucess;
		sucess = sellerStore.insert(seller);
		if (sucess == 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean remove(String sellerId) {
		int sucess;
		sucess = sellerStore.delete(sellerId);
		if (sucess == 0) {
			return false;
		} else {
			return true;
		}
	}
}
