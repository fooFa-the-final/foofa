package fofa.store.mapper;

import fofa.domain.Seller;

public interface SellerMapper {

	
	int insert(Seller seller);
	int delete(String id);
	int update(Seller seller);
	Seller select(String sellerId);
	
}
