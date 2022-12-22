package artAuction;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import artMain.ArtLoginCommand;

@SuppressWarnings("serial")
@WebServlet("*.ac")
public class ArtAuctionController extends HttpServlet{

	@SuppressWarnings("unused")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArtInterface command;

		String viewPage = "/WEB-INF/green2209J_10";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		
		if(com.equals("/artWorkWriterInput")) {
			command = new ArtWorkWriterInputCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/artWorkWriterInputOk")) {
			command = new ArtWorkWriterInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/artWorkWriterInputGo")) {
			command = new ArtWorkWriterInputGoCommand();
			command.execute(request, response);
			viewPage += "/artWorkWriterInput.jsp";
		}
		else if(com.equals("/artWorkInput")) {
			command = new ArtWorkInputCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/artWorkInputOk")) {
			command = new ArtWorkInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/artWorkInputGo")) {
			command = new ArtWorkInputGoCommand();
			command.execute(request, response);
			viewPage += "/artWorkInput.jsp";
		}
		else if(com.equals("/artAuction")) {
			command = new ArtAuctionCommand();
			command.execute(request, response);
			viewPage += "/artAuction.jsp";
		}
		else if(com.equals("/artExpect")) {
			viewPage += "/artExpect.jsp";
		}
		else if(com.equals("/artWorkInfor")) {
			command = new ArtWorkInforCommand();
			command.execute(request, response);
			viewPage += "/artWorkInfor.jsp";
		}
		else if(com.equals("/artWorkIpchalGo")) {
			command = new ArtWorkIpchalGoCommand();
			command.execute(request, response);
			viewPage += "/artWorkIpchal.jsp";
		}
		else if(com.equals("/WorkIpchalOk")) {
			command = new ArtWorkIpchalOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/artCurrentIpchalList")) {
			command = new ArtCurrentIpchalListCommand();
			command.execute(request, response);
			viewPage += "/artCurrentIpchalList.jsp";
		}
		else if(com.equals("/artMyPageNackChal")) {
			command = new ArtMyPageNackChalCommand();
			command.execute(request, response);
			viewPage += "/artMyPageNackChal.jsp";
		}
		else if(com.equals("/nackChalCheck")) {
			command = new ArtNackChalCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/artCancelSwUpdate")) {
			command = new ArtCancelSwUpdateCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/artWorkSuccess")) {
			command = new ArtWorkSuccessCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/artAuctionSearch")) {
			command = new ArtAuctionSearchCommand();
			command.execute(request, response);
			viewPage += "/artAuction.jsp";
		}
		else if(com.equals("/artAuctionNowBuy")) {
			command = new ArtAuctionNowBuyCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
