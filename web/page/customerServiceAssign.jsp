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
	
	var url;

	 function resetValue(){
			$("#assigner").combobox("setValue","");
	 }
	
	 function saveCustomerService(){
			$("#fm").form("submit",{
				url:url,
				onSubmit:function(){
					return $(this).form("validate");
				},
				success:function(result){
					var result=eval('('+result+')');
					if(result.success){
						$.messager.alert("系统提示","分配成功");
						resetValue();
						$("#dlg").dialog("close");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","分配失败");
						return;
					}
				}
			});
		}
	 
	 
	 function deleteCustomerService(){
			var selectedRows=$("#dg").datagrid('getSelections');
			if(selectedRows.length==0){
				$.messager.alert("系统提示","请选择要删除的数据！");
				return;
			}
			var strIds=[];
			for(var i=0;i<selectedRows.length;i++){
				strIds.push(selectedRows[i].id);
			}
			var ids=strIds.join(",");
			$.messager.confirm("系统提示","您确认要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
				if(r){
					$.post("${pageContext.request.contextPath}/customerService/delete.do",{ids:ids},function(result){
						if(result.success){
							$.messager.alert("系统提示","数据已成功删除！");
							$("#dg").datagrid("reload");
						}else{
							$.messager.alert("系统提示","数据删除失败！");
						}
					},"json");
				}
			});
			
		}
	 
	 function openCustomerServiceAssignDialog(){
			var selectedRows=$("#dg").datagrid('getSelections');
			if(selectedRows.length!=1){
				$.messager.alert("系统提示","请选择一条要分配的客户服务数据！");
				return;
			}
			var row=selectedRows[0];
			$("#dlg").dialog("open").dialog("setTitle","分配客户服务");
			$('#fm').form('load',row);
			$("#assignTime").val(getCurrentDate());
			$("#state").val("已分配");
			url="${pageContext.request.contextPath}/customerService/save.do?id="+row.id;
		}
	 
	 function closeCustomerServiceDialog(){
		 $("#dlg").dialog("close");
			resetValue();
	 }
</script>
</head>
<body style="margin:1px;">
<table id="dg" title="客户服务分配管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${pageContext.request.contextPath}/customerService/list.do?state=新创建" fit="true" toolbar="#tb">
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
			<a href="javascript:openCustomerServiceAssignDialog()" class="easyui-linkbutton" iconCls="icon-fwfp" plain="true">分配</a>
			<a href="javascript:deleteCustomerService()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 750px;height:450px;padding: 10px 20px"
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
	 					<input type="hidden" id="state" name="state" />
	 					<input class="easyui-combobox" class="easyui-validatebox" required="true" id="assigner" name="assigner" data-options="panelHeight:'auto',editable:false,valueField:'trueName',textField:'trueName',url:'${pageContext.request.contextPath}/user/customerManagerComboList.do'"/>&nbsp;<font color="red">*</font>
	 				</td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>分配时间：</td>
	 				<td><input type="text" id="assignTime" name="assignTime" readonly="readonly" /></td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveCustomerService()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeCustomerServiceDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>