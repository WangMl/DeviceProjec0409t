package cn.itstudio.dao;

import java.util.List;

import cn.itstudio.domain.DeviceBill;



public interface DeviceBillDao {

	List<DeviceBill> findDeviceBillList();

	void saveDeviceBill(DeviceBill deviceBill);

	DeviceBill findDeviceBillById(Long id);

	void updateDeviceBill(DeviceBill deviceBill);

	void deleteDeviceBillById(Long id);


}