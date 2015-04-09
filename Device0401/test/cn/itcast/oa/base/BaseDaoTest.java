package cn.itcast.oa.base;

import org.junit.Test;

import cn.itstudio.dao.RoleDao;
import cn.itstudio.dao.UserDao;
import cn.itstudio.dao.impl.RoleDaoImpl;
import cn.itstudio.dao.impl.UserDaoImpl;

public class BaseDaoTest {

	@Test
	public void testSave() {
		UserDao userDao = new UserDaoImpl();
		RoleDao roleDao = new RoleDaoImpl();
	}

}
