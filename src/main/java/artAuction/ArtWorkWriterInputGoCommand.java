package artAuction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import artMain.ArtMemDAO;
import artMain.ArtVO;

public class ArtWorkWriterInputGoCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd") == null ? "1" : request.getParameter("pwd");
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		
		ArtVO vo = new ArtVO();
		ArtMemDAO dao = new ArtMemDAO();
		
		vo = dao.setLoginMemberSearch(mid, pwd);
		
		request.setAttribute("vo", vo);
	}
}
