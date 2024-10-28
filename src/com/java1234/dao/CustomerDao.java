package com.java1234.dao;

import java.util.List;
import java.util.Map;

import com.java1234.entity.Customer;
import com.java1234.entity.CustomerFw;
import com.java1234.entity.CustomerGc;
import com.java1234.entity.CustomerGx;

/**
 * 客户Dao接口
 * @author Administrator
 *
 */
public interface CustomerDao {

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
	 * 查找流失的客户 6个月未下单的客户
	 * @return
	 */
	public List<Customer> findLossCustomer();
	
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
