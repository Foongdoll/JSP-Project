package artAuction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artMain.ArtMemDAO;
import artMain.ArtVO;
import conn.SecurityUtil;

public class ArtWorkWriterInputCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd") == null ? "1" : request.getParameter("pwd");

		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		ArtVO vo = new ArtVO();
		ArtMemDAO dao = new ArtMemDAO();
		vo = dao.setLoginMemberSearch(mid, pwd);
		
		if(vo.getName() != null) {
			request.setAttribute("msg", "ArtWorkWriterOk");
			request.setAttribute("url", request.getContextPath()+"/artWorkWriterInputGo.ac?mid="+mid+"&pwd="+pwd);
		}
		else {
			request.setAttribute("msg", "ArtWorkWriterNo");
			request.setAttribute("url", request.getContextPath()+"/Index2.jsp");
		}
		
		
	}
}
