package artGesifan;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.ArtAdminDAO;

public class ArtGesifanInputCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArtAdminDAO dao = new ArtAdminDAO();
		String nickName = (String)request.getSession().getAttribute("sNickName");
		
		int rCnt = dao.getMemberReportCnt(nickName);
		if(rCnt >= 10) {
			request.setAttribute("reportMsg", "신고 점수가"+rCnt+"점 이셔서 지금은 글쓰기가 불가능하십니다. 신고 점수는 하루에 2점씩 감소합니다.");
		}
	}
}
