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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">

	var url;
	
	$(function(){
		$("#assignMan").combobox({
			onSelect:function(record){
				if(record.id!=''){
					$("#assignTime").val(getCurrentDateTime());
				}else{
					$("#assignTime").val("");
				}
			}
		});
	});
	
	function searchSaleChance(){
		$("#dg").datagrid('load',{
			"customerName":$("#s_customerName").val(),
			"overView":$("#s_overView").val(),
			"createMan":$("#s_createMan").val(),
			"state":$("#s_state").combobox("getValue")
		});
	}
	
	function deleteSaleChance(){
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
				$.post("${pageContext.request.contextPath}/saleChance/delete.do",{ids:ids},function(result){
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
	
	
	function openSaleChanceAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加销售机会信息");
		$("#createTime").val(getCurrentDateTime());
		$("#createMan").val('${currentUser.trueName }');
		url="${pageContext.request.contextPath}/saleChance/save.do";
	}
	
	
	function saveSaleChance(){
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
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","保存失败");
					return;
				}
			}
		});
	}
	
	function openSaleChanceModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑销售机会信息");
		$("#customerName").val(row.customerName);
		$("#chanceSource").val(row.chanceSource);
		$("#linkMan").val(row.linkMan);
		$("#linkPhone").val(row.linkPhone);
		$("#cgjl").numberbox('setValue', row.cgjl);
		$("#overView").val(row.overView);
		$("#description").val(row.description);
		$("#createMan").val(row.createMan);
		$("#createTime").val(row.createTime);
		$("#assignMan").combobox("setValue",row.assignMan);
		$("#assignTime").val(row.assignTime);
		url="${pageContext.request.contextPath}/saleChance/save.do?id="+row.id;
	}
	
	function resetValue(){
		$("#customerName").val("");
		$("#chanceSource").val("");
		$("#linkMan").val("");
		$("#linkPhone").val("");
		$("#cgjl").numberbox('setValue', "");
		$("#overView").val("");
		$("#description").val("");
		$("#createMan").val("");
		$("#createTime").val("");
		$("#assignMan").combobox("setValue","");
		$("#assignTime").val("");
	}
	
	function closeSaleChanceDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function formatState(val,row){
		if(val==1){
			return "已分配";
		}else{
			return "未分配";
		}
	}
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="销售机会管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${pageContext.request.contextPath}/saleChance/list.do" fit="true" toolbar="#tb">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="id" width="50" align="center">编号</th>
	 		<th field="chanceSource" width="50" align="center" hidden="true">机会来源</th>
	 		<th field="customerName" width="100" align="center">客户名称</th>
	 		<th field="cgjl" width="50" align="center" hidden="true">成功几率</th>
	 		<th field="overView" width="200" align="center">概要</th>
	 		<th field="linkMan" width="100" align="center">联系人</th>
	 		<th field="linkPhone" width="100" align="center">联系电话</th>
	 		<th field="description" width="50" align="center" hidden="true">机会描述</th>
	 		<th field="createMan" width="100" align="center" >创建人</th>
	 		<th field="createTime" width="100" align="center">创建时间</th>
	 		<th field="state" width="100" align="center" formatter="formatState">状态</th>
	 		<th field="assignMan" width="50" align="center" hidden="true">指派人</th>
	 		<th field="assignTime" width="50" align="center" hidden="true">指派时间</th>
	 	</tr>
	 </thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openSaleChanceAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">创建</a>
			<a href="javascript:openSaleChanceModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteSaleChance()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>

		</div>
		<div>
			&nbsp;客户名称：&nbsp;<input type="text" id="s_customerName" size="20" onkeydown="if(event.keyCode==13) searchSaleChance()"/>
			&nbsp;概要：&nbsp;<input type="text" id="s_overView" size="20" onkeydown="if(event.keyCode==13) searchSaleChance()"/>
			&nbsp;创建人：&nbsp;<input type="text" id="s_createMan" size="20" onkeydown="if(event.keyCode==13) searchSaleChance()"/>
			&nbsp;分配状态：&nbsp;<select class="easyui-combobox" id="s_state"  editable="false" panelHeight="auto">
								    <option value="">请选择...</option>
									<option value="0">未分配</option>
									<option value="1">已分配</option>
								</select>&nbsp;
			<a href="javascript:searchSaleChance()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 700px;height:450px;padding: 10px 20px"
	  closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>客户名称：</td>
	 				<td><input type="text" id="customerName" name="customerName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>机会来源：</td>
	 				<td><input type="text" id="chanceSource" name="chanceSource" /></td>
	 			</tr>
	 			<tr>
	 				<td>联系人：</td>
	 				<td><input type="text" id="linkMan" name="linkMan" /></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>联系电话：</td>
	 				<td><input type="text" id="linkPhone" name="linkPhone" /></td>
	 			</tr>
	 			<tr>
	 				<td>成功几率（%）：</td>
 				<td><input type="text" id="cgjl" name="cgjl" class="easyui-numberbox" data-options="min:0,max:100" required="true"/>&nbsp;<font color="red">*</font>&nbsp;(范围是0~100)</td>
	 				<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 			</tr>
	 			<tr>
	 				<td>概要：</td>
	 				<td colspan="4"><input type="text" id="overView" name="overView" style="width: 420px"/></td>
	 			</tr>
	 			<tr>
	 				<td valign="top">机会描述：</td>
	 				<td colspan="4">
	 					<textarea rows="5" cols="50" id="description" name="description"></textarea>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td>创建人：</td>
	 				<td><input type="text" id="createMan" name="createMan" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>创建时间：</td>
	 				<td><input type="text" id="createTime" name="createTime" />&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>指派给：</td>
	 				<td>
	 					<input class="easyui-combobox" id="assignMan" name="assignMan" data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'trueName',url:'${pageContext.request.contextPath}/user/customerManagerComboList.do'"/>
					</td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>指派时间：</td>
	 				<td><input type="text" id="assignTime" name="assignTime" /></td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveSaleChance()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeSaleChanceDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>