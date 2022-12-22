package artMyPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artMain.ArtMemDAO;
import artMain.ArtVO;

public class ArtMyPageCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArtVO vo = new ArtVO();
		ArtMemDAO dao = new ArtMemDAO();
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		vo = dao.getmemIdx(mid);
		
		request.setAttribute("vo", vo);
		
		
	}
}
