<%@page import="test.suggestion.dao.SuggestionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 글의 번호
	int num = Integer.parseInt(request.getParameter("num"));
	
	//글의 작성자가 로그인된 아이디와 같은지 확인해 보기
	String id = (String)session.getAttribute("id");
	String writer = SuggestionDao.getInstance().getData(num).getWriter();
	
	//글 작성자가 로그인 된 id와 같지않다면
	if(!writer.equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN,"남의 글을 삭제하면 안되요");
		return; //메소드를 여기서 끝내기
	}

	//DB에서 삭제하고
	boolean isSuccess = SuggestionDao.getInstance().delete(num);
	//응답하기(리다이렉트)
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/task/list.jsp");
%>
