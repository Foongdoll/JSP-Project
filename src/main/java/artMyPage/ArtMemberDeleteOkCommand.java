package artMyPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artMain.ArtMemDAO;
import artMain.ArtVO;
import conn.SecurityUtil;

public class ArtMemberDeleteOkCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dMid = request.getParameter("dMid") == null ? "" : request.getParameter("dMid"); 
		String dPwd = request.getParameter("dPwd") == null ? "" : request.getParameter("dPwd");
		
		ArtMemDAO dao = new ArtMemDAO();
		ArtVO vo = new ArtVO();
		
		vo = dao.getmemIdx(dMid);		

		dPwd = new SecurityUtil().encryptSHA256(dPwd);
		
		
		if(vo.getMid().equals(dMid) && vo.getPwd().equals(dPwd)) {
			HttpSession session = request.getSession();
			
			dao.setMemberDeleteSw(dMid);
			
			session.invalidate();
			request.setAttribute("msg", "artMemberDeleteOk");
			request.setAttribute("url", request.getContextPath()+"/Index2.jsp");
		}
		
	}
}
