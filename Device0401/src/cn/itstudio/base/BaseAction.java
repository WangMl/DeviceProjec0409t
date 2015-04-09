package cn.itstudio.base;

import java.lang.reflect.ParameterizedType;

import javax.annotation.Resource;

import cn.itstudio.domain.User;
import cn.itstudio.service.CompanyService;
import cn.itstudio.service.DepartmentService;
import cn.itstudio.service.DeviceBillService;
import cn.itstudio.service.ForumService;
import cn.itstudio.service.IWorkflowService;
import cn.itstudio.service.PrivilegeService;
import cn.itstudio.service.ReplyService;
import cn.itstudio.service.RoleService;
import cn.itstudio.service.TopicService;
import cn.itstudio.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public abstract class BaseAction<T> extends ActionSupport implements ModelDriven<T> {

	// =============== ModelDriven的支持 ==================

	protected T model;

	public BaseAction() {
		try {
			// 通过反射获取model的真实类型
			ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
			Class<T> clazz = (Class<T>) pt.getActualTypeArguments()[0];
			// 通过反射创建model的实例
			model = clazz.newInstance();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public T getModel() {
		return model;
	}

	// =============== Service实例的声明 ==================
	@Resource
	protected RoleService roleService;
	@Resource
	protected DepartmentService departmentService;
	@Resource
	protected UserService userService;
	@Resource
	protected PrivilegeService privilegeService;

	@Resource
	protected ForumService forumService;
	@Resource
	protected TopicService topicService;
	@Resource
	protected ReplyService replyService;
	@Resource
	protected CompanyService companyService;
	@Resource
	protected IWorkflowService workflowService;
	@Resource
	protected DeviceBillService leaveBillService;
	@Resource
	protected DeviceBillService deviceBillService;
	/**
	 * 获取当前登录的用户
	 * 
	 * @return
	 */
	protected User getCurrentUser() {
		return (User) ActionContext.getContext().getSession().get("user");
	}

	// ============== 分页用的参数 =============

	protected int pageNum = 1; // 当前页
	protected int pageSize = 10; // 每页显示多少条记录

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

}
