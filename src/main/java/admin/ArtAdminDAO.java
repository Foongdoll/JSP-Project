package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.RowDataCursor;

import artAuction.ArtAuctionVO;
import artAuction.ArtWorkIpchalVO;
import artGesifan.ArtGesifanVO;
import artGesifan.ArtReportVO;
import artMain.ArtMemDAO;
import artMain.ArtVO;
import conn.GetConn;

public class ArtAdminDAO {
//싱글톤을 이용한 DB연결 객체 연결하기...
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	

	public int getMemberListRecCnt() {
		int totRecCnt = 0;
		
		try {
			sql = "select count(*) as cnt from artMember order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt = rs.getInt("cnt");
			
		} catch (SQLException e) {
			System.out.println("sql에러 : "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		
		return totRecCnt;
	}

	public ArrayList<ArtVO> getMemberList(int startIndexNo, int pageSize) {
		ArrayList<ArtVO> vos = new ArrayList<>();
		
		
		try {
			sql = "select * from artMember order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArtVO vo = new ArtVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setEmail(rs.getString("email"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTel(rs.getString("tel"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setAddress(rs.getString("address"));
				vo.setAddress(rs.getString("address"));
				vo.setPoint(rs.getInt("point"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setAggrement(rs.getInt("aggrement"));
				vo.setLevel(rs.getInt("level"));
				vo.setMemDelete(rs.getInt("memDelete"));
				vo.setTodayVisitCnt(rs.getInt("todayVisitCnt"));
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("sql에러 : "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}

	public void setMemberSecession(String art, String nickName) {
		
		try {
				sql = "delete from "+art+" where nickName = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, nickName);
				pstmt.executeUpdate();
			
				getConn.pstmtClose();
				
				sql = "delete from artwork where workwriter = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, nickName);
				pstmt.executeUpdate();
				
				
		} catch (SQLException e) {
			System.out.println("sql에러 : "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}

	public int getWriterListRecCnt() {
		int totRecCnt = 0;
		
		try {
			sql = "select count(*) as cnt from writer";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totRecCnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			System.out.println("sql에러 : "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return totRecCnt;
	}

	public ArrayList<ArtAuctionVO> getWriterList(int startIndexNo, int pageSize) {
		ArrayList<ArtAuctionVO> vos = new ArrayList<>();
		
		try {
			sql = "select * from writer";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArtAuctionVO aucVo = new ArtAuctionVO();
				
				aucVo.setWriterName(rs.getString("writerName"));
				aucVo.setWriterGender(rs.getString("writerGender"));
				aucVo.setWriterBirthday(rs.getString("writerBirthday"));
				aucVo.setWriterHomeTown(rs.getString("writerHomeTown"));
				aucVo.setWriterInfor(rs.getString("writerInfor"));
				aucVo.setWriterFsName(rs.getString("writerFsName"));
				
				vos.add(aucVo);
			}
			
		} catch (SQLException e) {
			System.out.println("sql에러 : "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		
		return vos;
	}

	public int totAuctionListRecCnt() {
		int totRecCnt = 0;
		
		try {
			sql = "select count(*) as cnt from artWork";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totRecCnt = rs.getInt("cnt");
			}
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

	public ArrayList<ArtAuctionVO> getAuctionWork(int startIndexNo, int pageSize) {
		ArrayList<ArtAuctionVO> vos = new ArrayList<>();
		
		try {
			sql = "select * from artWork limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArtAuctionVO vo = new ArtAuctionVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setWork(rs.getString("work"));
				vo.setWorkFname(rs.getString("workFname"));
				vo.setWorkFSname(rs.getString("workFSname"));
				vo.setWorkWriter(rs.getString("workWriter"));
				vo.setWriterBirthYear(rs.getString("writerBirthYear"));
				vo.setWorkSize(rs.getString("workSize"));
				vo.setWorkComment(rs.getString("workComment"));
				vo.setChuJungPrice(rs.getString("chuJungPrice"));
				vo.setStartPrice(rs.getString("startPrice"));
				vo.setCurrentPrice(rs.getString("currentPrice"));
				vo.setIpchalCnt(rs.getInt("ipchalCnt"));
				vo.setWorkStartDate(rs.getString("workStartDate"));
				vo.setWorkLastDate(rs.getString("workLastDate"));
				vo.setBoomnackchalPrice(rs.getString("boomnackchalPrice"));
				
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		return vos;
	}
	
	public int totIpChalListRecCnt() {
		int totIpchalRecCnt = 0;
		
		try {
			sql = "select count(*) as cnt from artWorkIpchal";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totIpchalRecCnt = rs.getInt("cnt");
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return totIpchalRecCnt;
	}
	
	public ArrayList<ArtWorkIpchalVO> getIpchalAllList(int startIndexNo, int pageSize) {
		ArrayList<ArtWorkIpchalVO> vos = new ArrayList<>();
		
		try {
			 sql = "select w.work as workName,m.name as ipchalName,i.wDate as wDate,i.cancelSw as cancelSw,i.ipchalprice as ipchalprice,w.workLastDate as workLastDate"
			 		+ "					from artWorkIpchal i,artMember m,artWork w "
			 		+ "					where i.memberIdx = m.idx and i.workIdx = w.idx "
			 		+ "					order by i.idx"
			 		+ "					limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo); 
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArtWorkIpchalVO ipchalVo = new ArtWorkIpchalVO();
				
				ipchalVo.setIpchalName(rs.getString("ipchalName"));
				ipchalVo.setIpchalprice(rs.getInt("ipchalprice"));
				ipchalVo.setWorkName(rs.getString("workName"));
				ipchalVo.setwDate(rs.getString("wDate"));
				ipchalVo.setWorkLastDate(rs.getString("workLastDate"));
				ipchalVo.setCancelSw(rs.getString("cancelSw"));
				
				vos.add(ipchalVo);
			}
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return vos;
	}
	
	public int totGesifanListRecCnt(int sw) {
		int totRecCnt = 0;
		
		try {
			if(sw == 0) {
				sql = "select count(*) as cnt from artGesifan";
				pstmt = conn.prepareStatement(sql);
			}
			else if(sw == 1) {
				sql = "select count(*) as cnt from artGesifan where part = '공지사항'";
				pstmt = conn.prepareStatement(sql);
			}
			else if(sw == 2) {
				sql = "select count(*) as cnt from artGesifan where part = '그림 잡담'";
				pstmt = conn.prepareStatement(sql);
			}
			else if(sw == 3) {
				sql = "select count(*) as cnt from artGesifan where part = '그림 문의'";
				pstmt = conn.prepareStatement(sql);
			}
			else if(sw == 4) {
				sql = "select count(*) as cnt from artGesifan where part = '자유'";
				pstmt = conn.prepareStatement(sql);
			}
			
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt = rs.getInt("cnt");
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		return totRecCnt;
	}
	
	public ArrayList<ArtGesifanVO> getGesifanList(int startIndexNo, int pageSize, int sw) {
		ArrayList<ArtGesifanVO> vos = new ArrayList<>();
		try {
			if(sw == 0) {
				sql = "select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff from artGesifan order by idx desc limit ?,?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else if(sw == 1) {
				sql = "select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff from artGesifan where part='공지사항' order by idx desc limit ?,?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else if(sw == 2) {
				sql = "select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff from artGesifan where part='그림 잡담' order by idx desc limit ?,?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else if(sw == 3) {
				sql = "select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff from artGesifan where part='그림 문의' order by idx desc limit ?,?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else if(sw == 4) {
				sql = "select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff from artGesifan where part='자유' order by idx desc limit ?,?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
				
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			ArtGesifanVO vo = new ArtGesifanVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setwDate(rs.getString("wDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setGood(rs.getInt("good"));
				vo.setGesifanPwd(rs.getInt("gesifanPwd"));
				vo.setHashTag(rs.getString("hashtag"));
				vo.setPart(rs.getString("part"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setSecretSw(rs.getString("secretSw"));
				
				vo.setDay_diff(rs.getInt("day_diff"));
				vo.setHour_diff(rs.getInt("hour_diff"));
				vos.add(vo);
			}
				
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		return vos;
	}

	public int totAdminReportListRecCnt() {
		int totRecCnt = 0;
		
		try {
			sql = "select count(*) as cnt from artGesifanReport";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totRecCnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		return totRecCnt;
	}

	public ArrayList<ArtReportVO> getReportList(int startIndexNo, int pageSize) {
		ArrayList<ArtReportVO> vos = new ArrayList<>();
		
		try {
			sql = "select r.*,g.title as title,g.nickName as writer,m.reportCnt as reportCnt  from artGesifanReport r,artGesifan g,artmember m "
					+ "where g.idx = r.gesifanidx and g.nickName = m.nickName "
					+ "order by idx desc "
					+ "limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArtReportVO vo = new ArtReportVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setWriter(rs.getString("writer"));
				vo.setGesifanidx(rs.getInt("gesifanidx"));
				vo.setReporter(rs.getString("reporter"));
				vo.setContent(rs.getString("content"));
				vo.setrDate(rs.getString("rDate"));
				vo.setCurrentSw(rs.getString("currentSw"));
				vo.setTitle(rs.getString("title"));
				vo.setReportCnt(rs.getInt("reportCnt"));
				
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		return vos;
	}

	public String setUpdateReportProcess(int idx, int sw) {
		String res = "";
		
		try {
			if(sw == 1) {
				sql = "update artGesifanReport set currentSw = '처리중' where idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				res = "접수에서 처리중으로 수정되었습니다.";
			}
			else if(sw == 2) {
				sql = "update artGesifanReport set currentSw = '처리 완료' where idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				res = "처리중에서 처리완료로 수정되었습니다.";
			}
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		
		return res;
	}

	public String getCurrentSw(int idx) {
		String currentSw = "";
		
		try {
			sql = "select currentSw from artGesifanReport where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				currentSw = rs.getString("currentSw");
			}
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		return currentSw;
	}

  public String setMemberLevelUpdate(int memIdx, int memLevel) {
  String res = "";
  try {
  	sql = "update artmember set level = ? where idx = ?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setInt(1, memLevel);
  	pstmt.setInt(2, memIdx);
  	pstmt.executeUpdate();
  	res = "회원등급이 변경되었습니다.";
  } catch (SQLException e) { 
  	System.out.println("sql 에러 : "+e.getMessage());
  }finally { 
  	getConn.pstmtClose(); 
  }
  
  return res;
  }

	public String setMemberPenalty(String nickName) {
		String res = "";
		
		try {
			sql = "update artmember set reportCnt = reportCnt + 1 where nickName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			pstmt.executeUpdate();
			res = "해당 유저 신고 점수 1점 누적되었습니다.";
		 } catch (SQLException e) { 
		  	System.out.println("sql 에러 : "+e.getMessage());
		 }finally { 
		  	getConn.pstmtClose(); 
		 }
		  
		
		return res;
	}

	public int getMemberReportCnt(String nickName) {
		int rCnt = 0;

		try {
			sql = "select reportCnt from artmember where nickName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rCnt = rs.getInt("reportCnt");
			}
			
		 } catch (SQLException e) { 
		  	System.out.println("sql 에러 : "+e.getMessage());
		 }finally { 
		  	getConn.rsClose(); 
		 }
		
		return rCnt;
	}

	public void setMemberReportCntReset(String mid, int sw) {
		
		try {
			if(sw == 1) {
				sql = "update artmember set reportCnt = reportCnt - 2 where mid = ?";
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "update artmember set reportCnt = 0 where mid = ?";
				pstmt = conn.prepareStatement(sql);
			}
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			
		 } catch (SQLException e) { 
		  	System.out.println("sql 에러 : "+e.getMessage());
		 }finally { 
		  	getConn.pstmtClose(); 
		 }
	}

	public ArrayList<ArtAuctionVO> getOneWriterWorks(String writerInfor, String writerName, int startIndexNo, int pageSize) {
		ArrayList<ArtAuctionVO> vos = new ArrayList<>();
		
		try {
			sql = "select w.*,ww.* from artwork w,artmember m,writer ww "
					+ "	where w.workWriter = ? and ww.writerInfor = ? limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writerName);
			pstmt.setString(2, writerInfor);
			pstmt.setInt(3, startIndexNo);
			pstmt.setInt(4, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			ArtAuctionVO vo = new ArtAuctionVO();
				
				vo.setWriterName(writerName);
				vo.setWriterInfor(writerInfor);
				vo.setWriterGender(rs.getString("writerGender"));
				vo.setWriterHomeTown(rs.getString("writerHomeTown"));
				
				
				vo.setWorkFSname(rs.getString("workFsName"));
				vo.setWork(rs.getString("work"));
				vo.setWorkSize(rs.getString("workSize"));
				vo.setChuJungPrice(rs.getString("chuJungPrice"));
				vo.setStartPrice(rs.getString("startPrice"));
				vo.setCurrentPrice(rs.getString("currentPrice"));
				vo.setWorkStartDate(rs.getString("workStartDate"));
				vo.setWorkLastDate(rs.getString("workLastDate"));
				vo.setBoomnackchalPrice(rs.getString("boomnackchalPrice"));
				
				System.out.println("실제 저장 이름 "+vo.getWorkFSname());
				vos.add(vo);
			}
			
		 } catch (SQLException e) { 
		  	System.out.println("sql 에러 : "+e.getMessage());
		 }finally { 
		  	getConn.rsClose(); 
		 }
		return vos;
	}

	public int totOneWriterWorksRecCnt(String writerInfor, String writerName) {
		int totRecCnt =  0;
		
		try {
			sql = "select count(*) as cnt from artwork w,artmember m,writer ww "
					+ "where w.workWriter = ? and ww.writerInfor = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, writerName);
				pstmt.setString(2, writerInfor);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					totRecCnt = rs.getInt("cnt");
				}
				
		 } catch (SQLException e) { 
		  	System.out.println("sql 에러 : "+e.getMessage());
		 }finally { 
		  	getConn.rsClose(); 
		 }
		
		return totRecCnt;
	}

 
 }