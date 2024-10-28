package com.java1234.entity;

/**
 * 客户流失暂缓措施实体类
 * @author Administrator
 *
 */
public class CustomerReprieve {

	private Integer id; // 编号
	private CustomerLoss customerLoss; // 客户流失
	private String measure; // 暂缓措施
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public CustomerLoss getCustomerLoss() {
		return customerLoss;
	}
	public void setCustomerLoss(CustomerLoss customerLoss) {
		this.customerLoss = customerLoss;
	}
	public String getMeasure() {
		return measure;
	}
	public void setMeasure(String measure) {
		this.measure = measure;
	}
	
	
}
