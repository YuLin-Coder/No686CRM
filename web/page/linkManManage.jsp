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
		 
		 $.post("${pageContext.request.contextPath}/customer/findById.do",{id:'${param.cusId}'},function(result){
				$("#khno").val(result.khno);
				$("#name").val(result.name);
			},"json");
		 
		 $('#dg').edatagrid({
            url: '${pageContext.request.contextPath}/linkMan/list.do?cusId=${param.cusId}',
            saveUrl: '${pageContext.request.contextPath}/linkMan/save.do?customer.id=${param.cusId}',
            updateUrl: '${pageContext.request.contextPath}/linkMan/save.do',
            destroyUrl: '${pageContext.request.contextPath}/linkMan/delete.do'
        });
     });
	
	
	
</script>
</head>
<body style="margin:15px;">
<div id="p" class="easyui-panel" title="客户基本信息" style="width:700px;height:100px;padding:10px;">
		<table cellspacing="8px">
			<tr>
				<td>客户编号：</td>
				<td><input type="text" id="khno" name="khno" readonly="readonly"/></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>客户姓名：</td>
				<td><input type="text" id="name" name="name" readonly="readonly"/></td>
			</tr>
		</table>
</div>
<br/>	
<table id="dg" title="联系人信息管理" style="width:700px;height:250px"
        toolbar="#toolbar" idField="id"
        rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
        <tr>
            <th field="id" width="50" >编号</th>
            <th field="linkName" width="100" editor="{type:'validatebox',options:{required:true}}">客户姓名</th>
            <th field="sex" width="50" editor="{type:'combobox',  
                options:{  
                    valueField:'id',  
                    textField:'name',  
                    data:[{id:'男',name:'男'},{id:'女',name:'女'}],
                    required:true,
                    panelHeight:'auto'
                } }">性别</th>
            <th field="zhiwei" width="100" editor="{type:'validatebox',options:{validType:'date'}}">职位</th>
            <th field="officePhone" width="100" editor="{type:'validatebox',options:{required:true}}">办公电话</th>
            <th field="phone" width="100" editor="{type:'validatebox',options:{required:true}}">手机</th>
        </tr>
    </thead>
</table>
	    
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:$('#dg').edatagrid('addRow')">添加</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#dg').edatagrid('destroyRow')">删除</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg').edatagrid('saveRow');$('#dg').edatagrid('reload')">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">撤销行</a>
</div>
	
</body>
</html>