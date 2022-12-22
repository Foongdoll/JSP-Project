package artGesifan;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ArtGesifanInputOkCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String realPath = request.getServletContext().getRealPath("/data/artGesifan");
			
			int maxSize = 1024 * 1024 * 10; // 서버에 저정할 최대 용량 10MB
			String encoding = "UTF-8";
			
			// 파일 업로드 
			MultipartRequest multipartRequest = new MultipartRequest(request, realPath,maxSize,encoding, new DefaultFileRenamePolicy());
			
			// 업로드된 파일의 정보를 추출해보자.. COS 외부라이브러리 이용 
			String OriginalfName = multipartRequest.getOriginalFileName("fName");  // 업로드 시킨 파일명
			String filesysyemName = multipartRequest.getFilesystemName("fName");   // 서버에 저장되는 파일명
			
			int gesifanPwd = multipartRequest.getParameter("gesifanPwd") == null ? 0 : Integer.parseInt(multipartRequest.getParameter("gesifanPwd"));
			String title = multipartRequest.getParameter("title") == null ? "" : multipartRequest.getParameter("title");
			String content = multipartRequest.getParameter("content") == null ? "" : multipartRequest.getParameter("content");
			String totHash = multipartRequest.getParameter("totHash") == null ? "" : multipartRequest.getParameter("totHash");
			String part = multipartRequest.getParameter("part") == null ? "" : multipartRequest.getParameter("part");
			String hostIp = multipartRequest.getParameter("hostIp") == null ? "" : multipartRequest.getParameter("hostIp");
			String secretSw = multipartRequest.getParameter("secretSw") == null ? "off" : multipartRequest.getParameter("secretSw");
			
			// 첨부 파일 서버에 저장 하는 처리 해야함 
			
			HttpSession session = request.getSession();
			String nickName = (String) session.getAttribute("sNickName"); 
			if(!totHash.equals("")) {
				totHash = totHash.substring(0,totHash.lastIndexOf("/hash/"));
			}
			
			ArtGesifanDAO dao = new ArtGesifanDAO();
			
			ArtGesifanVO vo = new ArtGesifanVO();
			
			
			vo.setfName(OriginalfName);
			vo.setfSName(filesysyemName);
			vo.setNickName(nickName);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setHostIp(hostIp);
			vo.setPart(part);
			vo.setGesifanPwd(gesifanPwd);
			vo.setHashTag(totHash);
			vo.setSecretSw(secretSw);
			
			////////////////////////폼에서 파일 서버에 올리는거까지함 ㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷ		
			dao.setGesifanInputUpdateOk(vo,0,0);
			
			request.setAttribute("msg", "artGesifanInputOk");
			request.setAttribute("url", request.getContextPath()+"/artGesifan.ge");
	}
}
