package artGesifan;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ArtGesifanUpdateOkCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/data/artGesifan");
		

		ArtGesifanDAO dao = new ArtGesifanDAO();
		ArtGesifanVO vo = new ArtGesifanVO();
		
		int maxSize = 1024 * 1024 * 10; // 서버에 저정할 최대 용량 10MB
		String encoding = "UTF-8";
		
		
		// 파일 업로드 
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath,maxSize,encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보를 추출해보자.. COS 외부라이브러리 이용 
		String originalfName = multipartRequest.getOriginalFileName("fName");  // 업로드 시킨 파일명
		String filesysyemName = multipartRequest.getFilesystemName("fName");   // 서버에 저장되는 파일명
		
		
		int gesifanPwd = multipartRequest.getParameter("gesifanPwd") == null ? 0 : Integer.parseInt(multipartRequest.getParameter("gesifanPwd"));
		String title = multipartRequest.getParameter("title") == null ? "" : multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content") == null ? "" : multipartRequest.getParameter("content");
		String totHash = multipartRequest.getParameter("totHash") == null ? "" : multipartRequest.getParameter("totHash");
		String part = multipartRequest.getParameter("part") == null ? "" : multipartRequest.getParameter("part");
		String fName = multipartRequest.getParameter("file") == null ? "" : multipartRequest.getParameter("file");
		String hostIp = multipartRequest.getParameter("hostIp") == null ? "" : multipartRequest.getParameter("hostIp");
		String secretSw = multipartRequest.getParameter("secretSw") == null ? "off" : multipartRequest.getParameter("secretSw");
		

		int idx = multipartRequest.getParameter("idx") == null ? 0 : Integer.parseInt(multipartRequest.getParameter("idx"));
		String fSName = dao.getFname(idx);
		
		File file = new File(realPath+"/"+fSName);
		
		if(file.exists()) {
			file.delete();
		}
				
		
		
		HttpSession session = request.getSession();
		String nickName = (String) session.getAttribute("sNickName"); 
		if(!totHash.equals("")) {
			totHash = totHash.substring(0,totHash.lastIndexOf("/hash/"));
		}
		

		
		vo.setfName(originalfName);
		vo.setfSName(filesysyemName);
		vo.setNickName(nickName);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		vo.setPart(part);
		vo.setGesifanPwd(gesifanPwd);
		vo.setHashTag(totHash);
		vo.setSecretSw(secretSw);
		
		
		dao.setGesifanInputUpdateOk(vo,idx,1);                                            
	  
		
		request.setAttribute("msg", "artGesifanUpdateOk");
		request.setAttribute("url", request.getContextPath()+"/artGesifan.ge");
	}
}
