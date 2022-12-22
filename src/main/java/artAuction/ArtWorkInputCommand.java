package artAuction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artMain.ArtMemDAO;
import artMain.ArtVO;
import conn.SecurityUtil;

public class ArtWorkInputCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writerName = request.getParameter("writerNmae") == null ? "1" : request.getParameter("writerNmae");
		
		ArtAuctionVO vo = new ArtAuctionVO();
		ArtAuctionDAO dao = new ArtAuctionDAO();
		
		vo = dao.getWriterInfor(writerName);
		if(vo.getWriterName() != null) {
			request.setAttribute("msg", "ArtWorkInputOk");
			request.setAttribute("url", request.getContextPath()+"/artWorkInputGo.ac?writerName="+writerName);
		}
		else {
			request.setAttribute("msg", "ArtWorkInputNo");
			request.setAttribute("url", request.getContextPath()+"/Index2.jsp");
		}
	}
}
