package artGesifan;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArtGesifanSearChCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cateGory = request.getParameter("cateGory") == null ? "제목" : request.getParameter("cateGory");
		String SearChContent = request.getParameter("SearChContent") == null ? "" : request.getParameter("SearChContent");
		
		ArtGesifanDAO dao = new ArtGesifanDAO();
		
		ArtGesifanVO vo = new ArtGesifanVO();
		
    // 페이징처리 준비 시작
    int totRecCnt = 0;
    
    int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
    int pageSize = request.getParameter("pageSize") == null ? 15 : Integer.parseInt(request.getParameter("pageSize"));
    totRecCnt = dao.totGesifanSearchRecCnt(cateGory,SearChContent);
    if(totRecCnt == 0) {
    	totRecCnt = dao.totGesifanListRecCnt(0);
    	request.setAttribute("res", "검색하신 내용이 없습니다.");
    	cateGory = "";
    	SearChContent = "";
    }
    
    int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize) + 1;
    int startIndexNo = (pag - 1) * pageSize;
    int curScrStartNo = totRecCnt - startIndexNo;
    // 블록페이징처리.....(3단계) -> 블록의 시작번호를 0번부터 처리했다.
    int blockSize = 3;
    int curBlock = (pag - 1) / blockSize;
    int lastBlock = (totPage - 1) / blockSize;
    
  	ArrayList<ArtGesifanVO> vos = dao.getGesifanSearchList(startIndexNo, pageSize,cateGory,SearChContent);
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