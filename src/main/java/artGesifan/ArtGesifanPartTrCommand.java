package artGesifan;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArtGesifanPartTrCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sw = request.getParameter("sw") == null ? 1 : Integer.parseInt(request.getParameter("sw"));
		
		ArtGesifanDAO dao = new ArtGesifanDAO();
		ArtGesifanVO vo = new ArtGesifanVO();
    
    // 페이징처리 준비 시작
    int totRecCnt = 0;
    
    int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
    int pageSize = request.getParameter("pageSize") == null ? 15 : Integer.parseInt(request.getParameter("pageSize"));
    totRecCnt = dao.totGesifanListRecCnt(sw);
    int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize) + 1;
    int startIndexNo = (pag - 1) * pageSize;
    int curScrStartNo = totRecCnt - startIndexNo;
    // 블록페이징처리.....(3단계) -> 블록의 시작번호를 0번부터 처리했다.
    int blockSize = 3;
    int curBlock = (pag - 1) / blockSize;
    int lastBlock = (totPage - 1) / blockSize;
    
    ArrayList<ArtGesifanVO> vos = dao.getGesifanList(startIndexNo, pageSize,sw);
    
    request.setAttribute("vos", vos);
    request.setAttribute("pag", pag);
    request.setAttribute("totPage", totPage);
    request.setAttribute("curScrStartNo", curScrStartNo);
    request.setAttribute("blockSize", blockSize);
    request.setAttribute("curBlock", curBlock);
    request.setAttribute("lastBlock", lastBlock);
    request.setAttribute("pageSize", pageSize);
		String res = "";
    if(sw == 1) {
    	res = "공 지 사 항";
    }
    else if(sw == 2) {
    	res = "잡 담 ";
    }
    else if(sw == 3) {
    	res = "문 의 ";
    }
    else if(sw == 4) {
    	res = "자 유 ";
    }
    
		if(sw != 0) {
			response.getWriter().write(res);
		}
	}
}
