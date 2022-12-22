package artMain;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class ArtJoinOkCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender");
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
		String birthday = request.getParameter("birthday") == null ? "" : request.getParameter("birthday");
		String postcode = request.getParameter("sample6_postcode") == null ? "" : request.getParameter("sample6_postcode");
		String address1 = request.getParameter("sample6_address") == null ? "" : request.getParameter("sample6_address");
		String address2 = request.getParameter("sample6_detailAddress") == null ? "" : request.getParameter("sample6_detailAddress");
		String address3 = request.getParameter("sample6_extraAddress") == null ? "" : request.getParameter("sample6_extraAddress");
		int aggrement = request.getParameter("aggrement2") == null ? 0 : Integer.parseInt(request.getParameter("aggrement2"));
		ArtVO vo = new ArtVO();
		ArtMemDAO dao = new ArtMemDAO();
		
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd); // 암호화
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setGender(gender);
		vo.setEmail(email);
		vo.setNickName(nickName);
		vo.setTel(tel);
		vo.setBirthday(birthday);
		String resAddress = postcode+"/"+address1 +"/"+address2+"/"+address3;
		vo.setAddress(resAddress);
		vo.setAggrement(aggrement);
		
		
		
		int res = dao.setMemberInformation(vo);		
		
		
		if(res == 1) {
			request.setAttribute("msg", "artJoinOk");
			request.setAttribute("url", request.getContextPath()+"/artLogin.art");
		}
		else {
			request.setAttribute("msg", "artJoinNo");
			request.setAttribute("url", request.getContextPath()+"/artJoin.art");
		}
	}
}
