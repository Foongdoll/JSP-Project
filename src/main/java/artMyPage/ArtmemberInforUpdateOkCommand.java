package artMyPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artMain.ArtMemDAO;
import artMain.ArtVO;
import conn.SecurityUtil;

public class ArtmemberInforUpdateOkCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender");
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
		String birthday = request.getParameter("birthday") == null ? "" : request.getParameter("birthday");
		String postcode = request.getParameter("sample6_postcode") == null ? "" : request.getParameter("sample6_postcode");
		String address1 = request.getParameter("sample6_address") == null ? "" : request.getParameter("sample6_address");
		String address2 = request.getParameter("sample6_detailAddress") == null ? "" : request.getParameter("sample6_detailAddress");
		String address3 = request.getParameter("sample6_extraAddress") == null ? "" : request.getParameter("sample6_extraAddress");
		ArtVO vo = new ArtVO();
		ArtMemDAO dao = new ArtMemDAO();
		
		System.out.println("성별 "+gender);
		
		vo.setMid(mid);
		vo.setName(name);
		vo.setGender(gender);
		vo.setEmail(email);
		vo.setTel(tel);
		vo.setBirthday(birthday);
		String resAddress = postcode+"/"+address1 +"/"+address2+"/"+address3;
		vo.setAddress(resAddress);
		
		dao.setArtmemberInforUpdate(vo);		
		
		request.setAttribute("msg", "ArtmemberInforUpdateOk");
		request.setAttribute("url", request.getContextPath()+"/artMyPage.my");
	}
}
