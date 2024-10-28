package com.java1234.service;

import java.util.List;
import java.util.Map;

import com.java1234.entity.Customer;
import com.java1234.entity.CustomerFw;
import com.java1234.entity.CustomerGc;
import com.java1234.entity.CustomerGx;

/**
 * 客户Service接口
 * @author Administrator
 *
 */
public interface CustomerService {

	/**
	 * 查询客户
	 * @param map
	 * @return
	 */
	public List<Customer> findCustomer(Map<String,Object> map);
	
	/**
	 * 查询客户记录数
	 * @param map
	 * @return
	 */
	public Long getTotalCustomer(Map<String,Object> map);
	
	/**
	 * 添加客户
	 * @param customer
	 * @return
	 */
	public int addCustomer(Customer customer);
	
	/**
	 * 修改客户
	 * @param customer
	 * @return
	 */
	public int updateCustomer(Customer customer);
	
	/**
	 * 删除客户
	 * @param id
	 * @return
	 */
	public int deleteCustomer(Integer id);
	
	/**
	 * 通过Id查找实体
	 * @param id
	 * @return
	 */
	public Customer findById(Integer id);
	
	/**
	 * 查找流失客户，并且添加到流失客户表里
	 */
	public void checkCustomerLoss();
	
	/**
	 * 查询客户贡献
	 * @param map
	 * @return
	 */
	public List<CustomerGx> findCutomerGx(Map<String,Object> map);
	
	/**
	 * 查询客户贡献记录数
	 * @param map
	 * @return
	 */
	public Long getTotalCustomerGx(Map<String,Object> map);
	
	/**
	 * 查询客户构成
	 * @return
	 */
	public List<CustomerGc> findCustomerGc();
	
	/**
	 * 查询客户服务分析
	 * @return
	 */
	public List<CustomerFw> findCustomerFw();
}
