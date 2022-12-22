package artGuest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.gu")
public class ArtGuestController extends HttpServlet{

	@SuppressWarnings("unused")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArtGuestInterface command;

		String viewPage = "/WEB-INF/green2209J_10";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		
	   if(com.equals("/artGuest")) {
       command = new ArtGuestCommand();
       command.execute(request, response);
       viewPage += "/artGuest.jsp";
	   }
	   else if(com.equals("/artGoodplus")) {
	       command = new ArtGoodplusCommand();
	       command.execute(request, response);
	       return;
	   }
	   else if(com.equals("/artGuestInput")) {
	       command = new ArtGuestInputCommand();
	       command.execute(request, response);
	       return;
	   }
	   else if(com.equals("/artGuestSearCh")) {
	       command = new ArtGuestCommand();
	       command.execute(request, response);
	       viewPage += "/artGuest.jsp";
	   }
	   else if(com.equals("/guestDelete")) {
	  	 command = new GuestDeleteCommand();
	  	 command.execute(request, response);
	  	 return;
	   }

		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
