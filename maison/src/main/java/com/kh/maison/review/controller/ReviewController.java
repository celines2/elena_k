package com.kh.maison.review.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.kh.maison.member.model.vo.Member;
import com.kh.maison.review.model.service.ReviewService;
import com.kh.maison.review.model.vo.Review;
import com.kh.maison.review.model.vo.ReviewReply;
import com.kh.maison.shop.service.ProductService;
import com.kh.maison.shop.vo.Product;
@Controller
public class ReviewController {

	@Autowired
	ReviewService service;
	
	@Autowired
	ProductService pservice;
	
	@RequestMapping("/shop/insertReview.do")
	@ResponseBody
	public ModelAndView insertReview(ModelAndView mv,int productNo) {
		
		Product p=pservice.selectProductOne(productNo);
		//나중에 오더디테일도 불러와야함
		//OrderDetail od=;
		
		mv.addObject("p",p);
		//mv.addObject("od",od);
		mv.setViewName("/shop/reviewPop");
		return mv ;
	}
	@RequestMapping("/shop/review.do")
	public String review() {
		
	return "shop/productReviewAdd";	
	}
	
	@RequestMapping("/shop/insertReviewEnd.do")
	public ModelAndView insertRevuewEnd(ModelAndView mv,Review r,HttpSession session) {
		
		
		Member m=(Member)session.getAttribute("loginMember");	
		r.setMemberId(m.getMemberId());
		
		//orderdetail도 확인해야함
		//이후 그 orderdetail로 등록된 리뷰가있는지 확인해야함
		
		int result=service.insertReview(r);
		mv.setViewName("redirect:/shop/shopDetail.do?no="+r.getProductNo());
		return mv;
	}
	
	@RequestMapping("/shop/selectReviewList.do")
	@ResponseBody
	public ModelAndView reviewList(ModelAndView mv,int productNo) 
			throws JsonMappingException, JsonGenerationException, IOException{
		
		List<Review> list=service.selectReviewList(productNo);
		mv.addObject("list", list);
		int count=0;
		float sum=0;
		for(Review r:list) {
			
			sum+=r.getReviewScore();
			count++;
			
		}
		double score=(sum/count);
		score=Math.round(score*100)/100.0;
		float percent= (sum/count)*20;
		
		//페이징처리

		
		
		
		mv.addObject("count", count);
		mv.addObject("score", score);
		mv.addObject("percent", percent);
		mv.setViewName("shop/productReview");
		return mv;
	}
	
	@RequestMapping("/shop/insertReviewReply.do")
	@ResponseBody
	List<ReviewReply> insertReviewReply(@RequestParam Map<String,String> param) 
			throws JsonMappingException, JsonGenerationException, IOException{
		int result=service.insertReviewReply(param);
		int reviewNo=Integer.parseInt(param.get("reviewNo"));
		List<ReviewReply> rlist=service.selectReviewReplyList(reviewNo);
		return rlist;
	}
	
	@RequestMapping("/shop/selectReviewReply.do")
	@ResponseBody
	List<ReviewReply> selectReviewReply(int reviewNo) 
			throws JsonMappingException, JsonGenerationException, IOException{
		List<ReviewReply> rlist=service.selectReviewReplyList(reviewNo);
		//ObjectMapper obm=new ObjectMapper();
		//String str=obm.writeValueAsString(rlist);
		return rlist;
	}

	@RequestMapping("/shop/deleteReply.do")
	@ResponseBody
	List<ReviewReply> deleteReply(int rrNo,int reviewNo) 
			throws JsonMappingException, JsonGenerationException, IOException{
		int result= service.deleteReviewReply(rrNo);
		List<ReviewReply> rlist=service.selectReviewReplyList(reviewNo);
		
		return rlist;
	}

	@RequestMapping("/shop/updateReviewReply.do")
	@ResponseBody
	List<ReviewReply> updateReviewReply(ReviewReply rr){
		int result=service.updateReviewReply(rr);
		List<ReviewReply> rlist=service.selectReviewReplyList(rr.getReviewNo());
		return rlist;
	}

	@RequestMapping("/shop/toReview.do")
	String toReview() {
		return "shop/toReview";
	}
	
	@RequestMapping("/shop/updateReview.do")
	@ResponseBody
	ModelAndView updateReview(@ModelAttribute Review r,ModelAndView mv) {
		Review rev=service.selectReviewOne(r.getReviewNo());
		Product p=pservice.selectProductOne(rev.getProductNo());
		mv.setViewName("shop/reviewUpdatePop");
		mv.addObject("r",rev);
		mv.addObject("p",p);
		return mv;
		
	}
	
	@RequestMapping("/shop/updateReviewEnd.do")
	ModelAndView updateReviewEnd(Review r,HttpSession session,ModelAndView mv) {
		System.out.println(r);
		Member m=(Member)session.getAttribute("loginMember");
		if(r.getMemberId().equals(m.getMemberId())){
			int result=service.updateReview(r);
			mv.setViewName("redirect:/shop/shopDetail.do?no="+r.getProductNo());
			
		}else {
			mv.addObject("msg","수정 권한이 없습니다 !");
			mv.addObject("loc","/shop/shopDetail.do?no="+r.getProductNo());
			mv.setViewName("common/msg");
		}
		return mv;
	}
	
	@RequestMapping("/shop/deleteReview")
	ModelAndView deleteReview(int reviewNo,ModelAndView mv) {
		int result=service.deleteReviewReply(reviewNo);
		//다시 리뷰페이지로 가기
		return mv;
	}
	
}
