package artGesifan;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.ge")
public class ArtGesifanController extends HttpServlet{

	@SuppressWarnings("unused")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArtInterface command;

		String viewPage = "/WEB-INF/green2209J_10";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		
		if(com.equals("/artGesifan")) {
			command = new ArtGesifanCommand();
			command.execute(request, response);
			viewPage += "/artGesifan.jsp";
		}
		else if(com.equals("/artGesifanInput")) {
			command = new ArtGesifanInputCommand();
			command.execute(request, response);
			viewPage += "/artGesifanInput.jsp";
		}
		else if(com.equals("/artGesifanInputOk")) {
			command = new ArtGesifanInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/artGesifanContent")) {
			command = new ArtGesifanContentCommand();
			command.execute(request, response);
			viewPage += "/artGesifanContent.jsp";
		}
		else if(com.equals("/artGesifanSearCh")) {
			command = new ArtGesifanSearChCommand();
			command.execute(request, response);
			viewPage += "/artGesifan.jsp";
		}
		else if(com.equals("/artSecretPwdCheck")) {
			command = new ArtSecretPwdCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/artSecretContent")) {
			command = new ArtSecretContentCommand();
			command.execute(request, response);
			viewPage += "/artGesifanContent.jsp";
		}
		else if(com.equals("/artGesifanGoodCheck")) {
			command = new ArtGesifanGoodCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/artGesifanComment")) {
			command = new ArtGesifanCommentCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/artGesifanPartTr")) {
			command = new ArtGesifanPartTrCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/artGesifanUpdate")) {
			command = new ArtGesifanUpdateCommand();
			command.execute(request, response);
			viewPage += "/artGesifanUpdate.jsp";
		}
		else if(com.equals("/artGesifanUpdateOk")) {
			command = new ArtGesifanUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/artGesifanDelete")) {
			command = new ArtGesifanDeleteCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/artGesifanReportGo")) {
			command = new ArtGesifanReporGoCommand();
			command.execute(request, response);
			viewPage += "/artGesifanReport.jsp";
		}
		else if(com.equals("/argGesifanReportOk")) {
			command = new argGesifanReportOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
