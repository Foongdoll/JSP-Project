package artMain;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArtMidNickCheckCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
			String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
			
			ArtMemDAO dao = new ArtMemDAO();
			
			int res = dao.getMidNickCheck(mid,nickName);
			
			response.getWriter().write(res);
	}
}
