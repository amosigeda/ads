<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="com.godoing.rose.http.common.*"%>
<%@ page import="com.godoing.rose.lang.*"%>
<%@ page import="com.care.common.lang.*"%>
<%@ page import="com.care.common.config.Config"%>
<%@ page import="com.care.app.LoginUser"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>
<jsp:useBean id = "serviceInfo" scope = "request" class = "com.godoing.rose.lang.DataMap"/>
<%@ page autoFlush="true"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>�ޱ����ĵ�</title>
		<link href="<%=request.getContextPath()%>/css/tbls.css"
			rel="stylesheet" type="text/css">
		<script language="JavaScript"
			src="../../public/public.js"></script>
		<script type="text/javascript" language="JavaScript" src="../../js/jquery-1.8.2.js"></script>
	</head>
	<script language="javascript">
function onUpdate(){
	var vc = document.getElementById("versionCode");
	if(vc.value==""){
		alert("����Ϊ��");
		return false;
	}
    if(frmGo.file1.value.length == 0){
    	if(frmGo.downloadPath.value.length == 0){
    		alert("��ѡ��һ��ZIP�ļ���");
    	return false;
    	}    	    	
    }else{
    	tagChange();
    	//if(frmGo.remarks.value.trim().length > 30){
		//alert("��ע���ܳ���30��");
		//frmGo.remarks.focus();
		//return false;
		//}
	}
	
    	frmGo.target="";               //����Ŀ�괰�ڲ�����
    	frmGo.action="doCheckInfo.do?method=updateZip";
    	frmGo.submit();       
}
function onView(){
	var download = frmGo.downloadPath.value;
	if(download.length == 0){
		alert("û���ϴ�ZIP�ļ����޷����أ�");
		return false;
	}
	frmGo.action="doCheckInfo.do?method=downloadApk&download="+download;
   	frmGo.submit();
}
function callback(msg)
{
	if(msg == 0){
		frmGo.versionName.value="";
		frmGo.packageName.value="";	
		frmGo.versionCode.value="";
		frmGo.functionCap.value="";
		frmGo.downloadPath.value="";
	}else{
		var apkInfos=msg.split("@");
		
		frmGo.versionName.value=apkInfos[0];
		frmGo.packageName.value=apkInfos[1];	
		frmGo.versionCode.value=apkInfos[2];
		if(apkInfos.length == 4){
			frmGo.functionCap.value="";
		}
		if(apkInfos.length == 5){
			frmGo.functionCap.value=apkInfos[3];
			frmGo.downloadPath.value=apkInfos[4];
		}
	}
}
function tagChange(){
    frmGo.functionCap.innerHTML = '';
	var filePaths=frmGo.file1.value.split("\\");
	//alert(frmGo.file1.value);
	var apkName=filePaths[filePaths.length-1];
	apkName = apkName.substring(apkName.lastIndexOf('.')+1,apkName.length);
	//alert(apkName);
	if(apkName!="zip"&&apkName!="ZIP"){
		alert("�����ϴ���ZIP�ļ���");
		frm.file.focus();
		return false;
	}
	frmGo.action="doCheckInfo.do?method=getZipMessage";
	frmGo.submit();
}
function preViews(){
     document.getElementById('preView').style.display="none"
	 document.getElementById('rePicture').style.display="none"
	 document.getElementById('pictureView').style.display="block"
}
var xmlHttp;
function changeProject(obj){
	var url = "doCheckInfo.do?method=getCheckInfo&belongProject="+obj;
	getHttpObject();
	xmlHttp.open("get",url,false);
	xmlHttp.onreadystatechange=handleStateChange;
	xmlHttp.send(null);
}

function getHttpObject(){
	try{
		xmlHttp = new XMLHttpRequest();
	}catch(e){
		try{
			xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
}


 // ��������Ϣ����
function handleStateChange(){ 
  	if (xmlHttp.readyState == 4) { // �ж϶���״̬ 			 		 
  	       if (xmlHttp.status == 200) { // ��Ϣ �Ѿ��ɹ����أ���ʼ������Ϣ 	        
  	           var result = xmlHttp.responseText; 	        
  	           callback(result);   
  	       }
  	   }
  }
  
function changePro(obj){
	frmGo.downloadPath.value="";
	frmGo.versionName.value="";
	frmGo.packageName.value="";	
	frmGo.versionCode.value="";
	frmGo.functionCap.value="";
	frmGo.action="doCheckInfo.do?method=uploadApk&belongProject="+obj;
	frmGo.submit();
}


</script>
	<body>
	<body>
		<span class="title_1"></span>
		<form name="frmGo" method="post" action="doCheckInfo.do?method=uploadZip" encType="multipart/form-data" target="hidden_frame">
			<input name="downloadPath" type="hidden" />
			<table width="100%" class="tbl_11" border=0 cellpadding="0" cellspacing="1" >
               <tr>
                  <th colspan="13" nowrap="nowrap" align="left">
                                                                ������
                  </th>
                </tr>
                <%int i=0;
     %>
    <tr class="tb1_11">
    	<td  width="8%" align="left">&nbsp;&nbsp;&nbsp;��Ŀ</td>
    	<td  width="20%">   		
    		<logic:iterate id="element" name="projectList">
    		<bean:define id="projectId" name="element" property="id" type="java.lang.Integer"/>
    		<%
    		i++; 
    		if(i%5==1 && i!=1){%>
    		<br/>
    		<%}%>    		
    		<input type="radio" id='belongProject'<bean:write name="element" property="id"/> name='belongProject' value=<bean:write name="element" property="id"/> <%if(i==1){ %>checked="checked" <%} %>/> 		  
    		<bean:write name="element" property="project_name" />    	
   			 </logic:iterate>
    	</td>
    </tr>
    <tr class="tbl_11">
    <td  width="6%" align="center">�̼�·��</td>
    <td  width="40%"><div align="left">
		<input  name="rePicture" id="rePicture" value="�����ϴ�" type="button" onclick="preViews();" />
		<div id="pictureView" style="display:none;" >
		  <input name="file1" type="file"/>
		</div>
    	<input name="preView" id="preView" value="����"  type="button" onclick="onView('<%=serviceInfo.getAt("download_path")%>');" />
        <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
    </div></td>
    </tr>
    <tr class="tbl_11">
    <td  width="6%" align="center">�̼�����</td>
    <td  width="40%"><div align="left">
		 <input name="versionName" type="text" value="<%=serviceInfo.getAt("version_name")%>" class="txt_1" maxlength="100">
         <font color="red">*</font>
    </div></td>
    </tr>
    <tr class="tbl_11">
    <td  width="6%" align="center">�̼��汾��</td>
    <td  width="40%"><div align="left">
		 <input name="versionCode" type="text" value="<%=serviceInfo.getAt("version_code")%>" class="txt_1" maxlength="100" onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData(text).replace(/[^\d]/g,''))" id="versionCode">
         <font color="red">*</font>
    </div></td>
    </tr>
    <tr class="tb1_11">
    <td width="6%" align="center">����˵��</td>
    <td width="20%"><div align="left">
      <textarea name="functionCap" rows="5" cols="30" class="txt_1"><%=serviceInfo.getAt("function_cap") %></textarea>    
    </div></td>
   <td width="30%"></td>
    </tr>
    <tr class="tbl_11">
      <td></td>
      <td>
        <input type="button" name="back"accesskey="b" tabindex="b" value="�� ��" class="but_1" onclick="location='doCheckInfo.do?method=queryFirmDevice'"  style="font-size:12;width:50px;height:21px;">
        <input type="button" name="ok" accesskey="y" tabindex="y"  value="ȷ��" onclick="onUpdate();" class="but_1">
      </td>
    </tr>
			</table>
		</form>
	</body>
	</body>
</html>