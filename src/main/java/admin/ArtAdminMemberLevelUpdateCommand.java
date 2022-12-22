package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.util.Introspection;

public class ArtAdminMemberLevelUpdateCommand implements ArtAdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memIdx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int memLevel  = request.getParameter("memLevel") == null ? 0 : Integer.parseInt(request.getParameter("memLevel"));
		
		
		ArtAdminDAO dao = new ArtAdminDAO();
		
		String res = dao.setMemberLevelUpdate(memIdx,memLevel);
		
		response.getWriter().write(res);
	}
}
