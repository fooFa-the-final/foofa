package fofa.store.mapper;

import fofa.domain.Seller;

public interface SellerMapper {

	
	boolean insert(Seller seller);
	boolean delete(String id);
	boolean update(Seller seller);
	Seller select(Seller seller);
	
}
