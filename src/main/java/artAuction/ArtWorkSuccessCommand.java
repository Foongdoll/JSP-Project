package artAuction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import artGesifan.ArtGesifanCommentVO;

public class ArtWorkSuccessCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String work = request.getParameter("work") == null ? "" : request.getParameter("work");
		int wIdx = request.getParameter("wIdx") == null ? 0 : Integer.parseInt(request.getParameter("wIdx"));
		
		String mid = (String)request.getSession().getAttribute("sMid");
		
		
		new ArtAuctionDAO().setWorkSuccess(work,wIdx,mid);
		
		
	}
}
