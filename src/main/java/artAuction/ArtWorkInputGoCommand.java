package artAuction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArtWorkInputGoCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writerName = request.getParameter("writerName") == null ? "1" : request.getParameter("writerName");
		System.out.println(writerName);
		ArtAuctionVO vo = new ArtAuctionVO();
		ArtAuctionDAO dao = new ArtAuctionDAO();
		
		vo = dao.getWriterInfor(writerName);
		
		request.setAttribute("vo", vo);
	}
}
