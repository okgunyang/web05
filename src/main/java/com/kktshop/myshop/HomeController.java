package com.kktshop.myshop;

import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kktshop.dto.GoodsDTO;
import com.kktshop.service.GoodsService;
import com.kktshop.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HomeService homeService;
	
	@Autowired
	GoodsService goodsService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	ServletContext application = null;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);

		int cnt = goodsService.goodsCount();
		List<GoodsDTO> goods1 = homeService.latestGoods();
		model.addAttribute("cnt", cnt);
		model.addAttribute("goods1",goods1);
		return "home";
	}
	
	@RequestMapping(value = "/allGoods.do", method = RequestMethod.GET)
	public String allGoods(Model model) throws Exception {
		int cnt = goodsService.goodsCount();
		List<GoodsDTO> goods1 = goodsService.goodsList();
		model.addAttribute("cnt", cnt);
		model.addAttribute("goods1",goods1);
		return "allGoods";
	}
	
}
