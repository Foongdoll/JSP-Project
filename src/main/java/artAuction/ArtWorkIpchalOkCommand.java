package artAuction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artMain.ArtMemDAO;

public class ArtWorkIpchalOkCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ipchalPrice = request.getParameter("ipchalPrice") == null ? 0 : Integer.parseInt(request.getParameter("ipchalPrice"));
		int workIdx = request.getParameter("workIdx") == null ? 0 : Integer.parseInt(request.getParameter("workIdx"));
		int memberIdx = request.getParameter("memberIdx") == null ? 0 : Integer.parseInt(request.getParameter("memberIdx"));
		ArtAuctionDAO dao = new ArtAuctionDAO();
		HttpSession session = request.getSession();
		
		String nickName = (String)session.getAttribute("sNickName");
		
		dao.setIpchalCntPlus(workIdx);
		
		dao.setIpchalInput(memberIdx,workIdx,ipchalPrice,nickName);
		
		dao.setCurrentPriceUpdate(workIdx,ipchalPrice);
		
		request.setAttribute("msg", "WorkIpchalOk");
		request.setAttribute("url", request.getContextPath()+"/artAuction.ac");
		
	}
}
