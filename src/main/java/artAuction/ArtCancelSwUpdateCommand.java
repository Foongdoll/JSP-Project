package artAuction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import artMain.ArtMemDAO;

public class ArtCancelSwUpdateCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cardNum = request.getParameter("cardNum") == null ? "" : request.getParameter("cardNum");
		int sw = request.getParameter("sw") == null ? 0 : Integer.parseInt(request.getParameter("sw"));
		String mid = (String)request.getSession().getAttribute("sMid");
		String work = request.getParameter("work") == null ? "" : request.getParameter("work");
		
		new ArtMemDAO().setCardNum(cardNum,mid,work,sw);
		String res = "";
		if(sw == 1) {
			res = "직접수령처리되셨습니다.";
		}
		else {
			res = "택배수령처리되셨습니다.";
		}
		response.getWriter().write(res);
	}
}
