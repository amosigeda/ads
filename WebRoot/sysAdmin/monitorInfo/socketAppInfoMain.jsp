<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="com.care.common.lang.*"%>
<%@ page import="com.godoing.rose.http.common.*"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>
<%@ page autoFlush="true"%>
<%
  PagePys pys = (PagePys) request.getAttribute("PagePys");
  String moniSwitch = (String)request.getAttribute("moniSwitch");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
<link href="<%=request.getContextPath()%>/css/tbls.css" rel="stylesheet"
	type="text/css">
<script language="JavaScript"
	src="<%=request.getContextPath()%>/public/public.js"></script>
<script language="JavaScript"
	src="<%=request.getContextPath()%>/public/My97DatePicker/WdatePicker.js"></script>


</head>
<script language="javascript">
function finds(){
	  var st = new Date(frmGo.startTime.value.replace(/-/g,'/'));
		var et = new Date(frmGo.endTime.value.replace(/-/g,'/'));
		if(Date.parse(st) - Date.parse(et)>0){
			alert("��ʼʱ�䲻�ܴ��ڽ���ʱ��!");
			return false;
		}

	/* var costTime1 = document.getElementById('costTime1').value;
	var costTiem2 = document.getElementById('costTime2').value;
	   if(!isNumber(costTime1.trim()) && costTime1.trim() !=""){
	   alert("����ʱ�䷶Χ����д����");
	    frmGo.costTime1.focus();
	    return false;
	}
	if(!isNumber(costTiem2.trim()) && costTiem2.trim() !=""){
	   alert("����ʱ�䷶Χ����д����");
	    frmGo.costTime2.focus();
	    return false;
	}
	if(parseInt(costTime1.trim()) > parseInt(costTiem2.trim())){
	   alert("����Ľ�������ʱ�䲻�ܴ��ڿ�ʼ����ʱ��,����������");
	   frmGo.costTime2.focus();
	   return false;
	} */
	frmGo.submit();
}
function c(){
    document.all.startTime.value="";
    document.all.endTime.value="";
    document.all.serieNo.value="";
    document.all.jieKou.value="";
    document.all.duanKou.value="";
}

</script>
<body>
	<span class="title_1"> </span>
	<form name="frmGo" method="post"
		action="doMonitorInfo.do?method=queryAppSocketInfo">
		<%-- 	<%if(request.getAttribute("fNow_date") != null && !"".equals(request.getAttribute("fNow_date"))){ %>
			<table class="table_1" style="font-size:14px;margin-bottom:5px;">
			   <tr>  
			     <td>
			                      ʱ�䷶Χ:
			              <font color="#FFA500">
			               <strong >
			               <%=request.getAttribute("fNow_date") %>		            
			                                                       ��
			               <%=request.getAttribute("now_date") %></strong>
			            </font>
			     </td>
			   </tr>
			</table>
		 <%} %> --%>
		<table width="100%" class="table">
			<tr>
				<th colspan="13" nowrap="nowrap" align="left">socket��ع���</th>
			</tr>
			<tr class="title_3">
				<td colspan="13">ʱ�䷶Χ <input name="startTime" type="text"
					id="startTime" style="cursor:text"
					value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" size="15"
					class="Wdate" readonly> - <input name="endTime" type="text"
					id="endTime" style="cursor:text"
					value="<%CommUtils.printReqByAtt(request,response,"now_date");%>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" size="15"
					class="Wdate" readonly> �ֻ���<input id="serieNo"
					name="serieNo" type="text" class="txt_1"
					value="<%CommUtils.printReqByAtt(request,response,"serieNo");%>"
					size="12"> �ӿ�<input id="jieKou" name="jieKou" type="text"
					class="txt_1"
					value="<%CommUtils.printReqByAtt(request,response,"jieKou");%>"
					size="14"> 
						�˿�<input id="duanKou" name="duanKou" type="text"
					class="txt_1"
					value="<%CommUtils.printReqByAtt(request,response,"duanKou");%>"
					size="8"><input name="find1" type="button" class="but_1"
					accesskey="f" tabindex="f" value="�� ��" onclick="javascript:finds()">
					<input name="clear" type="button" class="but_1" accesskey="c"
					tabindex="c" value="�������" onclick="c()">
			</tr>
			<tr class="title_2">

				<td width="13%">����ʱ��</td>
				<td width="15%">�ֻ���</td>
				<td width="10%">��Ŀ</td>
				<td width="10%">����ʱ��(ms)</td>
				<td width="10%">IP</td>
				<td width="5%">PORT</td>
				<td width="15%">�ӿ�</td>
				<td width="10%">��������(B)</td>
			</tr>

			<logic:iterate id="element" name="pageList">
				<tr class="tr_5" onmouseover='this.className="tr_4"'
					onmouseout='this.className="tr_5"'>
					<td><bean:write name="element" property="update_time"
							format="yyyy-MM-dd HH:mm:ss" /></td>
					<td>
					<a style="color: #0000FF"
								href="../../dyconfig/appUserInfo/doAppUserInfo.do?method=queryAppUserInfo&user_id=<bean:write name="element" property="user_id" />">
								<bean:write name="element" property="user_id"/>
							</a>
					<%-- <bean:write name="element" property="user_id" /> --%></td>
					<td>
					<a style="color: #0000FF"  
								href="../../dyconfig/projectInfo/doProjectInfo.do?method=queryProjectInfo&projectId=<bean:write name="element" property="b_g" />">
									<logic:equal name="element" property="b_g" value="12">����ͨ</logic:equal>
									<logic:equal name="element" property="b_g" value="16">����ɭ</logic:equal>
									 </a>
				<%-- 	<logic:equal name="element" property="b_g" value="12">����ͨ</logic:equal> --%>
						<logic:empty name="element" property="b_g">��</logic:empty></td>
					<td><bean:write name="element" property="xingneng" /></td>
					<td><bean:write name="element" property="client_ip" /></td>
					<td><bean:write name="element" property="client_port" /></td>
					<td><bean:write name="element" property="socket_name" /></td>
					<td><bean:write name="element" property="liang" /></td>
				</tr>
			</logic:iterate>
			<tr class="title_3">

				<td align="left" colspan="8">
					<%
							pys.printGoPage(response, "frmGo");
						%>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>