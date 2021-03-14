<%@ page pageEncoding="GBK" language="java" %>
<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>宿舍入住</title>

    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/tstyle.css">
    <link rel="stylesheet" href="css/mstyle.css">

    <c:choose>
        <c:when test="${empty sessionScope.role}">
            <jsp:forward page="login.jsp"></jsp:forward>
        </c:when>
        <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'入住办理')}">
            <jsp:forward page="menu.jsp"></jsp:forward>
        </c:when>
    </c:choose>

</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div><div style="width:100%" align="center">
<form name="addSup" class="forms-sample" action="<%=request.getContextPath()%>/eE0301.html" method="post">
    <div class="col-10 grid-margin stretch-card" >
        <div class="card" style="width:60%;"align="center">
            <div class="card-body" style="width:60%;" align="center">
                <h4 align="center">宿舍入住信息</h4>

        <div class="form-group" align="left">
            <label for="aab103">学生学号 :</label>
            <e:text styleClass="form-control" name="aab103" id="aab103" maxlength="8" autofocus="true" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="time">入住时长(天) :</label>
            <input type="text" class="form-control" name="time" id="time" required="required" maxlength="3"
                       onkeyup="document.getElementById('a').value=this.value*${param.aab1107}"
                       onblur="document.getElementById('a').value=this.value*${param.aab1107}">
        </div>

        <div class="form-group" align="left">
            <label for="a">住宿费用(元) :</label>
            <e:number styleClass="form-control" step="0.01" name="fee" id="a" readonly="true" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aad206">备注 :</label>
            <e:textarea styleClass="form-control" rows="5" cols="45" name="aad206" id="aad206"/>
        </div>

        <div class="form-group" align="center">
            <button type="submit" class="btn btn-success mr-2" name="next">提交</button>
            <button type="submit" class="btn btn-secondary mr-2" name="next" formaction="<%=request.getContextPath()%>/eA1001QueryForSub.html"
                        formnovalidate="formnovalidate">返回</button>
        </div>

    <input hidden="hidden" name="aab1101" value="${param.aab1101}">
    <e:hidden name="qaab1102"/>
    <e:hidden name="qaab1103"/>
    <e:hidden name="qaab1104"/>
    <e:hidden name="qaab1105"/>
            </div>
            </div>
    </div>
</form>
</div>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>
