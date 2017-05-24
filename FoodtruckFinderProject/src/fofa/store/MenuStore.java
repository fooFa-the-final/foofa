package fofa.store;

import java.util.List;

import fofa.domain.Menu;

public interface MenuStore {
	
	int insert(Menu menu);
	
	int update(Menu menu);
	
	int delete(String menuId, String foodtruckId);
	
	List<Menu> selectByTruckId(String foodtruckId);

}
