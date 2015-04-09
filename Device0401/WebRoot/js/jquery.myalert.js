$(document).ready( function() {
				
		$(".delete").click( function() {
			jAlert('您确定要删除吗？', '删除此信息');
		});
		$(".init-password").click( function() {
			jAlert('您确定初始化密码吗？', '初始化密码');
		});
		$(".deal").click( function() {
			jAlert('您确定要处理吗？', '处理待办');
		});
				
	});