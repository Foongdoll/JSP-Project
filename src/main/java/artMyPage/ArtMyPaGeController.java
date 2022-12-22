package artMyPage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.my")
public class ArtMyPaGeController extends HttpServlet{

	@SuppressWarnings("unused")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArtInterface command;

		String viewPage = "/WEB-INF/green2209J_10";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		
		  if(com.equals("/artMyPage")) {
		  	command = new ArtMyPageCommand();
		  	command.execute(request, response); 
		  	viewPage += "/artMyPage.jsp"; 
		 	} 
		  else if(com.equals("/artMyPage1")) {
		  	command = new ArtMyPageInforUpdateCommand();
		  	command.execute(request, response); 
		  	viewPage += "/artMyPageInforUpdate.jsp"; 
		  }
		  else if(com.equals("/artMyPage2")) {
		  	command = new ArtMyPagePwdUpdateCommand();
		  	command.execute(request, response); 
		  	viewPage += "/artMyPagePwdUpdate.jsp"; 
		  }
		  else if(com.equals("/artMyPage3")) {
		  	viewPage += "/artMyPageMemberDelete.jsp"; 
		  }
		  else if(com.equals("/artMyPage4")) {
		  	command = new ArtNackChalCommand();
		  	command.execute(request, response); 
		  	viewPage += "/artNackChal.jsp"; 
		  }
		  else if(com.equals("/artMyPage5")) {
		  	command = new ArtMyIpchalCommand();
		  	command.execute(request, response);
		  	viewPage += "/artMyIpchal.jsp"; 
		  }
		  else if(com.equals("/artMyPage6")) {
		  	command = new ArtMyNackChalCommand();
		  	command.execute(request, response);
		  	viewPage += "/artMyNackchalList.jsp"; 
		  }
		  else if(com.equals("/artmemberInforUpdateOk")) {
				command = new ArtmemberInforUpdateOkCommand();
				command.execute(request, response);
				viewPage = "/include/message.jsp";
			}
		  else if(com.equals("/artMyPwdUpdateCheck")) {
		  	command = new ArtMyPwdUpdateCheckCommand();
		  	command.execute(request, response);
		  	return;
		  }
		  else if(com.equals("/artNewPwdUpdate")) {
		  	command = new ArtNewPwdUpdateCommand();
		  	command.execute(request, response);
		  	return;
		  }
		  else if(com.equals("/artMemberDeleteOk")) {
		  	command = new ArtMemberDeleteOkCommand();
		  	command.execute(request, response);
		  	viewPage = "/include/message.jsp";
		  }
		  else if(com.equals("/artWorkJudge")) {
		  	command = new ArtWorkJudgeCommand();
		  	command.execute(request, response);
		  	return;
		  }
		 
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
