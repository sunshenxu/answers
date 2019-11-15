package com.answers.servlet;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		String methodName = request.getParameter("method");
		
		//当请求有method参数的时候执行对应的方法，如果没有就默认有一个参数method=query
		if (methodName == null || methodName.trim().isEmpty()) {
			//response.sendRedirect(request.getRequestURL() + "?method=queryAll");
			return ;
		} else {
			//获取子类的对象
			Class<? extends BaseServlet> clz = this.getClass();

			//找到子类中对应函数名和参数类型的函数
			try {
				Method method = clz.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);

				//调用子类的函数，并且用result接受
				String result;

				result = (String) method.invoke(this, request, response);
				if (!"".equals(result)) {
					//以什么方式跳转页面
					String methodUrl = result.split(":")[0];
					//跳转的地址
					String url = result.split(":")[1];

					//重定向
					if ("redirect".equals(methodUrl)) {
						response.sendRedirect(url);

						//请求转发
					} else if ("forward".equals(methodUrl)) {
						request.getRequestDispatcher(url).forward(request, response);
					}
				} else {
					//既不是重定向也不是请求转发
					return ;
				}
			} catch (Exception e) {
				//throw new RuntimeException("调用"+clz.getName()+"类中的方法出错");
			}

		}
	}
}