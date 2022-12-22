package artAuction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artMain.ArtMemDAO;
import artMain.ArtVO;

public class ArtWorkIpchalGoCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int workIdx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		ArtAuctionDAO dao = new ArtAuctionDAO();
		ArtAuctionVO vo = new ArtAuctionVO();
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		ArtVO Artvo = new ArtMemDAO().getmemIdx(mid);
		
		vo = dao.getAuctioWorkInfor(workIdx);
		
		request.setAttribute("Artvo", Artvo);
		request.setAttribute("vo", vo);
	}
}
