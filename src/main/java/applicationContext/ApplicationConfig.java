package applicationContext;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.kktshop.dao.CartDAO;
import com.kktshop.dao.CartDAOImpl;
import com.kktshop.service.CartService;
import com.kktshop.service.CartServiceImpl;

@Configuration
public class ApplicationConfig {
	
	@Bean
	public CartDAO cartDAO() {
		CartDAO cartDAO = new CartDAOImpl();
		return cartDAO;
	}
	
	@Bean
	public CartService cartService() {
		CartService cartService = new CartServiceImpl();
		return cartService;
	}
}