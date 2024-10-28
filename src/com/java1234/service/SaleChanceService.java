package com.java1234.service;

import java.util.List;
import java.util.Map;

import com.java1234.entity.SaleChance;

/**
 * 销售机会Service
 * @author Administrator
 *
 */
public interface SaleChanceService {

	/**
	 * 查询销售机会
	 * @param map
	 * @return
	 */
	public List<SaleChance> findSaleChance(Map<String,Object> map);
	
	/**
	 * 查询销售机会记录数
	 * @param map
	 * @return
	 */
	public Long getTotalSaleChance(Map<String,Object> map);
	
	/**
	 * 添加销售机会
	 * @param saleChance
	 */
	public int addSaleChance(SaleChance saleChance);
	
	/**
	 * 修改销售机会
	 * @param saleChance
	 * @return
	 */
	public int updateSaleChance(SaleChance saleChance);
	
	/**
	 * 删除销售机会
	 * @param id
	 * @return
	 */
	public int deleteSaleChance(Integer id);
	
	/**
	 * 修改客户开发状态
	 * @param devResult
	 * @return
	 */
	public int updateSaleChanceDevResult(Map<String,Object> map);
	
	/**
	 * 通过id查找实体
	 * @param id
	 * @return
	 */
	public SaleChance findById(Integer id);
}
