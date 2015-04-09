package cn.itstudio.service;

import java.util.List;

import cn.itstudio.base.DaoSupport;
import cn.itstudio.domain.Forum;

public interface ForumService extends DaoSupport<Forum>{

	/**
	 * 上移，最上面的不能上移
	 * @param id
	 */
	void moveUp(Long id);

	/**
	 * 下移，最下面的不能下移
	 * @param id
	 */
	void moveDown(Long id);
	/**
	 * 每次查询只查四条，然后放到List集合里面
	 * @param j 
	 * @param i 
	 * @return
	 */

	List<Forum> findPerFour(int start, int num);
    /**
     * 计算论坛总个数
     * @return
     */
	int caculateCount();
    /**
     * 计算论坛的总个数
     * @return
     */
	int findCount();

}
