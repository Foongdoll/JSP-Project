package artGesifan;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArtGesifanReporGoCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 15 : Integer.parseInt(request.getParameter("pageSize"));
		
		
		ArtGesifanDAO dao = new ArtGesifanDAO();
		ArtGesifanVO vo = new ArtGesifanVO();
		vo = dao.getGesifanContent(idx);
		
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("vo", vo);
	}
}
