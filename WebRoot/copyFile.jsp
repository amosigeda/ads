<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import = "com.godoing.rose.http.common.*" %>
<%@ page import = "com.godoing.rose.lang.*" %>

<jsp:useBean id = "companyInfo" scope = "request"  class = "com.godoing.rose.lang.DataMap"/>
<%@ page autoFlush="true" %>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="<%=request.getContextPath()%>/css/tbls.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="<%=request.getContextPath()%>/public/public.js"></script>
<title>�ļ�����</title>
</head>
<script language="javascript">
function onUpdate(){
	if (frmGo.yuan.value ==""){
		alert("Դ�ļ���ַ����Ϊ�գ�");
		frmGo.yuan.focus();
		return false;
	}
	if (frmGo.mubiao.value ==""){
		alert("Ŀ���ַ����Ϊ�գ�");
		frmGo.mubiao.focus();
		return false;
	}

	frmGo.submit();
}


</script>
<body>
<span class="title_1"></span>
<form name="frmGo" method="post" action="dyconfig/userRegisterInfo/doRegisterUser.do?method=copyFile" onsubmit="return onUpdate()">
<table width="100%" border="0"cellpadding="0" cellspacing="1"  class="tbl_11"> 
  <tr>
     <th colspan="13" nowrap="nowrap" align="left">
                          �ļ�����
     </th>
   </tr>
  <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;Դ�ļ���ַ</td>
    <td width="20%" align="left">
    	<input name="yuan" id="yuan" type="text" class="txt_1" maxlength="50"/>
    </td>
  </tr>
  
    <tr class="tr_11">
    <td width="7%" align="left">&nbsp;&nbsp;���Ƶ�</td>
    <td width="20%" align="left">
    	<input name="mubiao" id="mubiao" type="text" class="txt_1" maxlength="50"/>
    </td>
  </tr>


  <tr  class="tr_11"> 
    <td></td>
    <td  align="left">&nbsp;&nbsp;&nbsp;<input type="button" name="ok" accesskey="y" tabindex="y"  value="ȷ ��" class="but_1" onclick="onUpdate()">
       <input type="reset" name="back" accesskey="b" tabindex="b" value="����" class="but_1" >
    </td>	     
    </td>
    <td></td>
  </tr>
</table>
</form>
</body>
</html>