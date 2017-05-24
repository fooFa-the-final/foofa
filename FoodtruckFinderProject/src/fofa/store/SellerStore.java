package fofa.store;

import fofa.domain.Seller;

public interface SellerStore {

	int insert(Seller seller);
	int delete(String id);
	int update(Seller seller);
	Seller select(String sellerId);
	
}
