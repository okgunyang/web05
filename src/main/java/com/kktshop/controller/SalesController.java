package com.kktshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kktshop.dto.GoodsDTO;
import com.kktshop.dto.MemberDTO;
import com.kktshop.dto.SalesDTO;
import com.kktshop.service.GoodsService;
import com.kktshop.service.SalesService;

@Controller
@RequestMapping("/sales/")
public class SalesController {
	
	@Autowired
	SalesService salesService;
	
	@Autowired
	GoodsService goodsService;
	
	@Autowired
	HttpSession session;
	
	//결제 목록 보기
	@RequestMapping(value="list.do", method = RequestMethod.GET)
    public String salesList(Model model) throws Exception {
		MemberDTO user = (MemberDTO) session.getAttribute("member");
		String userid = user.getId();
		List<SalesDTO> salesList = salesService.salesList(userid);
		model.addAttribute("salesList", salesList);
        return "sales/salesList";
    }
	
	//결제 목록 Ajax로 보기
	@ResponseBody
	@RequestMapping(value="ajaxList.do", method = RequestMethod.POST)
    public List<SalesDTO> ajaxList(Model model) throws Exception {
		MemberDTO user = (MemberDTO) session.getAttribute("member");
		String userid = user.getId();
		List<SalesDTO> salesList = salesService.salesList(userid);
		for(int i=0;i<salesList.size();i++) {
			SalesDTO sale = salesList.get(i);
			System.out.println("구입한 목록 : "+sale.getRname());
		}
        return salesList;
    }

	//상세 결제 내역 보기 
	@RequestMapping(value="getSales.do", method = RequestMethod.GET)
    public String salesList(int ono, Model model) throws Exception {
		SalesDTO sales = salesService.salesRead(ono);
		model.addAttribute("sales", sales);
        return "sales/getSales";
    }
	
	//상품상세보기에서 구입하기 했을 때의 구매 화면 로딩
	@RequestMapping(value="addSalesForm.do", method = RequestMethod.GET)
    public String addSalesForm(GoodsDTO goods, Model model) throws Exception {
		int gnum = goods.getGnum();
		GoodsDTO dto = goodsService.getGoods(gnum);
		model.addAttribute("goods", dto);
        return "sales/addSalesForm";
    }
	
	//상품상세보기에서 구입하기 했을 때의 구매 화면 로딩
	@RequestMapping(value="addSalesForm.do", method = RequestMethod.POST)
    public String addSalesForm2(GoodsDTO goods, Model model) throws Exception {
		int gnum = goods.getGnum();
		GoodsDTO dto = goodsService.getGoods(gnum);
		model.addAttribute("goods", dto);
        return "sales/addSalesForm";
    }
	
	//장바구니에서 구입하기 했을 때의 구매 화면 로딩
	@RequestMapping(value="addSalesCartForm.do", method = RequestMethod.GET)
    public String addSalesCartForm(int gno, int bno, int gstock, Model model) throws Exception {
		GoodsDTO goods = goodsService.getGoods(gno);		
		model.addAttribute("goods", goods);
		if(bno>0) {
			model.addAttribute("bno", bno);
		}
		if(gstock>0) {
			model.addAttribute("gstock", gstock);
		}
        return "sales/addSalesForm";
    }
	
	//판매처리
	@RequestMapping(value="addSales.do", method = RequestMethod.POST)
	public String addSales(SalesDTO sales, int bno, Model model) throws Exception {
		System.out.println(sales.getAddr1());
		MemberDTO user = (MemberDTO) session.getAttribute("member");
		String userid = user.getId();
		sales.setUserid(userid);
		if(bno > 0) {
			salesService.addSales(sales, bno);
		} else {
			salesService.addSales(sales);
		}
		return "redirect:/";
	}
	
	//배송처리 화면 로딩
	@RequestMapping(value="addShuttleForm.do", method = RequestMethod.GET)
	public String addShuttleForm(SalesDTO sales, Model model) throws Exception {
		SalesDTO sale = salesService.salesRead(sales.getOno());
		model.addAttribute("sales", sale);
		return "/sales/addShuttleForm";
	}

	//판매된 제품의 배송 처리
	@RequestMapping(value="addShuttle.do", method = RequestMethod.POST)
	public String addShuttle(SalesDTO sales, Model model) throws Exception {
		salesService.addShipping(sales);
		return "/";
	}
	
	//결제 팝업 창 로딩
	@RequestMapping(value="paypop.do", method = RequestMethod.GET)
    public String paypop(String paytype, Model model) throws Exception {
		model.addAttribute("paytype", paytype);
        return "sales/paypop";
    }	
	
	//주문취소처리
	@RequestMapping(value="deleteSales.do", method = RequestMethod.GET)
	public String deleteSales(SalesDTO sales, Model model) throws Exception {
		SalesDTO dto = salesService.salesRead(sales.getOno());
		salesService.deletesales(dto);
		return "redirect:/";
	}
}