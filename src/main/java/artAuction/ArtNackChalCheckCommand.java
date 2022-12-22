package artAuction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ArtNackChalCheckCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nSw = request.getParameter("nSw") == null ? 0 : Integer.parseInt(request.getParameter("nSw"));
		System.out.println("nsw  "+nSw);
		HttpSession session = request.getSession();
		
		session.setAttribute("sNsw", nSw);
		
	}
}
