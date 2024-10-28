<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	function searchCustomerService(){
		$("#dg").datagrid('load',{
			"customer":$("#s_customer").val(),
			"overview":$("#s_overview").val(),
			"serveType":$("#s_serveType").combobox("getValue"),
			"createTimefrom":$("#s_createTimefrom").datebox("getValue"),
			"createTimeto":$("#s_createTimeto").datebox("getValue")
		});
	}

	 function openCustomerFileDialog(){
			var selectedRows=$("#dg").datagrid('getSelections');
			if(selectedRows.length!=1){
				$.messager.alert("系统提示","请选择一条要查看的客户服务数据！");
				return;
			}
			var row=selectedRows[0];
			$("#dlg").dialog("open").dialog("setTitle","客户服务详情");
			$('#fm').form('load',row);
			url="${pageContext.request.contextPath}/customerService/save.do?id="+row.id;
		}
	 
	 function closeCustomerFileDialog(){
		 $("#dlg").dialog("close");
	 }
</script>
</head>
<body style="margin:1px;">
<table id="dg" title="客户服务归档管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${pageContext.request.contextPath}/customerService/list.do?state=已归档" fit="true" toolbar="#tb">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="id" width="50" align="center">编号</th>
	 		<th field="customer" width="100" align="center">客户</th>
	 		<th field="overview" width="200" align="center">概要</th>
	 		<th field="serveType" width="100" align="center">服务类型</th>
	 		<th field="createPeople" width="100" align="center">创建人</th>
	 		<th field="createTime" width="100" align="center">创建日期</th>
	 		<th field="state" width="100" align="center" hidden="true">客户服务状态</th>
	 		<th field="servicerequest" width="100" align="center" hidden="true">服务请求</th>
	 		<th field="assigner" width="100" align="center" hidden="true">分配人</th>
	 		<th field="assignTime" width="100" align="center" hidden="true">分配日期</th>
	 		<th field="serviceProce" width="100" align="center" hidden="true">服务处理</th>
	 		<th field="serviceProcePeople" width="100" align="center" hidden="true">服务处理人</th>
	 		<th field="serviceProceTime" width="100" align="center" hidden="true">服务处理日期</th>
	 		<th field="serviceProceResult" width="100" align="center" hidden="true">服务处理结果</th>
	 		<th field="myd" width="100" align="center" hidden="true">客户满意度</th>
	 	</tr>
	 </thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openCustomerFileDialog()" class="easyui-linkbutton" iconCls="icon-fwgd" plain="true">查看客户服务详情</a>
		</div>
		<div>
			&nbsp;客户名称：&nbsp;<input type="text" id="s_customer" size="20" onkeydown="if(event.keyCode==13) searchCustomerService()"/>&nbsp;
			&nbsp;概要：&nbsp;<input type="text" id="s_overview" size="20" onkeydown="if(event.keyCode==13) searchCustomerService()"/>&nbsp;
			&nbsp;服务类型：&nbsp;<select class="easyui-combobox" id="s_serveType"  style="width: 154px;" editable="false" panelHeight="auto">
			 						<option value="">请选择...</option>
			 						<option value="咨询">咨询</option>
			 						<option value="建议">建议</option>
			 						<option value="投诉">投诉</option>
			 					</select>
			&nbsp;创建日期&nbsp;<input type="text" id="s_createTimefrom" class="easyui-datebox" editable="false">&nbsp;-&nbsp;<input type="text" id="s_createTimeto" class="easyui-datebox" editable="false">&nbsp;
			<a href="javascript:searchCustomerService()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 750px;height:550px;padding: 10px 20px"
	  closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>服务类型：</td>
	 				<td>
	 					<input type="text" id="serveType" name="serveType" readonly="readonly"/>
	 				</td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>客户：</td>
	 				<td>
	 					<input type="text" id="customer" name="customer" readonly="readonly"/>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td valign="top">概要：</td>
	 				<td colspan="4">
	 					<input type="text" id="overview" name="overview" style="width:419px " class="easyui-validatebox" required="true"/>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td valign="top">服务请求：</td>
	 				<td colspan="4">
	 					<textarea id="servicerequest" name="servicerequest" rows="5" cols="49" readonly="readonly"></textarea>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td>创建人：</td>
	 				<td><input type="text" id="createPeople" name="createPeople"  readonly="readonly" /></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>创建时间：</td>
	 				<td><input type="text" id="createTime" name="createTime" readonly="readonly" /></td>
	 			</tr>
	 			<tr>
	 				<td>分配给：</td>
	 				<td>
	 					<input type="text" id="assigner" name="assigner" readonly="readonly" />
	 				</td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>分配时间：</td>
	 				<td><input type="text" id="assignTime" name="assignTime" readonly="readonly" /></td>
	 			</tr>
	 			<tr>
	 				<td valign="top">服务处理：</td>
	 				<td colspan="4">
	 					<textarea id="serviceProce" name="serviceProce" rows="5" cols="49" readonly="readonly"></textarea>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td>处理人：</td>
	 				<td>
	 					<input type="text" id="serviceProcePeople" name="serviceProcePeople" readonly="readonly" />
	 				</td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>处理时间：</td>
	 				<td><input type="text" id="serviceProceTime" name="serviceProceTime" readonly="readonly" /></td>
	 			</tr>
	 			<tr>
	 				<td>处理结果：</td>
	 				<td>
	 					<input type="text" id="serviceProceResult" name="serviceProceResult"  readonly="readonly"/>
	 				</td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>客户满意度：</td>
	 				<td>
	 					<input type="text" id="myd" name="myd"  readonly="readonly"/>
	 				</td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:closeCustomerFileDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>