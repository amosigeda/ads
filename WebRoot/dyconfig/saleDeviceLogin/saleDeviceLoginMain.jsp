<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="com.godoing.rose.http.common.*"%>
<%@ page import="com.care.common.lang.*"%>
<%@ page import="com.care.common.config.Config"%>
<%@ page import="com.care.app.LoginUser"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>
<%@ page autoFlush="true"%>
<%
	/*ҳ������*/
	PagePys pys = (PagePys) request.getAttribute("PagePys");
	LoginUser loginUser = (LoginUser)request.getSession().getAttribute(Config.SystemConfig.LOGINUSER); 
%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>�ޱ����ĵ�</title>
		<link href="<%=request.getContextPath()%>/css/tbls.css"
			rel="stylesheet" type="text/css">
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/public/public.js"></script>   <!-- ���ô˷��� -->
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/public/My97DatePicker/WdatePicker.js"></script>
	</head>
	<script type="text/javascript">
function finds(){
    var st = new Date(frmGo.startTime.value.replace(/-/g,'/'));
	var et = new Date(frmGo.endTime.value.replace(/-/g,'/'));
	if(Date.parse(st) - Date.parse(et)>0){
		alert("��ʼʱ�䲻�ܴ��ڽ���ʱ��!");
		return false;
	}
	
	var loginNumValue1 = document.getElementById("loginNum1").value;
	var loginNumValue2 = document.getElementById("loginNum2").value;	 
	if((loginNumValue1 && isNaN(loginNumValue1))||(loginNumValue2 && isNaN(loginNumValue2))){
		 alert("��¼��������Ϊ����!");
		 return false;
	 }
	if(loginNumValue1>loginNumValue2){
		alert("��¼��ʼ��������С�ڻ���ڵ�¼��������!");
		return false;
	}
	 
	frmGo.submit();
}
function c(){
    document.all.startTime.value="";
    document.all.endTime.value="";
    document.all.serieNo.value="";
    document.all.loginNum1.value="";
    document.all.loginNum2.value="";
    document.getElementById("belongProject").options[0].selected=true;
    document.getElementById("status").options[0].selected=true;
} 

</script>
	<body>
		<span class="title_1"></span>
		<form name="frmGo" method="post"
			action="doSaleDeviceLogin.do?method=querySaleDeviceLogin">
			<%if(request.getAttribute("fNow_date") != null && !"".equals(request.getAttribute("fNow_date"))){ %>
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
		 <%} %>
			<% if(request.getAttribute("imei") != null && !request.getAttribute("imei").equals("")){%>
			<table class="table_1" style="font-size:14px;margin-bottom:5px;">
			   <tr>  
			     <td>
			                      ��ǰIMEI:
			              <font color="#FFA500">
			               <strong ><%=request.getAttribute("imei") %></strong>
			               <input type="hidden" name="imei" value="<%=request.getAttribute("imei") %>"/>
			            </font>
			     </td>
			   </tr>
			</table>
		 <%} %>	
			<table width="100%" class="table" border=0 cellpadding="0" cellspacing="1">
               <tr>
                <th colspan="13" nowrap="nowrap" align="left">
		                �����豸��¼
                </th>
                </tr>
                <% if(request.getAttribute("imei") == null){%>
                 <tr class="title_3">
                       <td colspan="13">
					APP�ϱ�����
                    	    <input name="startTime" type="text" class="txt_1"  id="startTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker()"
								size="9" readonly> -
							<input name="endTime" type="text" class="txt_1" id="endTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker()"
								size="9" readonly>						
					MAC
						 <input id="serieNo" name="serieNo" type="text" class="txt_1" 
						    value="<%CommUtils.printReqByAtt(request,response,"serieNo");%>" size="15">	
					�������Ӵ���
						<input id="loginNum1" name="loginNum1" type="number" min="0" class="txt_number"
							value="<%CommUtils.printReqByAtt(request,response,"loginNum1"); %>"/>
						-<input id="loginNum2" name="loginNum2" type="number" min="0" class="txt_number"
							value="<%CommUtils.printReqByAtt(request,response,"loginNum2"); %>"/>
					��Ŀ
							<%String belongProject = (String)request.getAttribute("belongProject"); %>
							<select id="belongProject" name="belongProject">
								<option value="">ȫ��</option>
								<logic:iterate id="pro" name="project">
									<bean:define id="projectId" name="pro" property="id" type="java.lang.Integer" />																	
									<option value='<%=projectId %>' <%=String.valueOf(projectId).equals(belongProject)? "selected" : "" %>><bean:write name="pro" property="project_name"/></option>
								</logic:iterate>
							</select>	
						<input name="find1" type="button" class="but_1" accesskey="f"
							tabindex="f" value="�� ��" onclick="javascript:finds()">
					     <input name="clear" type="button" class="but_1" accesskey="c"
						    tabindex="c"  value="�������" onclick="c()">
				</tr> 
				<%} %>
				<%int i=1; %>
                  <tr class="title_2">  
                    <td width="8%" >APP�ϱ�ʱ��</td>
                  	<td width="6%" >��Ŀ</td>
                  	<td width="6%" >MAC</td>
                  	<td width="12%">�豸ʹ��ʱ��</td>
                  	<td width="6%" >�������Ӵ���</td>            	 
                  	<td width="8%">�ֻ��ͺ�</td>
                  	<td width="6%" >OS�汾</td>
                  	<td width="6%">APP�汾</td>
                  	<td width="8%">�������汾</td>
                  	<td width="6%">�ֻ���</td> 
                  	<td width="6%">IMSI</td>
                  	<td width="6%">IP</td>             	     						 
                  	<td width="8%">������</td>
				</tr>
 
				<logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"' onmouseout='this.className="tr_5"' >						
						<td><bean:write name="element" property="dTime" format="yyyy-MM-dd HH:mm:ss"/></td>
						<td><a style="color: #0000FF"  
								href="../../dyconfig/projectInfo/doProjectInfo.do?method=queryProjectInfo&projectId=<bean:write name="element" property="belong_project" />">
									<bean:write name="element" property="project"/>
							</a></td>
						<td><a style="color: #0000FF"
								href="../saleDeviceLogin/doSaleDeviceLogin.do?method=querySaleDeviceLogin&imei=<bean:write name="element" property="imei" />">
							<bean:write name="element" property="imei" />
							</a>
						</td>
						<td><bean:write name="element" property="start_time"/>--<bean:write name="element" property="end_time"/></td>
						<td><bean:write name="element" property="bt_times" /></td>	
						<td><bean:write name="element" property="phone_model"/></td>
						<td><bean:write name="element" property="sys_version"/></td>
						<td><bean:write name="element" property="app_version" /></td>
						<td><bean:write name="element" property="server_version" /></td>
						<td><bean:write name="element" property="phone" /></td>
						<td><bean:write name="element" property="imsi" /></td>
						<td><bean:write name="element" property="ip" /></td>
						<td><bean:write name="element" property="province"/></td>
					</tr> 
				</logic:iterate> 

			  	<tr class="title_3">
					<td colspan="13" align="left" >  
						<%
							pys.printGoPage(response, "frmGo");
						%>
					</td>
				</tr>  
			</table>
		</form>
	</body>
</html>