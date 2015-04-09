package cn.itstudio.service;

import java.util.List;

import cn.itstudio.base.DaoSupport;
import cn.itstudio.domain.Department;

public interface DepartmentService extends DaoSupport<Department>{

	List<Department> findAll();

	void delete(Long id);

	void save(Department model);

	Department getById(Long id);

	void update(Department department);

	/**
	 * 查询顶级部门列表
	 * 
	 * @return
	 */
	List<Department> findTopList();

	/**
	 * 查询子部门列表
	 * 
	 * @param parentId
	 * @return
	 */
	List<Department> findChildren(Long parentId);

}
