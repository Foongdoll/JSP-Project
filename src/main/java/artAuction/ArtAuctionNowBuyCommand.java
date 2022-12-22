package artAuction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArtAuctionNowBuyCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int workIdx = request.getParameter("workIdx") == null ? 0 : Integer.parseInt(request.getParameter("workIdx"));
		
		String nickName = (String)request.getSession().getAttribute("sNickName");
		
		ArtAuctionDAO dao = new ArtAuctionDAO();
		dao.setWorkNowBuy(nickName,workIdx);
		
		request.setAttribute("msg", "AuctionNowBuyOk");
		request.setAttribute("url", request.getContextPath()+"/artAuction.ac");
	}	
}
