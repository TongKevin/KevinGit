<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.css"
	rel="stylesheet"></link>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function ajaxRequest(actionName, reqData) {
		var repData = "";
		$.ajax({
			type : "post",
			url : actionName,
			async : false,
			dataType : "json",
			data : reqData,
			beforeSend : function() {
				showloading("loadDiv");
			},
			success : function(data) {
				repData = data;
			},
			complete : function(XMLHttpRequest, textStatus) {

			},
			error : function(err) {
				console.log(err);
			}
		});
		return repData;
	};
	function btt() {
		var actionName = "myAjx.action";
		var reqData = {
			//"tc.json" : "all",
			//"tc.deptType" : "dept_type_0",
			//"tc.rank" : "rank_1",
			"tc.sex" : "男",
		//"tc.actionName" : "/dept/accountList.jsp?",
		//"tc.targetName" : "deptMain"
		}, repData = ajaxRequest(actionName, reqData);
		//$("#su").html(repData.name);
		$("#u").append(repData.sb);
		;
	}
	$(function() {
		$("#bt").click(function() {
			btt();
		});
	});
</script>
</head>
<body>
	<button type="button" class="btn btn-success" id="bt">确定</button>

	<div id="erroMsg"></div>
	<div id="su"></div>
	<div id="u"></div>
	
	<div id="loadDiv" style="display:none">
		<img src='<%=request.getContextPath()%>/images/loadings.gif' />
	</div>
</body>
</html>