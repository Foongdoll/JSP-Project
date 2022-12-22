package artGesifan;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Host;

import admin.ArtAdminDAO;

public class ArtGesifanCommentCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sNickName = (String)request.getSession().getAttribute("sNickName");
		int rCnt = new ArtAdminDAO().getMemberReportCnt(sNickName);
		if(rCnt > 10) {
			response.getWriter().write("신고 점수가"+rCnt+"점 이셔서 지금은 댓글쓰기/수정/삭제가 불가능하십니다.\n신고 점수는 하루에 2점씩 감소합니다.");
			return;
		}
		
		int gesifanIdx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int sw = request.getParameter("sw") == null ? 0 : Integer.parseInt(request.getParameter("sw"));
		ArtGesifanDAO dao = new ArtGesifanDAO();
		
		System.out.println(sw);
		if(sw == 1) {
			int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
			String comUp = request.getParameter("comUp") == null ? "" : request.getParameter("comUp");
			
			dao.setCommentUpdate(idx,comUp);
			response.getWriter().write("댓글 수정 완료");
			return;
		}
		else if(sw == 2) {
			int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
			
			dao.setCommentDelete(idx);
			response.getWriter().write("댓글 삭제 완료");
			return;
		}
		
		String comment = request.getParameter("comment")==null ? "" : request.getParameter("comment");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
		HttpSession session = request.getSession();
		String nickName = (String)session.getAttribute("sNickName");
		
		ArtGesifanCommentVO vo = new ArtGesifanCommentVO();
		
		vo.setComment(comment);
		vo.setGesifanIdx(gesifanIdx);
		vo.setHostIp(hostIp);
		vo.setNickName(nickName);
		
		dao.setGesifanCommentInput(vo);
		
		
	}
}
