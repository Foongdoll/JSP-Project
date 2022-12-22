package artMyPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artMain.ArtMemDAO;
import artMain.ArtVO;
import conn.SecurityUtil;

public class ArtMyPwdUpdateCheckCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uPwd = request.getParameter("uPwd") == null ? "" : request.getParameter("uPwd");
		
		ArtMemDAO dao = new ArtMemDAO();
		ArtVO vo = new ArtVO();
		
		HttpSession session = request.getSession();
		
		String mid = (String)session.getAttribute("sMid");
		
		vo = dao.getmemIdx(mid);

		
		
		SecurityUtil securityUtil = new SecurityUtil();
		
		uPwd = securityUtil.encryptSHA256(uPwd);
		String res = "0";
		if(vo.getPwd().equals(uPwd)) {
			res = "1";
		}
		
		response.getWriter().write(res);
		
	}
}
