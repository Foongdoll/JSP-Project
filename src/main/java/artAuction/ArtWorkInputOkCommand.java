package artAuction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ArtWorkInputOkCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/data/artAuction");
		
		int maxSize = 1024 * 1024 * 10; // 서버에 저정할 최대 용량 20MB
		String encoding = "UTF-8";
		
		// 파일 업로드 
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath,maxSize,encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보를 추출해보자.. COS 외부라이브러리 이용 
		String OriginalfName = multipartRequest.getOriginalFileName("wfName");  // 업로드 시킨 파일명
		String filesystemName = multipartRequest.getFilesystemName("wfName");   // 서버에 저장되는 파일명
		
		
		String workWriter = multipartRequest.getParameter("workWriter") == null ? "" : multipartRequest.getParameter("workWriter");
		String work = multipartRequest.getParameter("work") == null ? "" : multipartRequest.getParameter("work");
		String workSize1 = multipartRequest.getParameter("workSize1") == null ? "" : multipartRequest.getParameter("workSize1");
		String workSize2 = multipartRequest.getParameter("workSize2") == null ? "" : multipartRequest.getParameter("workSize2");
		String workComment = multipartRequest.getParameter("workComment") == null ? "" : multipartRequest.getParameter("workComment");
		String writerBirthYear = multipartRequest.getParameter("writerBirthYear") == null ? "" : multipartRequest.getParameter("writerBirthYear");
		String workStartDate = multipartRequest.getParameter("workStartDate") == null ? "" : multipartRequest.getParameter("workStartDate");
		String workLastDate = multipartRequest.getParameter("workLastDate") == null ? "" : multipartRequest.getParameter("workLastDate");
		String chuJungPrice = multipartRequest.getParameter("chuJungPrice") == null ? "" : multipartRequest.getParameter("chuJungPrice");
		String startPrice = multipartRequest.getParameter("startPrice") == null ? "" : multipartRequest.getParameter("startPrice");
		String boomnackchalPrice = multipartRequest.getParameter("boomnackchalPrice") == null ? "" : multipartRequest.getParameter("boomnackchalPrice");
		
		ArtAuctionVO vo = new ArtAuctionVO();
		ArtAuctionDAO dao = new ArtAuctionDAO();
		
		String workSize = workSize1 +"x"+workSize2;
		
		
		vo.setWork(work); 
		vo.setWorkFname(OriginalfName);
		vo.setWorkFSname(filesystemName);
		vo.setWorkWriter(workWriter);
		vo.setWriterBirthYear(writerBirthYear);
		vo.setWorkSize(workSize);
		vo.setWorkComment(workComment);
		vo.setWorkStartDate(workStartDate);
		vo.setWorkLastDate(workLastDate);
		vo.setStartPrice(startPrice);
		vo.setChuJungPrice(chuJungPrice);
		vo.setBoomnackchalPrice(boomnackchalPrice);
		
		dao.setWorkInput(vo);
		
		
		request.setAttribute("msg", "ArtWorkDBInputOk");
		request.setAttribute("url", request.getContextPath()+"/Index2.jsp");
		
	}
}
