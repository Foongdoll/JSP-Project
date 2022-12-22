package artAuction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import artMain.ArtMemDAO;

public class ArtWorkWriterInputOkCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/data/artAuction");
		
		int maxSize = 1024 * 1024 * 10; // 서버에 저정할 최대 용량 10MB
		String encoding = "UTF-8";
		
		// 파일 업로드 
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath,maxSize,encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보를 추출해보자.. COS 외부라이브러리 이용 
		String OriginalfName = multipartRequest.getOriginalFileName("wfName");  // 업로드 시킨 파일명
		String filesystemName = multipartRequest.getFilesystemName("wfName");   // 서버에 저장되는 파일명
		
		String writerName = multipartRequest.getParameter("writerName") == null ? "" : multipartRequest.getParameter("writerName");
		String gender = multipartRequest.getParameter("gender") == null ? "" : multipartRequest.getParameter("gender");
		String birthDay = multipartRequest.getParameter("birthDay") == null ? "" : multipartRequest.getParameter("birthDay");
		String homeTown = multipartRequest.getParameter("homeTown") == null ? "" : multipartRequest.getParameter("homeTown");
		String inFor = multipartRequest.getParameter("inFor") == null ? "" : multipartRequest.getParameter("inFor");
		String openSw = multipartRequest.getParameter("writeropenSw") == null ? "off" : multipartRequest.getParameter("writeropenSw");
		
		System.out.println(openSw);
		
		ArtAuctionVO vo = new ArtAuctionVO();
		ArtAuctionDAO dao = new ArtAuctionDAO();
		
		System.out.println(OriginalfName);
		System.out.println(filesystemName);
		vo.setWriterName(writerName);
		vo.setWriterGender(gender);
		vo.setWriterBirthday(birthDay);
		vo.setWriterHomeTown(homeTown);
		vo.setWriterInfor(inFor);
		vo.setWriterFname(OriginalfName);
		vo.setWriterFsName(filesystemName);
		vo.setWriteropenSw(openSw);
		
		dao.setWriterInput(vo); 
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		ArtMemDAO memdao = new ArtMemDAO();
		memdao.setWriterLevel(mid);
		session.setAttribute("sLevel", "3");
		
		request.setAttribute("msg", "ArtWorkWriterInputOk");
		request.setAttribute("url", request.getContextPath()+"/Index2.jsp");
	}
}