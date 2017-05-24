package fofa.store;

import fofa.domain.Seller;

public interface SellerStore {

	boolean insert(Seller seller);
	boolean delete(String id);
	boolean update(Seller seller);
	Seller select(Seller seller);
	
}
