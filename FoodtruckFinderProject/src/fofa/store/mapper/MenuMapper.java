package fofa.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import fofa.domain.Menu;

public interface MenuMapper {

	int insert(Menu menu);
	
	int update(Menu menu);
	
	int delete(@Param("menuId")String menuId, @Param("foodtruckId")String foodtruckId);
	
	List<Menu> selectByTruckId(String foodtruckId);
	
}
