package cn.itstudio.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itstudio.dao.DeviceBillDao;
import cn.itstudio.domain.DeviceBill;
import cn.itstudio.domain.User;
import cn.itstudio.util.SessionContext;

@SuppressWarnings("unchecked")
public class DeviceDaoImpl extends HibernateDaoSupport implements DeviceBillDao {

	/**查询自己的请假单的信息*/
	@Deprecated
	public List<DeviceBill> findDeviceBillList() {
		//从Session中获取当前用户
		User user = SessionContext.get();
		String hql = "from DeviceBill o where o.user=?";//指定当前用户的请假单
		List<DeviceBill> list = this.getHibernateTemplate().find(hql,user);
		return list;
	}
	
	/**保存请假单*/
	public void saveDeviceBill(DeviceBill deviceBill) {
		this.getHibernateTemplate().save(deviceBill);
	}
	
	/**使用请假单ID，查询请假单的对象*/
	public DeviceBill findDeviceBillById(Long id) {
		return (DeviceBill) this.getHibernateTemplate().get(DeviceBill.class, id);
	}
	
	/**更新请假单*/
	public void updateDeviceBill(DeviceBill deviceBill) {
		this.getHibernateTemplate().update(deviceBill);
	}
	
	/**使用请假单ID，删除请假单*/
	public void deleteDeviceBillById(Long id) {
		//2：使用请假单ID，查询请假单信息，获取对象DeviceBill
		DeviceBill bill = this.findDeviceBillById(id);
		//3：执行删除
		this.getHibernateTemplate().delete(bill);
	}
}
