<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//페이지에 몇 개 표시?
	final int PAGE_ROW_COUNT = 5;
	//하단 페이지를 몇 개 표시?
	final int PAGE_DISPLAY_COUNT = 5;
	//보여줄 페이지 번호를 1
	int pageNum = 1;
	//페이지 번호 파라미터에서 읽어오기
	String strPageNum = request.getParameter("pageNum");
	//페이지 번호가 넘어온다면
	if(strPageNum != null){
		pageNum = Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 RowNum
	int startRowNum = 1 + (pageNum-1) * PAGE_ROW_COUNT;
	int endRowNum = pageNum * PAGE_ROW_COUNT;
	
	//하단 시작 페이지번호
	int startPageNum = 1 + ((pageNum-1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
	//전체 글의 갯수
	int totalRow = CafeDao.getInstance().getCount();
	//전체 페이지의 갯수
	int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 전체 페이지의 갯수보다 크게 계산되면 잘못된 것
	if(endPageNum>totalPageCount){
		endPageNum = totalPageCount;
	}
	//CafeDto 객체를 생성해서
	CafeDto dto = new CafeDto();
	//위에서 계산한 startRowNum과 endRowNum을 담고
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	//CafeDto를 인자로 전달해서 글 목록을 얻어온기
	List<CafeDto> list = CafeDao.getInstance().getList(dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath}/cafe/private/insertform.jsp">글쓰기</a>
		<h3>카페 글 목록입니다.</h3>
		<table class="table table-striped-columns">
			<thead class="table-dark">
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>				
					<%for(CafeDto tmp : list){ %>
						<tr>
							<td><%=tmp.getNum() %></td>
							<td><%=tmp.getWriter() %></td>
							<td>
								<a href="detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle() %></a>
							</td>
							<td><%=tmp.getViewCount() %></td>
							<td><%=tmp.getRegdate() %></td>
						</tr>
					<%} %>
			</tbody>
		</table>
		<nav>
			 <ul class="pagination">
				 <%if(startPageNum != 1) {%>
				 	<li class="page-item">
				 		<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1%>">Prev</a>
				 	</li>
				 <%}%>
			
				<%for(int i=startPageNum; i<=endPageNum; i++){ %>
					<li class="page-item <%=pageNum == i? "active" : ""%>">
						<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%} %>
				
				 <%if(endPageNum < totalPageCount){%>
				 <li class="page-item">
				 	<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1%>">Next</a>
				 </li>
				 <%}%>	
			</ul>
		</nav>
	</div>
</body>
</html>