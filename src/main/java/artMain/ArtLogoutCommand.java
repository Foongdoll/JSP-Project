package artMain;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ArtLogoutCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String nickName = (String)session.getAttribute("sNickName");
		
		session.invalidate();
		
		
		request.setAttribute("sNickName", nickName);
		request.setAttribute("msg", "LogoutOk");
		request.setAttribute("url", request.getContextPath()+"/Index2.jsp");
		
	}
}
