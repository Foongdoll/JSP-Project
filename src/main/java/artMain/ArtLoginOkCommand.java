package artMain;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.RowDataCursor;

import admin.ArtAdminDAO;
import artAuction.ArtAuctionDAO;
import artAuction.ArtAuctionVO;
import conn.SecurityUtil;

public class ArtLoginOkCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String hostIp = request.getParameter("hostIp") == null ? "" : request.getParameter("hostIp");
		int sw = request.getParameter("sw") == null ? 0 : Integer.parseInt(request.getParameter("sw"));
		
		
		ArtMemDAO dao = new ArtMemDAO();
		
		SecurityUtil securityUtil = new SecurityUtil();
		pwd = securityUtil.encryptSHA256(pwd);
		dao.sethostIpUpdate(hostIp,mid);
		ArtVO vo = dao.setLoginMemberSearch(mid,pwd);
		//----------------------------------------------- 로그인 처리 ---------------------------------------------
		if(vo.getName() != null && vo.getMemDelete() != 0) {                             // vo 에 값이 있다는것은 회원정보가 존재한다는 뜻 즉, 로그인하기전 셋팅을 위한 조건문
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sNickName", vo.getNickName());
			session.setAttribute("sLevel", vo.getLevel());
			
			ArtAuctionDAO AucDao = new ArtAuctionDAO();
			ArtAuctionVO AucVo = new ArtAuctionVO();
			
			// 탈퇴 처리 된 회원인지 아닌지 구분 
			
			String reportMsg = "";
			if(vo.getReportCnt() > 4) {
				reportMsg = "신고 점수가"+vo.getReportCnt()+"점 입니다 10점 이상 부터는 하루 동안 게시글/댓글 작성 불가 패널티를 받으십니다. 이 점 유의해주세요.";
				request.setAttribute("reportMsg", reportMsg);
			}
			
			if(vo.getMemDelete() == 0) {
				request.setAttribute("msg", "artLoginDeleteID");
				request.setAttribute("url", request.getContextPath()+"/Index2.jsp");
				return;
			}
			
			
			// 현재 이 사람이 낙찰된 작품 상태를 입찰 테이블에있는 cancelSw 를 대기에서 취소 낙찰로 변하기 전엔 계속 로그인 할떄마다 띄움 최초 1회만 
			// 마이페이지에서 바꾸던가 로그인 시 뜨는 모달창에서 바꿀수 있음 
			
			
			String nickName = (String)request.getSession().getAttribute("sNickName");
			
			ArrayList<ArtAuctionVO> vos = AucDao.getCancelSw(mid); 
			
			String workName = "";
			
		if(vos.size() > 0) {
			for(int i = 0; i < vos.size(); i++) {
				AucVo = vos.get(i);
				
				if(AucVo.getCancelSw().equals("경매 진행중")) {
					int res = AucDao.getNackChalUpdate(nickName);
					if(res == 1) {
							
							ArrayList<ArtAuctionVO> ovos = AucDao.getOverLastDateMemberSearch();
							
							for(int j = 0; j < ovos.size(); j++) {
								AucVo = ovos.get(j);
								if(AucVo.getIpchalmember().equals(vo.getNickName())) {
									if(!workName.contains(AucVo.getWork())) {
										workName += AucVo.getWork()+",";
										workName = workName.substring(0,workName.length()-1);
									}
								}
							}
						} 
					}
				else if(AucVo.getCancelSw().equals("낙찰")) {
					
					ArrayList<ArtAuctionVO> ovos = AucDao.getOverLastDateMemberSearch();
					
					for(int j = 0; j < ovos.size(); j++) {
						AucVo = ovos.get(j);
						if(AucVo.getIpchalmember().equals(vo.getNickName())) {
							if(!workName.contains(AucVo.getWork())) {
								workName += AucVo.getWork()+",";
								workName = workName.substring(0,workName.length()-1);
							}
						}
					}
				}
			}
		}
				String levelUpMsg = "";
			if(vo.getPoint() >= 1000 && vo.getLevel() == 1) {
				dao.setMemberLevleUp(mid);
				System.out.println("들어옴");
				levelUpMsg = "방문 포인트가 1000점이상이되어 정회원등급으로 승급되셨습니다.";
				request.setAttribute("levelUpMsg", levelUpMsg);
			}
			
			
			
			dao.setLastDate(mid);                      // 로그인 하면서 마지막 로그인 일자를 오늘로 셋팅
			String newLastDATE = dao.getLastDate(mid); // newLastDATE 에는 갱신된 날짜 즉, 오늘 날짜가 들어있음
			newLastDATE = newLastDATE.substring(0,11);
			String lastDATE = vo.getLastDate().substring(0,11);
			int TodayVisitCnt = 0;
			int todayRes = 0;
			if(newLastDATE.equals(lastDATE)) { // 날짜가 같음 즉 하루가 안지났음
				
				dao.TodayVisitCnt(mid,todayRes);      // 로그인한 회원의 오늘 방문 횟수를 1 추가함
				TodayVisitCnt	= dao.getTodayVisitCnt(mid);
				
				if(TodayVisitCnt <= 10) {
					dao.setTodayPoint(mid);       					 // 로그인한 회원의 포인트를 10 적립해줌
				}
				
			}
			else if(!newLastDATE.equals(lastDATE)) {// 날짜가 다름 즉, 하루가 지났음
				int rsw = 0;
				if(vo.getReportCnt()>1) {
					rsw = 1;
				}
				else if(vo.getReportCnt() == 1) {
					rsw = 0;
				}
				if(vo.getReportCnt() > 0) {
					new ArtAdminDAO().setMemberReportCntReset(mid,rsw);
				}
				
				todayRes = 1;// 1이면 초기화 
				dao.TodayVisitCnt(mid,todayRes);       // 하루가 지났으니 방문횟수를 0으로 초기화
				
				todayRes = 0;// 0이면 1 추가            
				dao.TodayVisitCnt(mid,todayRes);      // 로그인한 회원의 오늘 방문 횟수를 1 추가함
				
				dao.setTodayPoint(mid);       					 // 로그인한 회원의 포인트를 10 적립해줌
			}
			
			if(sw == 1) {
				request.setAttribute("msg", "artLoginOk");
				request.setAttribute("url", request.getContextPath()+"/artGesifan.ge");
				return;
			}
			else if(sw == 2){
				request.setAttribute("msg", "artLoginOk");
				request.setAttribute("url", request.getContextPath()+"/artAuction.ac");
				return;
			}
			
			request.setAttribute("msg", "artLoginOk");
			request.setAttribute("url", request.getContextPath()+"/Index2.jsp?workName="+workName);
		}
		else{
			request.setAttribute("msg", "artLoginNo");
			request.setAttribute("url", request.getContextPath()+"/artLogin.art");
		}
	}
}
