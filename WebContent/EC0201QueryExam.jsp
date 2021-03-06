<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'???Թ???')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
   <title>???Թ???</title>
   <link rel="stylesheet" href="css/tstyle.css">
   <link rel="stylesheet" href="css/mstyle.css">
   <style type="text/css">
      tr
     {
        height:38px;
        font-size:15;
     }
     td
     {
         text-align:center;
         width:50px;
         height:38px;
     }
   </style>
   
   <script type="text/javascript">
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("del");
    	  vdel.disabled=(count==0);
      }
      
      function onEdit(vaab601)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/EC0201FindByIdExam.html?aab601="+vaab601;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaab601)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/EC0201DelByIdExam.html?aab601="+vaab601;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
      function onPaper(vaab601)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/EC0202QueryPaper.html?aab601="+vaab601;
    	 //alert(vform.action);
    	 vform.submit();
      }
    </script>
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
   <div class="card" style="max-width: 100%; " align="center">
     <div class="card-body" style="max-width:100%" align="center">

		<form id="myform" action="<%=path%>/EC0201QueryExam.html" method="post">
		  <!-- ??ѯ?????? -->
			<h4 align="center">???Թ???</h4>
			<table class="table-bordered" border="1" width="100%" align="center">
			  <tr>
			    <td style="min-width:90px" colspan="4">??ѯ????</td>
			  </tr> 
			  <tr>
			    <td >???Ա???</td>
			    <td>
			      <e:text styleClass="form-control" name="qaab601" style="width:100%"/>
			    </td>
			    <td>?༶????</td>
			    <td>
			      <e:text styleClass="form-control" name="qaab303" style="width:100%"/>
			    </td>
			  </tr>	  
			  <tr>
			    <td>??ʼ????</td>
			    <td>
			      <e:date styleClass="form-control" name="qaab603"/>
			    </td>
			    <td>????????</td>
			    <td>
			      <e:date styleClass="form-control" name="paab603"/>
			    </td>
			  </tr>
			  <tr>
			    <td>??ʼʱ??</td>
			    <td>
			      <input class="form-control" type="time"  name="qaab604" style="width:100%"/>
			    </td>
			    <td>????ʱ??</td>
			    <td>
			      <input class="form-control" type="time"  name="qaab605" style="width:100%"/>
			    </td>
			  </tr>
			</table>
			<!-- ???ݵ????? -->
			<table id="planlist" class="table-bordered" border="1" width="100%" align="center">
			  <tr>
			    <td>#</td>
			    <td>????</td>
			    <td>???Ա???</td>
			    <td>?༶????</td>
			    <td style="width: 70px;">????????</td>
			    <td>??ʼʱ??</td>
			    <td>????ʱ??</td>
			    <td>???Եص?</td>
			    <td colspan="3">??????</td>
			  </tr>
			  <!--
			         ע??????
			    1.$???????ŵĽ??????? }??˫????֮??,?????????ֿո?
			    2.???е?????֮??????Ҫ??һ???ո?,???򱨴?
			    3.var ????,?൱????ҳ?涨??????????,????  ins??????????$ {  }
			   -->
			   <c:choose>
			     <c:when test="${rows!=null }">
			         <!-- ??ʾʵ?ʲ?ѯ???????? -->
				     <c:forEach items="${rows }" var="ins" varStatus="vs">
			    	   	  <tr>
						    <td>
						      <input type="checkbox" name="idlist" value="${ins.aab601 }"
						             onclick="onSelect(this.checked)" >
						    </td>
						    <td>${vs.count }</td>
						    <td>${ins.aab602 }</td>				    
						    <td>${ins.aab303 }</td>
						    <td style="width: 70px;">${ins.aab603 }</td>
						    <td>${ins.aab604 }</td>
						    <td>${ins.aab605 }</td>
						    <td>${ins.aab606 }</td>
						    <td>
						      <button class="btn btn-primary mr-2" onclick="onEdit('${ins.aab601}')">?޸?</button>
						    </td>
						    <td>
						      <button class="btn btn-danger mr-2" onclick="onDel('${ins.aab601}')">ɾ??</button>
						    </td>
						    <td style="width:70px;">
						      <button class="btn btn-primary mr-2" onclick="onPaper('${ins.aab601}')">?鿴?Ծ?</button>
						    </td>
						  </tr>
				      </c:forEach>
				      <!-- ???????? -->
				      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="${(fn:length(rows)%10>0)?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows)) }">
					          <tr>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td style="width: 70px;"></td>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td style="width:70px;"></td>
					          </tr>
				      </c:forEach>
			     </c:when>
			     <c:otherwise>
			        <c:forEach begin="1" step="1" end="10">
			           <tr>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td style="width: 70px;"></td>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td style="width:70px;"></td>
			           </tr>
			        </c:forEach>
			     </c:otherwise>
			   </c:choose>
			</table>
	<div class="form-group" align="center" style="margin-top:15px">
		<div class="gridItem" style="padding: 5px; width: 40%; float: left; text-align: right; height: 20px; font-size: 15px;" > 
	        ???? <span id="spanTotalInfor">${fn:length(rows) }</span> ????¼     
	        ??ǰ??<span id="spanPageNum"></span>ҳ     
	        ??<span id="spanTotalPage"></span>ҳ
	    </div>
	    <div class="gridItem" style="margin-left:50px;width: 40%;  padding: 5px; float: left; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;">   
	            <span id="spanFirst" >??ҳ</span> 
	            <span id="spanPre">??һҳ</span>
	            <span id="spanInput" style="margin: 0px; padding: 0px 0px 4px 0px; height:100%; "> 
	                ??<input id="Text1" type="text" class="TextBox" onkeyup="changepage()"   style="height:20px; text-align: center;width:50px" />ҳ 
	            </span>
	            <span id="spanNext">??һҳ</span> 
	            <span  id="spanLast">βҳ</span> 
	     </div>
	</div>
	<!-- ???ܰ?ť?? -->
	<div style="width:100%;margin-top: 25px;float:left" align="center" >		
	<div class="form-group" align="center" >
			       <button type="submit" name="next" class="btn btn-primary mr-2" >??ѯ</button>
			       <button type="submit" name="next" class="btn btn-success mr-2"
			              formaction="<%=path%>/EC0201AddExam.jsp">????</button>
			       <button type="submit" id="del" name="next" value="ɾ??" class="btn btn-danger mr-2"  
			              formaction="<%=path%>/EC0201DelExam.html"  disabled="disabled">????ɾ??</button>
	</div>
	</div>
	</form>
	</div>
	</div>
	</div>
	<script type="text/javascript">
            var theTable = document.getElementById("planlist");
            var txtValue = document.getElementById("Text1").value;
            var numberRowsInTable = ${(fn:length(rows)%10>0)?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows)) };//????????????
            var colunm=${fn:length(rows) };
    </script>
<script type="text/javascript" src="js/Pagging.js"></script>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>