package artMyPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artMain.ArtMemDAO;
import artMain.ArtVO;

public class ArtMyPageInforUpdateCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArtMemDAO dao = new ArtMemDAO();
		ArtVO vo = new ArtVO();
		
		HttpSession session = request.getSession();
		
		String mid = (String)session.getAttribute("sMid");		
		vo = dao.getmemIdx(mid);

		String address = "";
		String detailAddress = "";
		String extraAddress = "";
		
		String[] totAddress= vo.getAddress().split("/");
		if(totAddress.length != 0 && totAddress.length > 1){
			address = totAddress[0];
			detailAddress = totAddress[1];
		}
		else if(totAddress.length != 0 && totAddress.length > 2) {
			address = totAddress[0];
			detailAddress = totAddress[1];
			extraAddress = totAddress[2];
		}
		
		
		
		request.setAttribute("address", address);
		request.setAttribute("detailAddress", detailAddress);
		request.setAttribute("extraAddress", extraAddress);
		request.setAttribute("vo", vo);
	}
}
