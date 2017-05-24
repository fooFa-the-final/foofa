package fofa.store.utils;

public class jdbcUtils {
	
	public static void close(AutoCloseable...autoCloseables){
		
		for(AutoCloseable auto : autoCloseables){
			if(auto == null){
				continue;
			}
			
			try {
				auto.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
