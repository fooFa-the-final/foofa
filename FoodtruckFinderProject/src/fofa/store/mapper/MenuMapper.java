package fofa.store.mapper;

import java.util.List;

import fofa.domain.Menu;

public interface MenuMapper {
	
int insert(Menu menu);
	
	int update(Menu menu);
	
	int delete(String menuId);
	
	List<Menu> selectByTruckId(String foodtruckId);

}
