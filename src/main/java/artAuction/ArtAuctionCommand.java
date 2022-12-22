package artAuction;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.ArtAdminDAO;
import artGesifan.ArtGesifanVO;

public class ArtAuctionCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArtAuctionDAO dao = new ArtAuctionDAO();
		
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
    int pageSize = request.getParameter("pageSize") == null ? 4 : Integer.parseInt(request.getParameter("pageSize"));
    int totRecCnt = dao.totAuctionListRecCnt();
    int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize) + 1;
    int startIndexNo = (pag - 1) * pageSize;
    int curScrStartNo = totRecCnt - startIndexNo;
    // 블록페이징처리.....(3단계) -> 블록의 시작번호를 0번부터 처리했다.
    int blockSize = 3;
    int curBlock = (pag - 1) / blockSize;
    int lastBlock = (totPage - 1) / blockSize;
    
    ArrayList<ArtAuctionVO> vos = dao.getAuctionWork(startIndexNo,pageSize);
    
    System.out.println();
    
    request.setAttribute("vos", vos);
    request.setAttribute("pag", pag);
    request.setAttribute("totPage", totPage);
    request.setAttribute("curScrStartNo", curScrStartNo);
    request.setAttribute("blockSize", blockSize);
    request.setAttribute("curBlock", curBlock);
    request.setAttribute("lastBlock", lastBlock);
    request.setAttribute("pageSize", pageSize);
    

    
    
    
		int pag2 = request.getParameter("pag2")==null ? 1 : Integer.parseInt(request.getParameter("pag2"));
    int pageSize2 = request.getParameter("pageSize2") == null ? 10 : Integer.parseInt(request.getParameter("pageSize2"));
    int totRecCnt2 = dao.getWriterListRecCnt();
    int totPage2 = (totRecCnt2 % pageSize2)==0 ? totRecCnt2 / pageSize2 : (totRecCnt2 / pageSize2) + 1;
    int startIndexNo2 = (pag2 - 1) * pageSize2;
    int curScrStartNo2 = totRecCnt2 - startIndexNo2;
    int blockSize2 = 3;
    int curBlock2 = (pag2 - 1) / blockSize2;
    int lastBlock2 = (totPage2 - 1) / blockSize2;
    
    ArrayList<ArtAuctionVO> wvos = dao.getWriterList(startIndexNo,pageSize);
    request.setAttribute("wvos", wvos);
    request.setAttribute("pag2", pag2);
    request.setAttribute("totPage2", totPage2);
    request.setAttribute("curScrStartNo2", curScrStartNo2);
    request.setAttribute("blockSize2", blockSize2);
    request.setAttribute("curBlock2", curBlock2);
    request.setAttribute("lastBlock2", lastBlock2);
    request.setAttribute("pageSize2", pageSize2);
    
    
    
	}
}
