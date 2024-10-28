package com.java1234.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java1234.entity.OrderDetails;
import com.java1234.entity.PageBean;
import com.java1234.service.OrderDetailsService;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

/**
 * 订单详情Controller类
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/orderDetails")
public class OrderDetailsController {

	@Resource
	private OrderDetailsService orderDetailsService;
	
	/**
	 * 查询订单详情
	 * @param page
	 * @param rows
	 * @param orderId
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,String orderId,HttpServletResponse response)throws Exception{
		if(StringUtil.isEmpty(orderId)){
			return null;
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("orderId", orderId);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<OrderDetails> orderDetailsList=orderDetailsService.findOrderDetails(map);
		Long total=orderDetailsService.getTotalOrderDetails(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(orderDetailsList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 通过订单id获取订单总金额
	 * @param orderId
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getTotalPrice")
	public String getTotalPrice(String orderId,HttpServletResponse response)throws Exception{
		float totalMoney=orderDetailsService.getTotalPriceByOrderId(Integer.parseInt(orderId));
		JSONObject result=new JSONObject();
		result.put("totalMoney", totalMoney);
		ResponseUtil.write(response, result);
		return null;
	}
}
