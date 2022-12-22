package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import artMain.ArtMemDAO;

public class ArtAdminSecessionCommand implements ArtAdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName") == null ? "" :  request.getParameter("nickName");
		
		
		String[] art = {"artMember","artgesifan","artcomment","writer"};
		
		ArtAdminDAO dao = new ArtAdminDAO();
		for(int i = 0; i < 4; i++) {
		dao.setMemberSecession(art[i],nickName);
		}
		
	}
}
