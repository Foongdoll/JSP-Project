package artGesifan;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArtSecretPwdCheckCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pwdCheckIdx = request.getParameter("pwdCheckIdx") == null ? 0 : Integer.parseInt(request.getParameter("pwdCheckIdx"));
		int pwd = request.getParameter("pwd") == null ? 0 : Integer.parseInt(request.getParameter("pwd"));
		
		
		
		ArtGesifanDAO dao = new ArtGesifanDAO();
		
		
		String res = dao.getSecretSwSearchPwd(pwdCheckIdx,1);
		
		if(Integer.parseInt(res) == pwd) {
			response.getWriter().write("1");
		}
		else {
			response.getWriter().write("0");
		}
	}
}
