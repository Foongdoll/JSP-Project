package artAuction;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import artGesifan.ArtGesifanVO;

public class ArtWorkInforCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int workidx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		ArtAuctionDAO dao = new ArtAuctionDAO();
		ArtAuctionVO vo = new ArtAuctionVO();
		System.out.println(workidx);
		String cancelSw = dao.getReadCancelSw(workidx);
		vo = dao.getAuctioWorkInfor(workidx);
		int overLastDate = dao.getLastDateCheck(workidx);
		if(cancelSw.equals("")) {
			cancelSw = "경매 진행중";
		}
		request.setAttribute("overLastDate", overLastDate);
		request.setAttribute("cancelSw", cancelSw);
		request.setAttribute("vo", vo);
		
		
    // 페이징처리 준비 시작
    int totRecCnt = 0;
    
    int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
    int pageSize = request.getParameter("pageSize") == null ? 10 : Integer.parseInt(request.getParameter("pageSize"));
    totRecCnt = dao.totIpchalListRecCnt(workidx);
    int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize) + 1;
    int startIndexNo = (pag - 1) * pageSize;
    int curScrStartNo = totRecCnt - startIndexNo;
    // 블록페이징처리.....(3단계) -> 블록의 시작번호를 0번부터 처리했다.
    int blockSize = 3;
    int curBlock = (pag - 1) / blockSize;
    int lastBlock = (totPage - 1) / blockSize;
    
    ArrayList<ArtWorkIpchalVO> vos = dao.getIpchalList(startIndexNo, pageSize,workidx);
    
    request.setAttribute("vos", vos);
    request.setAttribute("pag", pag);
    request.setAttribute("totPage", totPage);
    request.setAttribute("curScrStartNo", curScrStartNo);
    request.setAttribute("blockSize", blockSize);
    request.setAttribute("curBlock", curBlock);
    request.setAttribute("lastBlock", lastBlock);
    request.setAttribute("pageSize", pageSize);
    request.setAttribute("workidx", workidx);
		
		
		
	}
}
