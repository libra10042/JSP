package com.mystudy.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class Ex01_Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex01_Hello() {
    	/* 생성자
    	WAS(Web Application Server - 웹어플리케이션서버: Servlet 컨테이너,
    	JSP 컨테이너)에서
    	서블릿이 최초 등록될때(최초요청시) 한 번 만 실행
    	한 번 로딩되면 재실행되지 않는다.
    	두 번째 URL 요청부터는 service() 메소드 실행됨
    	*/
    	System.out.println(">> 생성자 실행");
    }


	public void init(ServletConfig config) throws ServletException {
		//서블릿 객체가 처음 생성된 후 최초로 한 번 실행됨
		//초기화 작업등을 처리할 때 사용
		System.out.println(">> init() 실행");
	}

	public void destroy() {
		//서버에서 서블릿이 내려갈 때(소멸될때) destroy() 호출되고 삭제됨
		//사용된 자원 반납등의 작업 처리
		System.out.println(">> destroy() 실행");
	}

	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//service() 메소드는 요청이 있을 때 마다 호출된다
		System.out.println(">> service() 실행 ==============");
		
		//요청정보를 확인해서 get, post 여부에 따라 분기 처리
		System.out.println("request.getMethod() : " + request.getMethod());
		if (request.getMethod().equalsIgnoreCase("get")) {
			doGet(request, response);
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			doPost(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//get 방식 요청이 있을 때 호출되는 메소드
		//request : 요청정보(클라이언트에서 보내온 정보, 데이더)
		//response : 응답정보(요청에 따른 결과를 전달할 정보, 데이터)
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println(">> doGet() 실행~~");
		response.getWriter().println("<h1>Hello</h1>"); //클라이언트(브라우저)쪽으로 전달
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//post 방식 요청이 있을 때 호출되는 메소드
		System.out.println(">> doPost() 실행~~");
		doGet(request, response);
	}

}








