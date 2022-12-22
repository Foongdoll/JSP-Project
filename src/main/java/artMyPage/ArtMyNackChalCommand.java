package artMyPage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import artAuction.ArtAuctionDAO;

public class ArtMyNackChalCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid = (String)request.getSession().getAttribute("sMid");
		ArtMyPageDAO dao = new ArtMyPageDAO();
		String cancelSw = dao.getCancelSw(mid);
		
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
    int pageSize = request.getParameter("pageSize") == null ? 4 : Integer.parseInt(request.getParameter("pageSize"));
    int totRecCnt = dao.totMyNackChalListRecCnt(mid);
    int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize) + 1;
    int startIndexNo = (pag - 1) * pageSize;
    int curScrStartNo = totRecCnt - startIndexNo;
    // 블록페이징처리.....(3단계) -> 블록의 시작번호를 0번부터 처리했다.
    int blockSize = 3;
    int curBlock = (pag - 1) / blockSize;
    int lastBlock = (totPage - 1) / blockSize;
		
		
		ArrayList<ArtNackChalVO> vos = dao.getMyNackChalList(mid);
		
		request.setAttribute("vos", vos);	   
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
	  request.setAttribute("curScrStartNo", curScrStartNo);
	  request.setAttribute("blockSize", blockSize);
	  request.setAttribute("curBlock", curBlock);
	  request.setAttribute("lastBlock", lastBlock);
	  request.setAttribute("pageSize", pageSize);
		request.setAttribute("cancelSw", cancelSw);
	}
}
