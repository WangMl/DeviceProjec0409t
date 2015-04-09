package cn.itstudio.service;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;

import cn.itstudio.domain.DeviceBill;
import cn.itstudio.web.form.WorkflowBean;



public interface IWorkflowService {

	void saveNewDeploye(File file, String filename);

	List<Deployment> findDeploymentList();

	List<ProcessDefinition> findProcessDefinitionList();

	InputStream findImageInputStream(String deploymentId, String imageName);

	void deleteProcessDefinitionByDeploymentId(String deploymentId);

	List<Task> findTaskListByName(String name);

	String findTaskFormKeyByTaskId(String taskId);

	DeviceBill findDeviceBillByTaskId(String taskId);

	List<String> findOutComeListByTaskId(String taskId);

	void saveSubmitTask(WorkflowBean workflowBean);

	List<Comment> findCommentByTaskId(String taskId);

	List<Comment> findCommentByDeviceBillId(Long id);

	ProcessDefinition findProcessDefinitionByTaskId(String taskId);

	Map<String, Object> findCoordingByTask(String taskId);

	void saveStartProcess(WorkflowBean workflowBean, Long deviceBillId);

	

}