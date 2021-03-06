package com.kh.maison.shop.model.service;

import java.util.List;
import java.util.Map;

import com.kh.maison.admin.product.model.vo.Category;
import com.kh.maison.admin.product.model.vo.Product;
import com.kh.maison.admin.product.model.vo.ProductCate;
import com.kh.maison.adminMypage.product.model.vo.MyAdminEnroll;
import com.kh.maison.shop.model.vo.InquiryReply;
import com.kh.maison.shop.model.vo.PdInquiry;
import com.kh.maison.shop.model.vo.Request;
import com.kh.maison.shop.model.vo.TotalInquiry;

public interface ShopService {

	List<Product> selectProductList(int cPage, int numPerPage);
	int selectCount();
	
	List<Category> selectCategory();
	List<Category> selectMediCate();
	int insertRequestProduct(Request rq);
	
	List<Product> selectOneMediCate(String keyword);
	
	List<ProductCate> searchCate(String category);
	
	List<TotalInquiry> selectInquiryList(int cPage, int numPerPage,Map<String,Object> map);
	int selectCountInquiry(Map<String,Object> map);

	Product selectPdOne(int no);

	int writeInquiry(PdInquiry pi);
	
	int insertReply(InquiryReply ir);
	
	PdInquiry selectInquiryOne(int piNo);
	
	int updateInquiry(Map<String,Object> m);
	
	List<InquiryReply> selectReplyOne(int piNo);
	
	int updateStatus(int no);
	
	List<TotalInquiry> selectAddReply(int no);
	
	int modiReply(Map<String,Object> param);
	
	int deleteInquiry(int no);
	int deleteRep(int no);
	
	List<Category> searchMediCate(String category);
	
}
