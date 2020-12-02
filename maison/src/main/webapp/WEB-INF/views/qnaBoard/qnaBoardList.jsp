<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="질문해요"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/menuTitle.jsp">
	<jsp:param name="menuTitle" value="질문해요"/>
</jsp:include>

<section id="board-container" class="container">
		<div class="row" style="margin-top:30px;">
			<div class="col-lg-12">
				<div class="title-all text-center">
					<h1>질문하기</h1>
				</div>
			</div>
		</div>

		
		<div class=row>
			<div class="col-lg-12">
				<div class="talbe-main table-responsive">
			        <table id="tbl-board" class="table table-hover">
			            <thead>
				            <tr>
				                <th>번호</th>
				                <th>제목</th>
				                <th>작성자</th>
				                <th>작성일</th>
				            </tr>
			            </thead>
			            <c:forEach var="q" items="${list }" varStatus="status">
			            		<c:set var="num" value="${totalData-((cPage-1)*10)-status.index}"/>
			            	<tr>
			            		<td>${num }</td>
			            		<c:if test="${q.qnaSecret eq 'secret'}">
				            		<td>
				            			<script>
				            				
				            			</script>
				            			<a id="aTag" href="${path}/qnaBoard/popup.do?pw=${q.qnaPw}&no=${q.qnaNO}" onclick="window.open(this.href,'','width=300,height=200,scrollbars=no,location=no,left=800,top=300'); return false;"><c:out value="${q.qnaTitle }"/>  <i class="fas fa-lock"></i>
				            				<c:if test="${q.qnaStatus eq '미답변'}">
				            				<span id="qnaStatus" style="color:red;">${q.qnaStatus}</span>
				            				</c:if>
				            				
				            				<c:if test="${q.qnaStatus eq '답변완료'}">
				            				<span id="qnaStatus" style="color:green;">${q.qnaStatus}</span>
				            				</c:if>
				            			</a>
				            		</td>
	
				            		        		
			            		</c:if>
			            		<c:if test="${q.qnaSecret eq 'open'}">
			            			<td>
			            				<a href="${path}/qnaBoard/qnaBoardView.do?no=${q.qnaNO}"><c:out value="${q.qnaTitle }"/>
			            					<c:if test="${q.qnaStatus eq '미답변'}">
				            					<span id="qnaStatus" style="color:red;">${q.qnaStatus}</span>
				            				</c:if>
				            				
				            				<c:if test="${q.qnaStatus eq '답변완료'}">
				            					<span id="qnaStatus" style="color:green;">${q.qnaStatus}</span>
				            				</c:if>
			            				</a>
			            			</td>
			            		</c:if>
			            		<td><c:out value="${q.memberId }"/></td>
			            		<td><c:out value="${q.qnaDate }"/></td>
			           
			            	</tr>
			            	
						<c:set var="num" value="${num-1 }"></c:set>
			
			            </c:forEach>
				            			 
			        </table> 
				</div>
			</div>
			<c:if test="${loginMember.memberId != null}">
				<div style="margin-left:900px;">
					<button class="btn">내글보기</button>&nbsp;
			        <button type="button" value="글쓰기" id="btn-add" class="btn" onclick="location.href='${path}/qnaboard/qnaboardEnroll.do'" style="background:#FCF7E1;float:right">글쓰기</button>
				</div>
			</c:if>	
		</div>
					 
				 	
		<div class="row" style="margin-top:25px;margin-bottom:50px;">
			<div class="col-lg-12">
		        <div id="pageBar">
		        	<%-- <%=PageBarFactory.getPageBar(request.getAttribute("totalData"), , numPerPage, uri) %> --%>
		        	${pageBar }
		        	
		        </div>
	        </div>
		</div>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>		