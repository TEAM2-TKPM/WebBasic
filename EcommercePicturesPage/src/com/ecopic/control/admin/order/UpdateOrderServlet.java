package com.ecopic.control.admin.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecopic.service.OrderServices;

@WebServlet("/admin/update_order")
public class UpdateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateOrderServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		OrderServices orderServices = new OrderServices(request, response);
		orderServices.updateOrder();
	}

}
