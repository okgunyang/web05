package com.kktshop.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kktshop.dto.GoodsDTO;
import com.kktshop.dto.MemberDTO;
import com.kktshop.dto.NavbarDTO;
import com.kktshop.dto.ReviewDTO;
import com.kktshop.service.GoodsService;
import com.kktshop.service.HomeService;
import com.kktshop.service.ReviewService;

@Controller
@RequestMapping("/goods/")
public class GoodsController {
	
	@Autowired
	GoodsService goodsService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HomeService homeService;

	@Autowired
	ReviewService reviewService;
	
	@Autowired
	ResourceLoader rsLoader;
	
	//상품 목록 불러오기
	@RequestMapping(value="list.do", method = RequestMethod.GET)
    public String goodsList(Model model) throws Exception {
		int cnt = goodsService.goodsCount();
		List<GoodsDTO> goodsList = goodsService.goodsList();
		model.addAttribute("cnt", cnt);
		model.addAttribute("cate_tit", "모든 상품");
		model.addAttribute("goodsList", goodsList);
        return "goods/goodsList";
    }
	
	//ajax로 카테고리 목록 불러오기
	@ResponseBody
	@RequestMapping(value="categoryLoading.do", method = RequestMethod.GET)
    public List<NavbarDTO> categoryLoading(String navparam, Model model) throws Exception {
		List<NavbarDTO> cateList = goodsService.cateList(navparam);
		return cateList;
    }
	
	//ajax로 내비게이션바의 상품 메뉴 목록 불러오기
	@ResponseBody
	@RequestMapping(value="navLoading.do", method = RequestMethod.POST)
    public List<NavbarDTO> navLoading(Model model) throws Exception {
		List<NavbarDTO> navList = homeService.navList();
		return navList;
    }
	
	//상품 대분류 카테고리별 중분류 카테고리 목록별 상품 목록 불러오기
	@RequestMapping(value="prolist.do", method = RequestMethod.GET)
    public String proList(@RequestParam("navparam") String navparam, Model model) throws Exception {
		List<GoodsDTO> goodsList = goodsService.proList(navparam);
		int cnt = goodsService.proCount(navparam);
		String navname = goodsService.navnameLoading(navparam);
		model.addAttribute("cnt", cnt);
		model.addAttribute("cate_tit", navname);
		model.addAttribute("goodsList", goodsList);
        return "goods/goodsList";
    }
	
	//상품 등록하기
	@RequestMapping(value="addGoods.do", method = RequestMethod.POST)
    public String addGoods(GoodsDTO goods, Model model) throws Exception {
		goodsService.addGoods(goods);
        return "redirect:/goods/list.do";
    }
	
	//상품 등록 화면 로딩
	@RequestMapping(value="addGoodsForm.do", method = RequestMethod.GET)
    public String addGoodsForm(Model model) throws Exception {
		List<NavbarDTO> navbarList = homeService.navList();
		model.addAttribute("navbarList", navbarList);
        return "goods/addGoodsForm";
    }
	
	//상품 정보 변경하기
	@RequestMapping(value="updateGoods.do", method = RequestMethod.POST)
    public String updateGoods(GoodsDTO goods, Model model) throws Exception {
		goodsService.updateGoods(goods);
        return "redirect:/goods/list.do";
    }
	
	//상품 정보 삭제하기
	@RequestMapping(value="deleteGoods.do", method = RequestMethod.GET)
    public String deleteGoods(GoodsDTO goods, Model model) throws Exception {
		goodsService.deleteGoods(goods);
        return "redirect:/goods/list.do";
    }
	
	//상품 정보 상세보기
	@RequestMapping(value="getGoods.do", method = RequestMethod.GET)
    public String getGoods(int gnum, Model model) throws Exception {
		GoodsDTO goods = goodsService.getGoods(gnum);
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		int reviewCk = 0;
		if(member!=null) {
			String userid = member.getId();
			reviewCk = reviewService.reviewUserCount(gnum, userid);
		}
		List<ReviewDTO> reviewList = reviewService.reviewList(gnum);
		if(reviewCk >= 1) {
			model.addAttribute("reviewCk", "yes");
		} else {
			model.addAttribute("reviewCk", "no");
		}
		model.addAttribute("goods", goods);
		model.addAttribute("reviewList", reviewList);
        return "goods/getGoods";
    }
	
	//ajax로 해당 상품 정보 불러오기
	@ResponseBody
	@RequestMapping(value="getAjaxGoods.do", method = RequestMethod.GET)
    public GoodsDTO getAjaxGoods(int gnum, Model model) throws Exception {
		GoodsDTO goods = goodsService.getGoods(gnum);
        return goods;
    }
	
	//장바구니에서 해당 상품 정보 불러오기
	@RequestMapping(value="getCartGoods.do", method = RequestMethod.GET)
    public String getCartGoods(int gnum, int bno, Model model) throws Exception {
		GoodsDTO goods = goodsService.getGoods(gnum);
		model.addAttribute("goods", goods);
		model.addAttribute("bno", bno);
        return "goods/getGoods";
    }
	
	//상품이미지 업로드 화면 로딩
	@RequestMapping(value="goodsImgUploadForm.do", method = RequestMethod.GET)
    public String goodsImgUploadForm(Model model) throws Exception {
		List<NavbarDTO> navbarList = homeService.navList();
		model.addAttribute("navbarList", navbarList);
        return "goods/goodsImgUploadForm";
    }
	
	//상품이미지 업로드
	@RequestMapping(value="goodsImgUploadPro.do", method = RequestMethod.POST)
    public String goodsImgUploadPro(MultipartFile myfile, Model model) throws UnsupportedEncodingException, Exception {
		String uploadFolder = "D:\\kim3\\jsp3\\web05\\src\\main\\webapp\\WEB-INF\\views\\upload"; //절대경로
		//String uploadFolder = "/WEB-INF/views/upload"; //상대경로
		String fileName = myfile.getOriginalFilename();
		File saveFile = new File(uploadFolder, fileName);
		myfile.transferTo(saveFile);
    	model.addAttribute("filename", fileName);
    	return "goods/goodsImgUploadForm";
    }
	
	//신상품(베스트 상품) 불러오기
	@RequestMapping(value="newGoodsLoading.do", method = RequestMethod.GET)
	public String newGoodsLoading(Model model) throws Exception {
		int cnt = goodsService.goodsCount();
		List<GoodsDTO> goodsList = homeService.latestGoods();
		model.addAttribute("cnt", cnt);
		model.addAttribute("cate_tit", "신상품");
		model.addAttribute("goodsList",goodsList);
		return "goods/goodsList";
	}	
}