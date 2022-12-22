package artMain;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.art")
public class ArtController extends HttpServlet{

	@SuppressWarnings("unused")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArtInterface command;

		String viewPage = "/WEB-INF/green2209J_10";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		
	
		if(com.equals("/artMain")) {
			viewPage = "/Index2.jsp";
		}
		else if(com.equals("/artLogin")) {
			command = new ArtLoginCommand();
			command.execute(request, response);
			viewPage += "/artLogin.jsp";
		}
		else if(com.equals("/artLoginOk")) {
			command = new ArtLoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/artLogout")) {
			command = new ArtLogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/artJoin")) {
			viewPage += "/artJoin.jsp";
		}
		else if(com.equals("/artJoinOk")) {
			command = new ArtJoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/artFindMid")) {
			command = new ArtFindMidCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/artFindPwd")) {
			command = new ArtFindPwdCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/artMidNickCheck")) {
			command = new ArtMidNickCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/mainPopup")) {
			viewPage += "/Popup/mainPopup.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
