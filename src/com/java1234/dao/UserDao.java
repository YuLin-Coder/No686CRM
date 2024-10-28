package com.java1234.dao;

import java.util.List;
import java.util.Map;

import com.java1234.entity.User;

/**
 * 用户Dao接口
 * @author Administrator
 *
 */
public interface UserDao {

	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	public User login(User user);
	
	/**
	 * 查询用户
	 * @param map
	 * @return
	 */
	public List<User> findUser(Map<String,Object> map);
	
	/**
	 * 获取用户记录数
	 * @param map
	 * @return
	 */
	public Long getTotalUser(Map<String,Object> map);
	
	/**
	 * 更新用户
	 * @param user
	 * @return
	 */
	public int updateUser(User user);
	
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	public int addUser(User user);
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public int deleteUser(Integer id);
}
