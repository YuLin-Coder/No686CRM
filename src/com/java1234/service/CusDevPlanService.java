package com.java1234.service;

import java.util.List;
import java.util.Map;

import com.java1234.entity.CusDevPlan;

/**
 * 客户开发计划Service接口
 * @author Administrator
 *
 */
public interface CusDevPlanService {

	/**
	 * 查询客户开发计划
	 * @param map
	 * @return
	 */
	public List<CusDevPlan> findCusDevPlan(Map<String,Object> map);
	
	/**
	 * 查询客户开发计划记录数
	 * @param map
	 * @return
	 */
	public Long getTotalCusDevPlan(Map<String,Object> map);
	
	/**
	 * 添加客户开发计划
	 * @param cusDevPlan
	 * @return
	 */
	public int addCusDevPlan(CusDevPlan cusDevPlan);
	
	/**
	 * 修改客户开发计划
	 * @param cusDevPlan
	 * @return
	 */
	public int updateCusDevPlan(CusDevPlan cusDevPlan);
	
	/**
	 * 删除客户开发计划
	 * @param id
	 * @return
	 */
	public int deleteCusDevPlan(Integer id);
	
	/**
	 * 通过id查找实体
	 * @param id
	 * @return
	 */
	public CusDevPlan findById(Integer id);
}
