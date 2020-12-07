<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="비밀번호 찾기"/>
</jsp:include>

<section>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1>로그인</h1>
		</div>		
	</div>
	<div class="container" id="login-container">
		<form action="${path }/member/loginEnd" method="POST" onsubmit="return checkSubmit();">
			<table class="table.borderless">
				<tr>
					<td>
						<div class="form-group">
					   		<input type="text" tabindex="1" class="form-control" placeholder="아이디" id="memberId" name="memberId" value="${cookie.saveId.value}">
						</div>
					</td>
					<td rowspan="2">
						<button type="submit" tabindex="3" class="btn btn-primary">로그인</button>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
					   		<input type="password" tabindex="2" class="form-control" placeholder="비밀번호" id="memberPw" name="memberPw">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group form-check">
						    <label class="form-check-label">
						      <input class="form-check-input" type="checkbox" name="saveId" id="saveId" value="1" ${cookie.saveId.value eq null || cookie.saveId.value eq ""?"":"checked"}>아이디 저장하기
						    </label>
						</div>
					</td>
				</tr>
			</table>
		</form>
		
		<table>
			<tr>
				<td colspan="2">
					<p><a href="${path}/member/findid">아이디 찾기</a></p>
					<p>|</p>
					<p><a href="${path}/member/findpw ">비밀번호 찾기</a></p>
					<p>|</p>
					<p><a href="${path }/member/enroll">회원가입</a></p>
				</td>
			</tr>
			<tr>
				<td>
					<br><p class="text-muted">소셜계정으로 메종서비스 이용하기</p>			
				</td>
			</tr>
			<tr>
				<td>
					<!-- 소셜 로그인 -->
					<a href="${path}/member/naver/login"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"></a>
				</td>
			</tr>
		</table>
	</div>	
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>		