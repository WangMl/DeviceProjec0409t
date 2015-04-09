package cn.itstudio.view.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itstudio.base.BaseAction;
import cn.itstudio.domain.Company;
import cn.itstudio.domain.User;
import cn.itstudio.util.QueryHelper;

import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class CompanyAction extends BaseAction<Company> {

	/** 列表 */
	public String list() throws Exception {
		new QueryHelper(Company.class, "c").preparePageBean(companyService, pageNum, pageSize);
		return "list";
	}

	/** 删除 */
	public String delete() throws Exception {
		companyService.delete(model.getId());
		return "toList";
	}

	/** 添加页面 */
	public String addUI() throws Exception {
		return "saveUI";
	}

	/** 添加 */
	public String add() throws Exception {
		// 封装信息到对象中

		// 保存
		companyService.save(model);

		return "toList";
	}

	/** 修改页面 */
	public String editUI() throws Exception {
		// 准备数据, companyList
		List<Company> companyList = companyService.findAll();
		ActionContext.getContext().put("companyList", companyList);

		// 准备回显的数据
		Company company = companyService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(company);
		return "saveUI";
	}

	/** 修改 */
	public String edit() throws Exception {
		// 1，从数据库取出原对象
	//	Company company = companyService.getById(model.getId());

		// 2，设置要修改的属性
		
		// 3，更新到数据库中
		companyService.update(model);

		return "toList";
	}
    /** 查询数据*/
	public String show()  throws Exception{
		// 准备数据
		Company company = companyService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(company);
		return "show";
	}
}
