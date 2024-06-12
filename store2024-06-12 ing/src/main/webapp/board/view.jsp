<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="mvc.model.BoardDTO" %>
<%
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
<!DOCTYPE html>
<html>
	<head>
		<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
		<meta charset="UTF-8">
		<title>Board</title>
	</head>
	<body>
		<jsp:include page="../header.jsp" />
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">게시판</h1>
			</div>
		</div>
		<div class="container">
			<form action="BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" method="post"
				class="form-horizontal" name="newUpdate">
				<div class="form-group row">
					<label class="col-sm-2 control-label">성명</label>
					<div class="col-sm-3">
						<input class="form-control" name="name" value="<%=notice.getName()%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-5">
						<input class="form-control" name="subject" value="<%=notice.getSubject()%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label">내용</label>
					<div class="col-sm-8" style="work-break: break-all;">
						<textarea class="form-control" name="content" cols="50" rows="5"><%=notice.getContent()%></textarea>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<c:set var="userId" value="<%=notice.getId()%>" />
						<c:if test="${sessionId == userId}">
							<p>
								<a href="./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="btn btn-danger">삭제</a>
								<input type="submit" class="btn btn-success" value="수정">
							</p>
						</c:if>
						<a href="./BoardListAction.do?pageNum=<%=nowpage%>" class="btn btn-primary">목록</a>
					</div>
				</div>
			</form>
			<hr>
		</div>
		<jsp:include page="../footer.jsp" />
	</body>
</html>