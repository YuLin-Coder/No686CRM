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

	
	 $(function(){
		 
		 $("#createTime").val(getCurrentDate());
		
     });
	
	 function resetValue(){
			$("#serveType").combobox("setValue","");
			$("#customer").val("");
			$("#overview").val("");
			$("#servicerequest").val("");
			$("#createTime").val(getCurrentDate());
		}
	
	 function saveCustomerService(){
		    var url="${pageContext.request.contextPath}/customerService/save.do";
			$("#fm").form("submit",{
				url:url,
				onSubmit:function(){
					return $(this).form("validate");
				},
				success:function(result){
					var result=eval('('+result+')');
					if(result.success){
						$.messager.alert("系统提示","保存成功");
						resetValue();
					}else{
						$.messager.alert("系统提示","保存失败");
						return;
					}
				}
			});
		}
</script>
</head>
<body style="margin:15px;">
<div id="p" class="easyui-panel" title="客户服务创建" style="width:600px;height:350px;padding:10px;">
		<form id="fm" method="post">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>服务类型：</td>
	 				<td>
	 					<input class="easyui-combobox" id="serveType" name="serveType" class="easyui-validatebox" required="true" data-options="panelHeight:'auto',editable:false,valueField:'dataDicValue',textField:'dataDicValue',url:'${pageContext.request.contextPath}/dataDic/findDataDic.do?dataDicName=服务类型'"/>&nbsp;<font color="red">*</font>
	 				</td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>客户：</td>
	 				<td>
	 					<input type="text" id="customer" name="customer" class="easyui-validatebox" required="true"/>
	 					&nbsp;<font color="red">*</font>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td valign="top">概要：</td>
	 				<td colspan="4">
	 					<input type="text" id="overview" name="overview" style="width:419px " class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td valign="top">服务请求：</td>
	 				<td colspan="4">
	 					<textarea id="servicerequest" name="servicerequest" rows="5" cols="49" class="easyui-validatebox" required="true"></textarea>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td>创建人：</td>
	 				<td>
	 					<input type="hidden" name="state" value="新创建"/>
	 					<input type="text" id="createPeople" name="createPeople" class="easyui-validatebox" required="true" readonly="readonly" value="${currentUser.trueName }"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>创建时间：</td>
	 				<td><input type="text" id="createTime" name="createTime" readonly="readonly"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td colspan="4"></td>
	 				<td>
	 					<a href="javascript:saveCustomerService()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>&nbsp;&nbsp;
						<a href="javascript:resetValue()" class="easyui-linkbutton" iconCls="icon-reset">重置</a>
	 				</td>
	 			</tr>
	 		</table>
	 	</form>
</div>

</body>
</html>