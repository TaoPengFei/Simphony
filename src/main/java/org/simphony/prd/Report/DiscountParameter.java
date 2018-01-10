package org.simphony.prd.Report;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.simphony.prd.Service.SelectInfoService;

public class DiscountParameter extends HttpServlet {
	
	public DiscountParameter() {
		
	}
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SelectInfoService discountInfo = new SelectInfoService();
		
		//TO-DO �Լ�Service�е�����
		
		List<Object> discount = discountInfo.getDiscountColoumName();
		OutputStream  out = resp.getOutputStream();
		out.write(discount.toString().getBytes("UTF-8"));
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req,resp);
	}

}
