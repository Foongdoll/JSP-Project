package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArtAdminReportProcessCommand implements ArtAdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int sw = request.getParameter("sw") == null ? 0 : Integer.parseInt(request.getParameter("sw"));
		
		ArtAdminDAO dao = new ArtAdminDAO();
		
		String process = dao.getCurrentSw(idx);
		
		if(process.equals("접수") && sw == 2) {
			response.getWriter().write("처리중을 거쳐서 완료시켜주세요.");
			return;
		}
		else if(process.equals("처리 완료")) {
			response.getWriter().write("이미 처리 완료상태입니다. 수정이불가능합니다.");
			return;
		}
		
		String res = dao.setUpdateReportProcess(idx,sw);
		System.out.println(res);
		response.getWriter().write(res);
	}	
}
