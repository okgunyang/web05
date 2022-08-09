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

import com.kktshop.dto.MemberDTO;
import com.kktshop.dto.ReviewDTO;
import com.kktshop.dto.SalesDTO;
import com.kktshop.service.ReviewService;

@Controller
@RequestMapping("/review/")
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping(value="list.do", method = RequestMethod.GET)
    public String reviewList(@RequestParam("gnum") int gnum, Model model) throws Exception {
		List<ReviewDTO> reviewList = reviewService.reviewList(gnum);
		model.addAttribute("reviewList", reviewList);
        return "review/reviewList";
    }
	
	@ResponseBody
	@RequestMapping(value="ajaxList.do", method = RequestMethod.GET)
    public List<ReviewDTO> reviewAjaxList(int gnum, Model model) throws Exception {
		List<ReviewDTO> reviewList = reviewService.reviewList(gnum);
        return reviewList;
    }

	@RequestMapping(value="addReviewForm.do", method = RequestMethod.GET)
    public String addReviewForm(@RequestParam("gnum") int gnum, Model model) throws Exception {
		model.addAttribute("gnum", gnum);
        return "review/addReviewForm";
    }
	
	@RequestMapping(value="addReview.do", method = RequestMethod.POST)
    public String addReview(ReviewDTO review, Model model) throws Exception {
		reviewService.addReview(review);
        return "/";
    }
}