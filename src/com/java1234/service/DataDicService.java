package com.java1234.service;

import java.util.List;
import java.util.Map;

import com.java1234.entity.DataDic;

/**
 * 数据字典Service接口
 * @author Administrator
 *
 */
public interface DataDicService {

	/**
	 * 查询数据字典
	 * @param map
	 * @return
	 */
	public List<DataDic> findDataDic(Map<String,Object> map);
	
	/**
	 * 查找所以的数据字典名称
	 * @return
	 */
	public List<DataDic> findAllDataDicName();
	
	/**
	 * 查询数据字典记录数
	 * @param map
	 * @return
	 */
	public Long getTotalDataDic(Map<String,Object> map);
	
	/**
	 * 添加数据字典
	 * @param dataDic
	 * @return
	 */
	public int addDataDic(DataDic dataDic);
	
	/**
	 * 修改数据字典
	 * @param dataDic
	 * @return
	 */
	public int updateDataDic(DataDic dataDic);
	
	/**
	 * 删除数据字典
	 * @param id
	 * @return
	 */
	public int deleteDataDic(Integer id);
}
