package artMyPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artMain.ArtMemDAO;
import artMain.ArtVO;

public class ArtWorkJudgeCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String workJudgeContent = request.getParameter("workJudgeContent") == null ? "" : request.getParameter("workJudgeContent");
		String work = request.getParameter("work") == null ? "" : request.getParameter("work");
		String ipChalPrice = request.getParameter("ipChalPrice") == null ? "" : request.getParameter("ipChalPrice");
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		ArtMemDAO dao = new ArtMemDAO();
		
		dao.setWorkJudgeContent(workJudgeContent,work,ipChalPrice,mid);
		
	}
}
