package artGesifan;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.JDBC4ReplicationMySQLConnection;

public class argGesifanReportOkCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int Gesigleidx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String reportContent = request.getParameter("reportcontent") == null ? "" : request.getParameter("reportcontent");
		
		String reporter = (String)request.getSession().getAttribute("sNickName");
		
		ArtGesifanDAO dao = new ArtGesifanDAO();
		ArtReportVO vo = new ArtReportVO();
		
		vo.setGesifanidx(Gesigleidx);
		vo.setReporter(reporter);
		vo.setContent(reportContent);
		
		dao.setReportInput(vo);
		
		request.setAttribute("msg", "argGesifanReportOk");
		request.setAttribute("url", request.getContextPath()+"/artGesifan.ge");
		
	}
}
