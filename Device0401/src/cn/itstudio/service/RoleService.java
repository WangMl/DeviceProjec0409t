package cn.itstudio.service;

import java.util.List;

import cn.itstudio.base.DaoSupport;
import cn.itstudio.domain.Role;

public interface RoleService extends DaoSupport<Role> {
    /**
     * 根据role，查询关联的角色
     * @param roleName
     * @return
     */
	List<Role> getByRoleName(String roleName);

	// // 查询所有
	// List<Role> findAll();
	//
	// void delete(Long id);
	//
	// void save(Role role);
	//
	// Role getById(Long id);
	//
	// void update(Role role);

}
