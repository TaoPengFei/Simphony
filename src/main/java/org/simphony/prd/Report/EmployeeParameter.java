package org.simphony.prd.Report;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.simphony.prd.Service.SelectInfoService;

public class EmployeeParameter extends HttpServlet {
	
	public EmployeeParameter() {
		
	}
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SelectInfoService employeeInfo = new SelectInfoService();
		
		//TO-DO �Լ�Service�е�����
		
		List<Object> employee = employeeInfo.getEmployeeColoumName();
		OutputStream  out = resp.getOutputStream();
		out.write(employee.toString().getBytes("UTF-8"));
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req,resp);
	}

}
