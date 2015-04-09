package cn.itstudio.view.action;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itstudio.base.BaseAction;
import cn.itstudio.util.ValueContext;
import cn.itstudio.web.form.WorkflowBean;
@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class DeployAction extends BaseAction<WorkflowBean>{
	
    /**部署流程列表*/
    public String list() throws Exception {
    	//1:查询部署对象信息，对应表（act_re_deployment）
	    List<Deployment> deploymentList = workflowService.findDeploymentList();
	    //2:查询流程定义的信息，对应表（act_re_procdef）
	    List<ProcessDefinition> processDefinitionList = workflowService.findProcessDefinitionList();
	    //放置到上下文对象中
	    ValueContext.putValueContext("deploymentList", deploymentList);
	    ValueContext.putValueContext("processDefinitionList", processDefinitionList);
    	return "list";
    }
    /**部署流程*/
    public String deploy() throws Exception {
    	//获取页面传递的值
	    //1：获取页面上传递的zip格式的文件，格式是File类型
	    File file = model.getFile();
	    //文件名称
	    String filename = model.getFilename();
	    //完成部署
	    workflowService.saveNewDeploye(file,filename);
	    return "toList";
    }
    /**部署流程*/
    public String delete() throws Exception {
    	//1：获取部署对象ID
	    String deploymentId = model.getDeploymentId();
	    //2：使用部署对象ID，删除流程定义
	    workflowService.deleteProcessDefinitionByDeploymentId(deploymentId);
	    return "toList";
    }
    /**查看流程图*/
    public String viewImage() throws Exception {
    	//1：获取页面传递的部署对象ID和资源图片名称
	    //部署对象ID
	    String deploymentId = model.getDeploymentId();
	    //资源图片名称
	    String imageName = model.getImageName();
	    //2：获取资源文件表（act_ge_bytearray）中资源图片输入流InputStream
	    InputStream in = workflowService.findImageInputStream(deploymentId,imageName);
	    //3：从response对象获取输出流
	    OutputStream out = ServletActionContext.getResponse().getOutputStream();
	    //4：将输入流中的数据读取出来，写到输出流中
	    for(int b=-1;(b=in.read())!=-1;){
	    	out.write(b);
	    }
	    out.close();
	    in.close();
	    //将图写到页面上，用输出流写
	    return null;
	    }
}
