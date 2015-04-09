package cn.itstudio.domain;

import java.util.Date;

/**
 * 请假单
 */
public class DeviceBill {
	private Long id;//主键ID
	private String name;// 设备名称
	private String description;// 描述原因
	private Date applyDate = new Date();// 申请时间
	private String remark;// 备注
	private User user;// 申请人
	private String position; //设备地点
	private String fee;//预计费用
	private Integer state=0;// 设备申请 0初始录入,1.开始审批,2为审批完成
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getFee() {
		return fee;
	}
	public void setFee(String fee) {
		this.fee = fee;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	
}
