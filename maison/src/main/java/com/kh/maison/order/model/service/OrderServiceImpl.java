package com.kh.maison.order.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.maison.admin.model.vo.CancelSearch;
import com.kh.maison.basket.model.vo.Basket;
import com.kh.maison.order.model.dao.OrderDao;
import com.kh.maison.order.model.vo.Order;
import com.kh.maison.order.model.vo.OrderDetail;
import com.kh.maison.order.model.vo.ShippingDestination;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	SqlSession session;
	
	@Autowired
	OrderDao dao;

	@Override
	public int insertOrder(Order o) {
		// TODO Auto-generated method stub
		return dao.insertOrder(session,o);
	}

	@Override
	public int insertOrderDetail(Basket b) {
		// TODO Auto-generated method stub
		return dao.insertOrderDetail(session,b);
	}

	@Override
	public int updateMileage(Map<String,Object> map2) {
		// TODO Auto-generated method stub
		return dao.updateMileage(session,map2);
	}

	@Override
	public int updateStock(Map<String, Object> map3) {
		// TODO Auto-generated method stub
		return dao.updateStock(session,map3);
	}

	@Override
	public int bupdateStock(Basket b) {
		// TODO Auto-generated method stub
		return dao.bupdateStock(session,b);
	}

	@Override
	public OrderDetail selectOdOne(int orderDetailNo) {
		// TODO Auto-generated method stub
		return dao.selectOdOne(session,orderDetailNo);
	}

	@Override
	public List<OrderDetail> selectOrderDetail(String memberId) {
		// TODO Auto-generated method stub
		return dao.selectOrderDetail(session, memberId);
	}

	@Override
	public int insertBuyOrderDetail(Map<String, Object> map4) {
		// TODO Auto-generated method stub
		return dao.insertBuyOrderDetail(session,map4);
	}

	@Override
	public List<Order> selectShippingDestination(String memberId) {
		// TODO Auto-generated method stub
		return dao.selectShippingDestination(session,memberId);
	}

	@Override
	public int insertShippingDestination(Order o) {
		// TODO Auto-generated method stub
		return dao.insertShippingDestination(session,o);
	}


	//마이페이지 주문취소 관련
	@Override
	public Order selectOneOrder(int orderNo) {
		// TODO Auto-generated method stub
		return dao.selectOneOrder(session,orderNo);
	}

	@Override
	public List<Order> selectMyOrderList(Map param, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectMyOrderList(session,param,cPage,numPerPage);
	}

	@Override
	public int countMyOrderList(Map param) {
		// TODO Auto-generated method stub
		return dao.countMyOrderList(session,param);
	}

	@Override
	public List<Order> selectMyOrderListAll(Map param) {
		// TODO Auto-generated method stub
		return dao.selectMyOrderListAll(session,param);
	}

	@Override
	public Order selectOrderOne(int orderNo) {
		// TODO Auto-generated method stub
		return dao.selectOrderOne(session,orderNo);
	}


	@Override
	public int deleteBasket(Basket b) {
		// TODO Auto-generated method stub
		return dao.deleteBasket(session,b);
	}
	
	
	@Override
	public int updateOrderStatus(int orderNo) {
		// TODO Auto-generated method stub
		return dao.updateOrderStatus(session,orderNo);
	}

	@Override
	public List<Map<String, Object>> selectCancelList(int cPage,int numPerPage,CancelSearch cs) {
		// TODO Auto-generated method stub
		return dao.selectCancelList(session,cPage,numPerPage,cs);
	}

	@Override
	public int selectCancelListCount(CancelSearch cs) {
		// TODO Auto-generated method stub
		return dao.selectCanCelListCount(session,cs);
	}

	@Override
	public List<Map<String, Object>> selectCancelOne(int orderNo) {
		// TODO Auto-generated method stub
		return dao.selectCancelOne(session,orderNo);
	}

	@Override
	public int updateOrderStatusSecond(int orderNo) {
		// TODO Auto-generated method stub
		return dao.updateOrderStatusSecond(session,orderNo);
	}

	@Override
	public int deleteOrderDetail(int orderNo) {
		// TODO Auto-generated method stub
		return dao.deleteOrderDetail(session,orderNo);
	}

	@Override
	public int countMyOrder(Map param) {
		// TODO Auto-generated method stub
		return dao.countMyOrder(session,param);
	}


	

}
