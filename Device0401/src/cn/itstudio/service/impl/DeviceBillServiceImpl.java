package cn.itstudio.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itstudio.base.DaoSupportImpl;
import cn.itstudio.dao.DeviceBillDao;
import cn.itstudio.domain.DeviceBill;
import cn.itstudio.service.DeviceBillService;
import cn.itstudio.util.SessionContext;
@Service
@Transactional
@SuppressWarnings("unchecked")

public class DeviceBillServiceImpl extends DaoSupportImpl<DeviceBill> implements DeviceBillService {

	private DeviceBillDao deviceBillDao;

	public void setDeviceBillDao(DeviceBillDao deviceBillDao) {
		this.deviceBillDao = deviceBillDao;
	}
	
	/**查询自己的请假单的信息*/

	public List<DeviceBill> findDeviceBillList() {
		List<DeviceBill> list = getSession().createQuery(//
				"FROM DeviceBill d WHERE d.user = ?")//
				.setParameter(0, SessionContext.get())//
				.list();
		return list;
	}
	
	/**保存请假单*/

	public void saveDeviceBill(DeviceBill deviceBill) {
		//获取请假单ID
		Long id = deviceBill.getId();
		/**新增保存*/
		if(id==null){
			//1：从Session中获取当前用户对象，将DeviceBill对象中user与Session中获取的用户对象进行关联
			deviceBill.setUser(SessionContext.get());//建立管理关系
			//2：保存请假单表，添加一条数据
			deviceBillDao.saveDeviceBill(deviceBill);
		}
		/**更新保存*/
		else{
			//1：执行update的操作，完成更新
			deviceBillDao.updateDeviceBill(deviceBill);
		}
		
	}
	
	/**使用请假单ID，查询请假单的对象*/

	public DeviceBill findDeviceBillById(Long id) {
		DeviceBill bill = deviceBillDao.findDeviceBillById(id);
		return bill;
	}
	
	/**使用请假单ID，删除请假单*/
    @Deprecated
	public void deleteDeviceBillById(Long id) {
		deviceBillDao.deleteDeviceBillById(id);
	}


}
