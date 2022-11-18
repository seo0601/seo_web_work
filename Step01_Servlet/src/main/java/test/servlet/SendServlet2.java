package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send2")
public class SendServlet2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//post 방식 전송 파라미터를 추출하기 전에 한글이 깨지지 않도록 인코딩 설정하기
		req.setCharacterEncoding("utf-8");
		
		String msg = req.getParameter("msg");
		
		System.out.println("msg:"+msg);
		
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정(내가 html로 응답할거고 utf-8형식으로 할거야라고 설정하기)
		resp.setContentType("text/html; charset=utf-8");

		//웹서버에 요청을 한 클라이언트에게 문자열을 출력할 수 있는 객체의 참조 값 얻어내기
		PrintWriter pw = resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset=\"utf-8\">");
		pw.println("<title>메세지 전송 결과 페이지2</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>메세지 잘 받았어 클라이언트야!</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();//닫아주기
	}
}
