package artAuction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import artGesifan.ArtGesifanCommentVO;
import artMyPage.ArtNackChalVO;
import conn.GetConn;

public class ArtAuctionDAO {
//싱글톤을 이용한 DB연결 객체 연결하기...
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ArtAuctionVO vo = null;

	public void setWriterInput(ArtAuctionVO vo) {
		String res = "0";
		
		try {
			sql = "insert into writer values(default,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriterName());
			pstmt.setString(2, vo.getWriterGender());
			pstmt.setString(3, vo.getWriterBirthday());
			pstmt.setString(4, vo.getWriterHomeTown());
			pstmt.setString(5, vo.getWriterInfor());
			pstmt.setString(6, vo.getWriterFname());
			pstmt.setString(7, vo.getWriterFsName());
			pstmt.setString(8, vo.getWriteropenSw());
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		
	}

	public ArtAuctionVO getWriterInfor(String writerNmae) {
		vo = new ArtAuctionVO();
		
		try {
			sql = "select * from writer where writerName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writerNmae);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setWriterName(writerNmae);
				vo.setWriterGender(rs.getString("writerGender"));
				vo.setWriterBirthday(rs.getString("writerBirthday"));
				vo.setWriterHomeTown(rs.getString("writerHomeTown"));
				vo.setWriterInfor(rs.getString("writerInfor"));
				vo.setWriterFname(rs.getString("writerFname"));
				vo.setWriterFsName(rs.getString("writerFsName"));
				vo.setWriteropenSw(rs.getString("writeropenSw"));
			}
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return vo;
	}

	public void setWorkInput(ArtAuctionVO vo) {
	
		try {
			sql = "insert into artWork values(default,?,?,?,?,?,?,?,?,?,?,default,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWork());
			pstmt.setString(2, vo.getWorkFname());
			pstmt.setString(3, vo.getWorkFSname());
			pstmt.setString(4, vo.getWorkWriter());
			pstmt.setString(5, vo.getWriterBirthYear());
			pstmt.setString(6, vo.getWorkSize());
			pstmt.setString(7, vo.getWorkComment());
			pstmt.setString(8, vo.getChuJungPrice());
			pstmt.setString(9, vo.getStartPrice());
			pstmt.setString(10, vo.getStartPrice());
			pstmt.setString(11, vo.getWorkStartDate());
			pstmt.setString(12, vo.getWorkLastDate());
			pstmt.setString(13, vo.getBoomnackchalPrice());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
	}

	public ArrayList<ArtAuctionVO> getAuctionWork(int startIndexNo, int pageSize) {
		ArrayList<ArtAuctionVO> vos = new ArrayList<>();
		
		try {
			sql = "select *,datediff(now(), workLastDate) as day_diff from artWork limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ArtAuctionVO();
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
				
				vo.setDay_diff(rs.getInt("day_diff"));
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		return vos;
	}


	public ArtAuctionVO getAuctioWorkInfor(int idx) {
		vo = new ArtAuctionVO();
		
		try {
			sql = "select *,datediff(now(), workLastDate) as day_diff from artWork w where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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
				vo.setDay_diff(rs.getInt("day_diff"));
			}
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return vo;
	}


	public void setIpchalInput(int memberIdx, int workIdx, int ipchalprice, String nickName) {
	
		try {
			sql = "insert into artWorkIpchal values(default,?,?,?,default,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workIdx);
			pstmt.setInt(2, memberIdx);
			pstmt.setInt(3, ipchalprice);
			pstmt.setString(4, nickName);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		
		
	}

	public void setCurrentPriceUpdate(int workIdx, int ipchalPrice) {
		
		try {
			sql = "update artWork set currentPrice = ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ipchalPrice);
			pstmt.setInt(2, workIdx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		
		
		
	}

	public String getIpchalCancel(int memIdx, int workIdx) {
		String res = "0";
		try {
			sql = "delete from artWorkIpchal where memberIdx = ? and workIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memIdx);
			pstmt.setInt(2, workIdx);
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	public int totIpchalListRecCnt(int workidx) {
		int totIpchalRecCnt = 0;
		
		try {
			sql = "select count(*) as cnt from artWorkIpchal where workIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workidx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totIpchalRecCnt = rs.getInt("cnt");
			}
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		return totIpchalRecCnt;
	}

	public ArrayList<ArtWorkIpchalVO> getIpchalList(int startIndexNo, int pageSize, int workidx) {
		ArrayList<ArtWorkIpchalVO> vos = new ArrayList<>();
		
		try {
			sql = "select i.cancelSw as cancelSw,m.name as ipchalName,i.ipchalprice as ipchalPrice "
					+ "from artWorkIpchal i,artMember m "
					+ "where workIdx = ? and m.idx = i.memberIdx limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workidx);
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArtWorkIpchalVO vo = new ArtWorkIpchalVO();
				
				vo.setCancelSw(rs.getString("cancelSw"));
				vo.setIpchalName(rs.getString("ipchalName"));
				vo.setIpchalprice(rs.getInt("ipchalPrice"));
				
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
			 		+ "	from artWorkIpchal i,artMember m,artWork w "
			 		+ "	where i.memberIdx = m.idx and i.workIdx = w.idx "
			 		+ "	order by i.idx desc"
			 		+ "	limit ?,?";
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


	public void setIpchalCntPlus(int workIdx) {
		
		try {
			sql = "update artWork w,artWorkIpchal i set ipchalCnt = ipchalCnt + 1 where w.idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workIdx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		
	}

	public ArrayList<ArtAuctionVO> getOverLastDateMemberSearch() {
		ArrayList<ArtAuctionVO> vos = new ArrayList<>();
		try { 
			sql = "select i.cancelSw as cancelSw,i.ipchalmember as ipchalmember,w.work as work,i.ipchalPrice as ipchalPrice "
					+ "	from artWork w,artWorkIpchal i "
					+ "	where w.idx = i.workIdx and i.cancelSw = '낙찰'"
					+ "	group by w.work"
					+ "	order by i.ipchalPrice desc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					vo = new ArtAuctionVO();
					
					vo.setIpchalmember(rs.getString("ipchalmember"));
					vo.setWork(rs.getString("work"));
					vo.setIpchalprice(rs.getInt("ipchalPrice"));
					
					vos.add(vo);
				}
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		return vos;
	}

	public ArrayList<ArtAuctionVO> getCancelSw(String mid) {
		ArrayList<ArtAuctionVO> vos = new ArrayList<>();
		
		try {
			sql = "select i.cancelSw as currentCancelSw"
					+ "	from artWork w,artWorkIpchal i,artMember m"
					+ "	where i.memberIdx = m.idx and w.idx = i.workidx and m.mid = ?"
					+ "	order by i.ipchalPrice desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ArtAuctionVO();
				vo.setCancelSw(rs.getString("currentCancelSw"));
				
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}
	
	
	public ArtAuctionVO getAuctioWorkInforName(String workName) {
		vo = new ArtAuctionVO();
		try {
			sql = "select * from artWork where work = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, workName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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
			}
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		
		return vo;
	}

	public void setWorkSuccess(String work, int wIdx, String mid) {
		
		try {
			sql = "update artworkipchal i,artwork w,artmember m set i.cancelSw = '배송 완료' "
					+ "where m.idx = i.memberidx and i.workidx = w.idx "
					+ "and w.work = ? and w.idx = ? and m.mid = ? and i.cancelSw != '경매 진행중' ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, work);
			pstmt.setInt(2, wIdx);
			pstmt.setString(3, mid);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
	}

	public int totAuctionListRecCnt() {
		int totRecCnt = 0;
		
		try {
			sql = "select count(*) as cnt from artWork ";
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


	public int getNackChalUpdate(String nickName) {
		int res = 0;
		try {
			sql = "update artWorkipchal i,artmember m,artwork w set cancelSw = '낙찰' "
					+ "where datediff(now(), w.workLastDate) > 0 and i.memberidx = m.idx and i.workidx = w.idx and i.ipchalmember = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	public int getLastDateCheck(int workidx) {
		int overLastDate = 0;
		try {
			sql = "select datediff(now(), w.workLastDate) as day_diff from artwork w,artworkipchal i where w.idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workidx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				overLastDate = rs.getInt("day_diff");
			}
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		return overLastDate;
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
				aucVo.setWorkFSname(rs.getString("writerFsName"));
				
				vos.add(aucVo);
			}
			
		} catch (SQLException e) {
			System.out.println("sql에러 : "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		
		return vos;
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

	public int totAuctionSearchListRecCnt(String searchContent, String searchStr) {
		int totRecCnt = 0;
		try {
			if(searchStr.equals("작가명")) {
				sql = "select count(*) as cnt from artwork where workWriter like ?";
			}
			else if(searchStr.equals("작품명")) {
				sql = "select count(*) as cnt from artwork where work like ?";
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchContent+"%");
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

	public ArrayList<ArtAuctionVO> getAuctionSearchWork(int startIndexNo, int pageSize, String searchContent,String searchStr) {
		ArrayList<ArtAuctionVO> vos = new ArrayList<>();
		
		try {
			if(searchStr.equals("작가명")) {
				sql = "select * from artWork where workWriter like ? limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchContent+"%");
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, pageSize);
			}
			else if(searchStr.equals("작품명")){
				sql = "select * from artWork where work like ? limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchContent+"%");
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, pageSize);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ArtAuctionVO();
				
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

	public int totAdminCommentListRecCnt() {
		int totRecCnt = 0;
		
		try {
			sql = "select count(*) as cnt from artComment order by idx desc";
			pstmt = conn.prepareStatement(sql);
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

	public ArrayList<ArtGesifanCommentVO> getAdminCommentList(int startIndexNo, int pageSize) {
		ArrayList<ArtGesifanCommentVO> vos = new ArrayList<>();
		
		try {
			sql = "select * from artComment order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArtGesifanCommentVO vo = new ArtGesifanCommentVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setGesifanIdx(rs.getInt("gesifanIdx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setwDate(rs.getString("wDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setComment(rs.getString("comment"));
				
				vos.add(vo);
			}
			
			} catch (SQLException e) {
				System.out.println("sql 에러 : "+e.getMessage());
			}finally {
				getConn.rsClose();
			}
		
		
		return vos;
	}

	public void setWorkNowBuy(String nickName, int workIdx) {
		int memberIdx = 0;
		int bPrice = 0;
		
		try {
			sql = "select m.idx as mIdx,w.boomnackchalPrice as bPrice "
					+ "from artmember m,artwork w "
					+ "where m.nickName = ? and w.idx = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, nickName);
					pstmt.setInt(2, workIdx);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						memberIdx = rs.getInt("mIdx");
						bPrice = rs.getInt("bPrice");
					}
					getConn.pstmtClose();
					
					sql = "insert into artWorkIpchal values(default,?,?,?,'낙찰',default,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, workIdx);
					pstmt.setInt(2, memberIdx);
					pstmt.setInt(3, bPrice);
					pstmt.setString(4, nickName);
					pstmt.executeUpdate();
					
					getConn.pstmtClose();
					
					sql = "update artwork set currentPrice = ? where idx = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,String.valueOf(bPrice));
					pstmt.setInt(2, workIdx);
					pstmt.executeUpdate();
					
			} catch (SQLException e) {
				System.out.println("sql 에러 : "+e.getMessage());
			} finally {
				getConn.rsClose();
			}
		
	}

	public String getReadCancelSw(int workidx) {
		String cancelSw = "";
		
		try {
			sql = "select cancelSw as cancelSw from artWorkIpchal where workIdx = ? and cancelSw = '낙찰'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workidx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cancelSw = rs.getString("cancelSw");
			}
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
			
		
		return cancelSw;
	}

	
}