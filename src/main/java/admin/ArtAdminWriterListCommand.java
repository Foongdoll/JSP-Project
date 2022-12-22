package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import artAuction.ArtAuctionVO;

public class ArtAdminWriterListCommand implements ArtAdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArtAdminDAO dao = new ArtAdminDAO();
		
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
    int pageSize = request.getParameter("pageSize") == null ? 10 : Integer.parseInt(request.getParameter("pageSize"));
    int totRecCnt = dao.getWriterListRecCnt();
    int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize) + 1;
    int startIndexNo = (pag - 1) * pageSize;
    int curScrStartNo = totRecCnt - startIndexNo;
    int blockSize = 3;
    int curBlock = (pag - 1) / blockSize;
    int lastBlock = (totPage - 1) / blockSize;
    
    ArrayList<ArtAuctionVO> vos = dao.getWriterList(startIndexNo,pageSize);
    request.setAttribute("vos", vos);
    request.setAttribute("pag", pag);
    request.setAttribute("totPage", totPage);
    request.setAttribute("curScrStartNo", curScrStartNo);
    request.setAttribute("blockSize", blockSize);
    request.setAttribute("curBlock", curBlock);
    request.setAttribute("lastBlock", lastBlock);
    request.setAttribute("pageSize", pageSize);
	}
}
