<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.edatagrid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">

	var url;

	
	function searchSaleChance(){
		$("#dg").datagrid('load',{
			"customerName":$("#s_customerName").val(),
			"overView":$("#s_overView").val(),
			"createMan":$("#s_createMan").val(),
			"devResult":$("#s_devResult").combobox("getValue")
		});
	}
	
	
	
	function openCusDevPlanAddDialog(id){	
		window.parent.openTab('客户开发计划项管理','cusdevplanitemManage.jsp?saleChanceId='+id,'icon-khkfjh');
	}
	
	function openCusDevPlanAddDialog2(id){	
		window.parent.openTab('查看客户开发计划项','cusdevplanitemManage.jsp?saleChanceId='+id+'&show=true','icon-khkfjh');
	}
	
	
	function formatState(val,row){
		if(val==1){
			return "已分配";
		}else{
			return "未分配";
		}
	}
	
	function formatDevResult(val,row){
		if(val==0){
			return "未开发";
		}else if(val==1){
			return "开发中";
		}else if(val==2){
			return "开发成功";
		}else if(val==3){
			return "开发失败";
		}
	} 
	
	function formatAction(val,row){
		if(row.devResult==0 || row.devResult==1 ){
			return "<a href='javascript:openCusDevPlanAddDialog("+row.id+")'>开发</a>";
		}else{
			return "<a href='javascript:openCusDevPlanAddDialog2("+row.id+")'>查看详细信息</a>";
		}
	}
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="客户开发计划管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${pageContext.request.contextPath}/saleChance/list.do?state=1" fit="true" toolbar="#tb">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="id" width="50" align="center">编号</th>
	 		<th field="chanceSource" width="50" align="center" hidden="true">机会来源</th>
	 		<th field="customerName" width="100" align="center">客户名称</th>
	 		<th field="cgjl" width="50" align="center" hidden="true">成功几率</th>
	 		<th field="overView" width="150" align="center">概要</th>
	 		<th field="linkMan" width="50" align="center">联系人</th>
	 		<th field="linkPhone" width="100" align="center" hidden="true">联系电话</th>
	 		<th field="description" width="50" align="center" hidden="true">机会描述</th>
	 		<th field="createMan" width="50" align="center" >创建人</th>
	 		<th field="createTime" width="100" align="center">创建时间</th>
	 		<th field="assignMan" width="50" align="center" >指派人</th>
	 		<th field="assignTime" width="100" align="center" >指派时间</th>
	 		<th field="state" width="100" align="center" formatter="formatState" hidden="true">状态</th>
	 		<th field="devResult" width="50" align="center" formatter="formatDevResult">开发状态</th>
	 		<th field="a" width="50" align="center" formatter="formatAction">操作</th>
	 	</tr>
	 </thead>
	</table>
	<div id="tb">
		<div>
			&nbsp;客户名称：&nbsp;<input type="text" id="s_customerName" size="20" onkeydown="if(event.keyCode==13) searchSaleChance()"/>
			&nbsp;概要：&nbsp;<input type="text" id="s_overView" size="20" onkeydown="if(event.keyCode==13) searchSaleChance()"/>
			&nbsp;客户开发状态：&nbsp;<select class="easyui-combobox" id="s_devResult"  editable="false" panelHeight="auto">
								    <option value="">请选择...</option>
									<option value="0">未开发</option>
									<option value="1">开发中</option>
									<option value="2">开发成功</option>
									<option value="3">开发失败</option>
								</select>&nbsp;
			<a href="javascript:searchSaleChance()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	
	
</body>
</html>