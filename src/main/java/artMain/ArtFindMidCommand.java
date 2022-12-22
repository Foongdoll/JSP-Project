package artMain;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArtFindMidCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
			String memCheckmsg = request.getParameter("memCheckmsg") == null ? "" : request.getParameter("memCheckmsg");
			int memCheck = request.getParameter("memCheck") == null ? 0 : Integer.parseInt(request.getParameter("memCheck"));
			if(memCheck == 1) { // 전화번호 입력시 '-' 이 없으면 잘라서 사이에 '-' 넣고 DB에서 자료 찾기 
				String telMark = "-";
				if(!memCheckmsg.contains(telMark)) {
					String tel1 = memCheckmsg.substring(0,3);
					String tel2 = memCheckmsg.substring(memCheckmsg.length()-8,memCheckmsg.length()-4);
					String tel3 = memCheckmsg.substring(memCheckmsg.length()-4);
					String tottel = tel1.concat(telMark).concat(tel2).concat(telMark).concat(tel3);
					memCheckmsg = tottel;
				}
			}
			
			ArtMemDAO dao = new ArtMemDAO();
			
			System.out.println(nickName+"/"+memCheck+"/"+memCheckmsg);
			
			String mid; 
			ArtVO vo = dao.getFindIdPwd(nickName,"",memCheck,memCheckmsg); // 아이디 찾기와 비밀번호 찾기를 같이 쓰기때문에
			if(vo.getFindId() == null) {                                   // 비밀번호 찾기때 두번째 매개변수로 mid를 받기로 했으나
				mid = "3";                                                   // 아이디 찾기에선 아이디 값이 없기에 공백을("") 넘겼습니다. 
				response.getWriter().write(mid);
			}
			else {
				mid = vo.getFindId();
				String changeMid="";
				String a = "0";
				int sw = 0;
				for(int i = 0; i < 10; i++) {
					if(mid.contains(a)) {
						if(sw == 0) {
							changeMid = mid.replace(a, "*");
							sw = 1;
						}
						else {
							changeMid = changeMid.replace(a, "*");
						}
					}
					 a = String.valueOf(Integer.parseInt(a)+1);
				}
				
				response.getWriter().write(changeMid);
			}
	}
}