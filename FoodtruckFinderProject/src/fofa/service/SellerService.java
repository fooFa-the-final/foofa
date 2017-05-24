package fofa.service;

import fofa.domain.Seller;

public interface SellerService {

	
	boolean register(Seller seller);
	boolean modify(Seller seller);
	boolean remove(String sellerId);
	Seller findById(String sellerId);
	boolean checkPw(String sellerId, String password);
	boolean login(Seller seller);
	String checkId(String sellerId);
	
	
}
