package com.java1234.dao;

import java.util.List;
import java.util.Map;

import com.java1234.entity.Contact;

/**
 * 交往记录Dao接口
 * @author Administrator
 *
 */
public interface ContactDao {

	/**
	 * 查询交往记录
	 * @param map
	 * @return
	 */
	public List<Contact> findContact(Map<String,Object> map);
	
	/**
	 * 查询交往记录记录数
	 * @param map
	 * @return
	 */
	public Long getTotalContact(Map<String,Object> map);
	
	/**
	 * 添加交往记录
	 * @param contact
	 * @return
	 */
	public int addContact(Contact contact);
	
	/**
	 * 修改交往记录
	 * @param contact
	 * @return
	 */
	public int updateContact(Contact contact);
	
	/**
	 * 删除交往记录
	 * @param id
	 * @return
	 */
	public int deleteContact(Integer id);
	
	/**
	 * 通过id查找实体
	 * @param id
	 * @return
	 */
	public Contact findById(Integer id);
}
