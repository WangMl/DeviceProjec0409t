package cn.itstudio.service;

import java.util.List;

import cn.itstudio.base.DaoSupport;
import cn.itstudio.domain.DeviceBill;



public interface DeviceBillService extends DaoSupport<DeviceBill>{

	List<DeviceBill> findDeviceBillList();

	void saveDeviceBill(DeviceBill DeviceBill);

	DeviceBill findDeviceBillById(Long id);

	void deleteDeviceBillById(Long id);

}
