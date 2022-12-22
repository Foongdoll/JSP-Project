package artGuest;

import java.io.IOException;
import java.util.ArrayList;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class ArtGuestCommand implements ArtGuestInterface {
 
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cateGory = request.getParameter("cateGory") == null ? "" : request.getParameter("cateGory");
        String SearChContent = request.getParameter("SearChContent") == null ? "" : request.getParameter("SearChContent");
        int sw = request.getParameter("sw") == null ? 0 : Integer.parseInt(request.getParameter("sw"));
        
        
        ArtGuestDAO dao = new ArtGuestDAO();
        ArtGuestVO vo = new ArtGuestVO();
        
        // 페이징처리 준비 시작
        int totRecCnt = 0;
        
        int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
        int pageSize = 5;
        totRecCnt = dao.totRecCnt(cateGory,SearChContent,sw);
        if(totRecCnt == 0) {
        	request.setAttribute("res", "검색하신 내용이 없습니다.");
        	totRecCnt = dao.totRecCnt("","",0);
        	cateGory = "";
        	SearChContent = "";
        	sw = 0;
        }
        
        int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize) + 1;
        int startIndexNo = (pag - 1) * pageSize;
        int curScrStartNo = totRecCnt - startIndexNo;
        
        // 블록페이징처리.....(3단계) -> 블록의 시작번호를 0번부터 처리했다.
        int blockSize = 3;
        int curBlock = (pag - 1) / blockSize;
        int lastBlock = (totPage - 1) / blockSize;
        
        ArrayList<ArtGuestVO> vos = dao.getGuestList(startIndexNo, pageSize,cateGory,SearChContent,sw);
        
        request.setAttribute("vos", vos);
        request.setAttribute("pag", pag);
        request.setAttribute("totPage", totPage);
        request.setAttribute("curScrStartNo", curScrStartNo);
        request.setAttribute("blockSize", blockSize);
        request.setAttribute("curBlock", curBlock);
        request.setAttribute("lastBlock", lastBlock);
    }
 
}