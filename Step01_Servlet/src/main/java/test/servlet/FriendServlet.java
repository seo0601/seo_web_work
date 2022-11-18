package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friends/list")
public class FriendServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//친구 목록(sample data)이라고 가정
		List<String> names = new ArrayList<>();
		names.add("김구라");
		names.add("해골");
		names.add("원숭이");
		
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
		pw.println("<title>친구 목록 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		//names에 들어있는 친구 목록을 활용해서 친구 목록을 출력해 보세요(ul, li 요소 활용)
		pw.println("<ul>");
		for(int i=0; i<names.size(); i++) {
			pw.println("<li>"+names.get(i)+"</li>");	
		}				
		pw.println("</ul>");
		pw.println("<ul>");
		for(String tmp : names) {
			pw.println("<li>"+tmp+"</li>");	
		}
		pw.println("</ul>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();//닫아주기
		
	}
}
