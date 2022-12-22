package artMyPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artMain.ArtMemDAO;
import conn.SecurityUtil;

public class ArtNewPwdUpdateCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nPwd = request.getParameter("nPwd") == null ? "" : request.getParameter("nPwd");
		
		ArtMemDAO dao = new ArtMemDAO();
		HttpSession session = request.getSession();
		
		String mid = (String)session.getAttribute("sMid");
		
		
		
		nPwd = new SecurityUtil().encryptSHA256(nPwd);
		
		String res = dao.setNewPwdUpdate(nPwd,mid);
		
		response.getWriter().write(res);
	}
}
