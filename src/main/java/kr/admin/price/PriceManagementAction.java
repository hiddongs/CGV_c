package kr.admin.price;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.price.dao.PriceDAO;
import kr.price.vo.PriceVO;

public class PriceManagementAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PriceVO price = PriceDAO.getInstance().getPrice();
		req.setAttribute("price", price);
		
		return "admin/price/priceManagement.jsp";
	}

}
