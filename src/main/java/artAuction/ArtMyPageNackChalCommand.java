package artAuction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artMain.ArtMemDAO;
import artMain.ArtVO;

public class ArtMyPageNackChalCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String workName = request.getParameter("workName") == null ? "" : request.getParameter("workName");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		HttpSession session = request.getSession();
		
		String mid = (String)session.getAttribute("sMid");
		
		
		
		ArtMemDAO dao = new ArtMemDAO();
		ArtVO vo = new ArtVO();
		
		vo = dao.setLoginMemberSearch(mid, pwd);

		
		ArtAuctionDAO aucDao = new ArtAuctionDAO();
		ArtAuctionVO aucVo = new ArtAuctionVO();
		
		aucVo = aucDao.getAuctioWorkInforName(workName);
		
		
		
		
		request.setAttribute("aucVo", aucVo);
		request.setAttribute("vo", vo);
		request.setAttribute("workName", workName);
	}
}
