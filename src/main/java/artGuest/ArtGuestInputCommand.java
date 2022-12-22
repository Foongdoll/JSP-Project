package artGuest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArtGuestInputCommand implements ArtGuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp") == null ? "" : request.getParameter("hostIp");
		
		String res = "";
		if(nickName.equals("")) {
			res = "01";
			response.getWriter().write(res);
			return;
		}
		else if(content.equals("")) {
			res = "02";
			response.getWriter().write(res);
			return;
		}
		
		request.setAttribute("res", "");
		
		ArtGuestDAO dao = new ArtGuestDAO();
		ArtGuestVO vo = new ArtGuestVO();
		
		
		vo.setNickName(nickName);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		res = dao.setGuestInput(vo);
		
		response.getWriter().write(res);
	}
}
