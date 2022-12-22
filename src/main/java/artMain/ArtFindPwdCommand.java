package artMain;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class ArtFindPwdCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		int memCheck = request.getParameter("memCheck") == null ? 0 : Integer.parseInt(request.getParameter("memCheck"));
		String memCheckmsg = request.getParameter("memCheckmsg") == null ? "" : request.getParameter("memCheckmsg");

		if(memCheck == 1) {
			String telMark = "-";
			
			String tel1 = memCheckmsg.substring(0,3);
			String tel2 = memCheckmsg.substring(memCheckmsg.length()-8,memCheckmsg.length()-4);
			String tel3 = memCheckmsg.substring(memCheckmsg.length()-4);
			String tottel = tel1.concat(telMark).concat(tel2).concat(telMark).concat(tel3);
			memCheckmsg = tottel;
		}
		
			ArtMemDAO dao = new ArtMemDAO();
			
			
			String pwd;
			ArtVO vo = dao.getFindIdPwd(nickName,mid,memCheck,memCheckmsg);
			if(vo.getFindId() == null) {
				response.getWriter().write("3");
			}
			else {
				String a = "";
				for(int i = 1; i < 10; i++) {
					a += String.valueOf((int)(Math.random()*10)+1);
				}
				
				pwd = a.concat("a@");
				response.getWriter().write(pwd);
				
				pwd = new SecurityUtil().encryptSHA256(pwd);
				System.out.println(pwd);
				dao.setImsiPwd(pwd,mid);
				
			}
	}
}
