package com.java1234.service;

import java.util.List;
import java.util.Map;

import com.java1234.entity.CustomerLoss;

/**
 * 客户流失Service接口
 * @author Administrator
 *
 */
public interface CustomerLossService {

	/**
	 * 查询客户流失集合
	 * @param map
	 * @return
	 */
	public List<CustomerLoss> findCustomerLoss(Map<String,Object> map);
	
	/**
	 * 查询客户流失记录数
	 * @param map
	 * @return
	 */
	public Long getTotalCutomerLoss(Map<String,Object> map);
	
	/**
	 * 通过Id查找实体
	 * @param id
	 * @return
	 */
	public CustomerLoss findById(Integer id);
	
	/**
	 * 修改客户流失记录
	 * @param customerLoss
	 * @return
	 */
	public int updateCustomerLoss(CustomerLoss customerLoss);
}
