package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArtAdminReportMemPenaltyCommand implements ArtAdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		
		ArtAdminDAO dao = new ArtAdminDAO();
		
		String res = dao.setMemberPenalty(nickName);
		
		response.getWriter().write(res);
	}
}
