package com.kktshop.ajax;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kktshop.dto.CartDTO;
import com.kktshop.dto.MemberDTO;
import com.kktshop.dto.NavbarDTO;
import com.kktshop.service.CartService;
import com.kktshop.service.GoodsService;

@Controller
@RequestMapping("/cart/")
public class CartController {
	
	@Autowired
	CartService cartService;

	@Autowired
	GoodsService goodsService;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping(value="list.do", method = RequestMethod.GET)
    public String noticeList(Model model) throws Exception {
		MemberDTO user = (MemberDTO) session.getAttribute("member");
		String userid = user.getId();
		List<CartDTO> cartList = cartService.cartList(userid);
		int cnt = cartService.cartCount(userid);
		model.addAttribute("cnt", cnt);
		model.addAttribute("cartList", cartList);
        return "cart/cartList";
    }
	
	@RequestMapping(value="addCart.do", method = RequestMethod.GET)
    public String addCart(CartDTO cart, String gname, Model model) throws Exception {
		MemberDTO user = (MemberDTO) session.getAttribute("member");
		String userid = user.getId();
		cart.setUserid(userid);
		cart.setGcolor("basic");
		cart.setGsize("free");
		cartService.addCart(cart);
		model.addAttribute("gname", gname);
        return "redirect:/cart/list.do";
    }
	
	@RequestMapping(value="deleteCart.do", method = RequestMethod.GET)
    public String deleteCart(CartDTO cart, Model model) throws Exception {
		cartService.deleteCart(cart);
        return "redirect:/cart/list.do";
    }
	
	@ResponseBody
	@RequestMapping(value="cartCount.do", method = RequestMethod.GET)
    public int cartCount(Model model) throws Exception {
		String userid = (String) session.getAttribute("sid");
		int cartCnt = cartService.cartCount(userid);
		if(!(cartCnt > 0)) {
			cartCnt = 0;
		}
		return cartCnt;
    }	
}