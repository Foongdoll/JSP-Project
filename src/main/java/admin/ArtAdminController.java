package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.ad")
public class ArtAdminController extends HttpServlet{

	@SuppressWarnings("unused")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArtAdminInterface command;

		String viewPage = "/WEB-INF/admin";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if(com.equals("/artAdmin")) {
			viewPage += "/artAdminMain.jsp";
		}
		else if(com.equals("/myAdmin1")) {
			command = new ArtAdminMemberListCommand();
			command.execute(request, response);
			viewPage += "/artAdminMember.jsp";
		}
		else if(com.equals("/adminSecession")) {
			command = new ArtAdminSecessionCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/myAdmin2")) {
			command = new ArtAdminWriterListCommand();
			command.execute(request, response);
			viewPage += "/artAdminWriterList.jsp";
		}
		else if(com.equals("/myAdmin3")) {
			command = new ArtAdminWorkListCommand();
			command.execute(request, response);
			viewPage += "/artWorkList.jsp";
		}
		else if(com.equals("/myAdmin4")) {
			command = new ArtAdminIpchalListCommand();
			command.execute(request, response);
			viewPage += "/artAdminCurrentIpchalList.jsp";
		}
		else if(com.equals("/myAdmin5")) {
			command = new ArtAdminGesigleCommand();
			command.execute(request, response);
			viewPage += "/artAdminGesigle.jsp";
		}
		else if(com.equals("/artAdminGesigleSearch")) {
			command = new ArtAdminGesigleSearchCommand();
			command.execute(request, response);
			viewPage += "/artAdminGesigle.jsp";
		}
		else if(com.equals("/artAdminGesigleContent")) {
			command = new ArtAdminGesigleContentCommand();
			command.execute(request, response);
			viewPage += "/artAdminGesigleContent.jsp";
		}
		else if(com.equals("/myAdmin6")) {
			command = new ArtAdminGesigleCommand();
			command.execute(request, response);
			viewPage += "/artAdminGesigle.jsp";
		}
		else if(com.equals("/myAdmin7")) {
			command = new ArtAdminGesigleCommand();
			command.execute(request, response);
			viewPage += "/artAdminGesigle.jsp";
		}
		else if(com.equals("/myAdmin8")) {
			command = new ArtAdminCommentListCommand();
			command.execute(request, response);
			viewPage += "/artAdminCommentList.jsp";
		}
		else if(com.equals("/myAdmin9")) {
			command = new ArtAdminReportCommand();
			command.execute(request, response);
			viewPage += "/ArtAdminReport.jsp";
		}
		else if(com.equals("/reportProcess")) {
			command = new ArtAdminReportProcessCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/adminMemberLevelUpdate")) {
			command = new ArtAdminMemberLevelUpdateCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/adminReportMemPenalty")) {
			command = new ArtAdminReportMemPenaltyCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/artAdminWriterInfor")) {
			command = new ArtAdminWriterInforCommand();
			command.execute(request, response);
			viewPage += "/artAdminWriterInfor.jsp";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
