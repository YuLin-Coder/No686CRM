package com.java1234.dao;

import java.util.List;
import java.util.Map;

import com.java1234.entity.CustomerReprieve;

/**
 * 客户流失暂缓措施Dao接口
 * @author Administrator
 *
 */
public interface CustomerReprieveDao {

	/**
	 * 查询客户流失暂缓措施集合
	 * @param map
	 * @return
	 */
	public List<CustomerReprieve> findCustomerReprieve(Map<String,Object> map);
	
	/**
	 * 查询客户流失暂缓措施记录数
	 * @param map
	 * @return
	 */
	public Long getTotalCustomerReprieve(Map<String,Object> map);
	
	/**
	 * 添加客户流失暂缓措施
	 * @param customerReprieve
	 * @return
	 */
	public int addCustomerReprieve(CustomerReprieve customerReprieve);
	
	/**
	 * 修改客户流失暂缓措施
	 * @param customerReprieve
	 * @return
	 */
	public int updateCustomerReprieve(CustomerReprieve customerReprieve);
	
	/**
	 * 删除客户流失暂缓措施
	 * @param id
	 * @return
	 */
	public int deleteCustomerReprieve(Integer id);
}
