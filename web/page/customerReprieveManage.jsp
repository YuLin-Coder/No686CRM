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
	
	 $(function(){
		 
		 $.post("${pageContext.request.contextPath}/customerLoss/findById.do",{id:'${param.lossId}'},function(result){
				$("#cusNo").val(result.cusNo);
				$("#cusName").val(result.cusName);
				$("#cusManager").val(result.cusManager);
				$("#lastOrderTime").val(result.lastOrderTime);
			},"json");
		 
		 $('#dg').edatagrid({
            url: '${pageContext.request.contextPath}/customerReprieve/list.do?lossId=${param.lossId}',
            saveUrl: '${pageContext.request.contextPath}/customerReprieve/save.do?customerLoss.id=${param.lossId}',
            updateUrl: '${pageContext.request.contextPath}/customerReprieve/save.do',
            destroyUrl: '${pageContext.request.contextPath}/customerReprieve/delete.do'
        });
     });
	
	
	function confirmLoss(){
		$.messager.confirm("系统提示","您确认这个客户流失吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/customerLoss/confirmLoss.do",{id:'${param.lossId}'},function(result){
					if(result.success){
						$.messager.alert("系统提示","执行成功！");
					}else{
						$.messager.alert("系统提示","执行成功！");
					}
				},"json");
			}
		});
	}
</script>
</head>
<body style="margin:15px;">
<div id="p" class="easyui-panel" title="客户流失基本信息" style="width:800px;height:130px;padding:10px;">
		<table cellspacing="8px">
			<tr>
				<td>客户编号：</td>
				<td><input type="text" id="cusNo" name="cusNo" readonly="readonly"/></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>客户姓名：</td>
				<td><input type="text" id="cusName" name="cusName" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>客户经理：</td>
				<td><input type="text" id="cusManager" name="cusManager" readonly="readonly"/></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>上次下单时间：</td>
				<td><input type="text" id="lastOrderTime" name="lastOrderTime" readonly="readonly"/></td>
			</tr>
		</table>
</div>
<br/>	
<table id="dg" title="客户流失暂存措施管理" style="width:800px;height:250px"
        toolbar="#toolbar" idField="id"
        rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
        <tr>
            <th field="id" width="50" >编号</th>
            <th field="measure" width="300" editor="{type:'validatebox',options:{required:true}}">暂缓措施</th>
        </tr>
    </thead>
</table>
	    
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:$('#dg').edatagrid('addRow')">添加</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#dg').edatagrid('destroyRow')">删除</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg').edatagrid('saveRow');$('#dg').edatagrid('reload')">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">撤销行</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-confirm" plain="true" onclick="confirmLoss()">确认流失</a>
</div>
	
</body>
</html>