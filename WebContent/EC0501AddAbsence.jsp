<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'Ñ§Éú¿¼ÇÚ')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>Ñ§Éú¿¼ÇÚ</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="myform" class="forms-sample" action="<%=path%>/EC0501AddAbsence.html" method="post">
<div class="col-10 grid-margin stretch-card" >
                <div class="card" style="width:60%;"align="center">
                  <div class="card-body" style="width:60%;" align="center">
       				<h4 align="center">¿¼ÇÚ${empty param.aab901?'¼ÇÂ¼':'ÐÞ¸Ä' }</h4>
       	    		  <div class="form-group" align="left">
                        <label for="aab103" >Ñ§Éú±àºÅ  :</label>
                        <e:text styleClass="form-control" id="aab103" name="aab103" defval="${ins.aab103}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aab902" >¿¼ÇÚÈÕÆÚ  :</label>
                        <e:date styleClass="form-control" id="aab902" name="aab902" defval="${ins.aab902}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aab903" >¿¼ÇÚ×´Ì¬  :</label>
                        <e:select styleClass="form-control" value="È±ÇÚ:1,Çë¼Ù:2" id="aab903" name="aab903" defval="${ins.aab903}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aab904" >±¸×¢  :</label>
                        <e:textarea  cols="30" rows="6" styleClass="form-control" id="aab904" name="aab904" defval="${ins.aab904}" />
                      </div>
                      <div class="form-group" align="center">
                      <button type="submit" class="btn btn-success mr-2" formaction="<%=path%>/EC0501${empty param.aab901?'Add':'Modify' }Absence.html?aab901=${param.aab901 }">${empty param.aab901?'Ìí¼Ó':'ÐÞ¸Ä'}</button>
                      <button type="submit" class="btn btn-secondary mr-2" name="next" formaction="<%=path%>/EC0501QueryAbsence.html"
                       formnovalidate="formnovalidate">·µ»Ø</button>
                      </div>
                  </div>
                </div>
              </div>
</form>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>