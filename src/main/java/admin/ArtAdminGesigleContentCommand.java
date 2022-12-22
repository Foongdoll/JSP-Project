package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artGesifan.ArtGesifanCommentVO;
import artGesifan.ArtGesifanDAO;
import artGesifan.ArtGesifanVO;

public class ArtAdminGesigleContentCommand implements ArtAdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 15 : Integer.parseInt(request.getParameter("pageSize"));
		HttpSession session = request.getSession();
		ArtGesifanDAO dao = new ArtGesifanDAO();
		ArtGesifanVO vo = new ArtGesifanVO();
		
		String secretSw = dao.getSecretSwSearchPwd(idx,0);
		
		if(secretSw.equals("on")) {
			String currentUserNickName = (String)session.getAttribute("sNickName");
			String SecretContentNickName = dao.getsecretContentNickName(idx);
			
			request.setAttribute("res", "비밀글 처리되어있습니다.");
			request.setAttribute("secretSw", 1);
			request.setAttribute("currentUserNickName", currentUserNickName);
			request.setAttribute("SecretContentNickName", SecretContentNickName);
			request.setAttribute("pwdCheckIdx", idx);
			request.setAttribute("pag", pag);
			request.setAttribute("pageSize", pageSize);
			return;
		}
		
		
		ArrayList<String> contentIdx = (ArrayList) session.getAttribute("sContentIdx");
		if(contentIdx == null) {
			contentIdx = new ArrayList<String>();
		}
		String imsiContentIdx = "board" + idx;
		if(!contentIdx.contains(imsiContentIdx)) {
			dao.setReadNum(idx);
			contentIdx.add(imsiContentIdx);
		}
		session.setAttribute("sContentIdx", contentIdx);
		
		
		ArrayList<String> goodIdx = (ArrayList) session.getAttribute("sGoodIdx");
		if(goodIdx == null) {
			goodIdx = new ArrayList<String>();
		}
		String imsiGoodIdx = "boardGood" + idx;
		if(goodIdx.contains(imsiGoodIdx)) {
			session.setAttribute("sSw", "1");		// 로그인 사용자가 이미 좋아요를 클릭한 게시글이라면 빨강색으로 표시가히위해 sSW에 1을 전송하고 있다.
		}
		else {
			session.setAttribute("sSw", "0");
		}
		
		vo = dao.getGesifanContent(idx);
		
		String hashTag = vo.getHashTag();
		String[] hashTags = hashTag.split("/hash/");
		String resHashTag = "";
		for(int i = 0; i < hashTags.length; i++) {
			resHashTag += "#"+hashTags[i] + " ";
		}
		
		ArtGesifanVO preVo  = dao.getPreNextSearch("pre", idx);
		ArtGesifanVO nextVo = dao.getPreNextSearch("next", idx);
		request.setAttribute("preVo", preVo);
		request.setAttribute("nextVo", nextVo);
		
		request.setAttribute("vo", vo);
		request.setAttribute("resHashTag", resHashTag);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		
		
		ArrayList<ArtGesifanCommentVO> Comvos = dao.getGesifanComment(idx);
		
		request.setAttribute("Comvos", Comvos);
	}
}
