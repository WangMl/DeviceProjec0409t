package cn.itstudio.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itstudio.base.DaoSupportImpl;
import cn.itstudio.domain.Role;
import cn.itstudio.service.RoleService;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class RoleServiceImpl extends DaoSupportImpl<Role> implements RoleService {

	public List<Role> getByRoleName(String roleName) {
		return  getSession().createQuery(//
				"FROM Role r WHERE r.name = ?")//
				.setParameter(0, roleName)//
				.list();
	}

	// @Resource
	// private RoleDao roleDao;
	// 
	// public Role getById(Long id) {
	// return roleDao.getById(id);
	// }
	//
	// public void delete(Long id) {
	// roleDao.delete(id);
	// }
	//
	// public void save(Role role) {
	// roleDao.save(role);
	// }
	//
	// public void update(Role role) {
	// roleDao.update(role);
	// }
	//
	// public List<Role> findAll() {
	// return roleDao.findAll();
	// }

}
