package artMain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import artAuction.ArtAuctionVO;
import artGuest.ArtGuestVO;
import conn.GetConn;

public class ArtMemDAO {
//싱글톤을 이용한 DB연결 객체 연결하기...
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ArtVO vo = null;

	
	// 회원가입 시 회원의 정보를 전부 DB에 담는 처리
	public int setMemberInformation(ArtVO vo) {
		int res = 0;
		try {
			sql = "insert into artMember values (default,?,?,?,?,?,?,?,?,?,?,default,default,default,default,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getNickName());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getBirthday());
			pstmt.setString(9, vo.getAddress());
			pstmt.setString(10, vo.getHostIp());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		
		return res;
	}
	// 로그인 시에 입력받은 ID PWD 로  회원 정보가 있는지 탐색 
	public ArtVO setLoginMemberSearch(String mid, String pwd) {
	 vo = new ArtVO();
	 
		try {
				sql = "select * from artMember where mid = ? and pwd = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.setString(2, pwd);
				rs = pstmt.executeQuery();
				if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(mid);
				vo.setPwd(pwd);
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
				vo.setReportCnt(rs.getInt("reportCnt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vo;
	}
  // 마지막 접속일을 로그인한 시점으로 세팅하는 처리
	public void setLastDate(String mid) {
		
		try {
			sql = "update artMember set lastDate = now() where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
	// 마지막 접속일을 세팅한 후 그전 로그인 시에 가져간 VO 에 있는 마지막 접속일과 비교를 위해 업데이트한거 다시 꺼내는 처리
	public String getLastDate(String mid) {
		String newLastDATE = "";
		
		try {
			sql = "select * from artMember where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next())
				newLastDATE = rs.getString("lastDate");
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return newLastDATE;
	}
	// 방문 시 10포인트씩 적립해주는 처리 
	public void setTodayPoint(String mid) {
		
		try {
			sql = "update artMember set point = point + 10 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}
	// 방문 시 todayCnt 를 카운트 해주는 처리
	public void TodayVisitCnt(String mid, int todayRes) {
		
		try {
			if(todayRes == 0) 
				sql = "update artMember set todayVisitCnt = todayVisitCnt + 1 where mid = ?";
			else 
				sql = "update artMember set todayVisitCnt = 0 where mid = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
	// 오늘 방문횟수 가져가기
	public int getTodayVisitCnt(String mid) {
		int TodayVisitCnt = 0;
		
		try {
				sql = "select * from artMember where mid = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				rs = pstmt.executeQuery();
				if(rs.next())
					TodayVisitCnt = rs.getInt("todayVisitCnt");
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return TodayVisitCnt;
	}
	
	// 아이디 비밀번호 찾기 
	public ArtVO getFindIdPwd(String nickName,String mid,int memCheck, String memCheckmsg) {
		vo = new ArtVO();
		try {
			if(memCheck == 1) {
				sql = "select * from artMember where nickName = ? and tel = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, nickName);
				pstmt.setString(2, memCheckmsg);
			}
			else if(memCheck == 2) {
				sql = "select * from artMember where nickName = ? and email = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, nickName);
				pstmt.setString(2, memCheckmsg);
			}
				rs = pstmt.executeQuery();
				if(rs.next()) {
					vo.setFindId(rs.getString("mid"));
				}
	} catch (SQLException e) {
		System.out.println("SQL 에러 : "+ e.getMessage());
	} finally {
		getConn.rsClose();
	}
		
		return vo;
	}
	// 아이디 비번 중복 체크
	public int getMidNickCheck(String mid, String nickName) {
		int res = 0;
		
		try {
			if(!mid.equals("")) {
				sql = "select * from artMember where mid = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
			}
			else if(!nickName.equals("")) {
				sql = "select * from artMember where nickName = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, nickName);
			}
			rs = pstmt.executeQuery();
			rs.next();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return res;
	}
	// 로그인 시에 클라이언트의 아이디를 받아옴
	public void sethostIpUpdate(String hostIp,String mid) {
		
		try {
				sql = "update artMember set hostIp = ? where mid = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, hostIp);
				pstmt.setString(2, mid);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL 에러 : "+ e.getMessage());
			} finally {
				getConn.pstmtClose();
			}
		}
	public void setImsiPwd(String pwd, String mid) {
		
		try {
			sql = "update artMember set pwd = ? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}
// 어드민 회원 정보 페이징 처리 할떄 사용
	public int totMemListRecCnt() {
		int totRecCnt = 0;
		
		try {
			sql = "select count(*) from artMember";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt = rs.getInt("totRecCnt");
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return totRecCnt;
	}
	// 어드민  회원 정보 불러올때 사용 
	public ArrayList<ArtVO> getMemList(int startIndexNo, int pageSize) {
		ArrayList<ArtVO> vos = new ArrayList<>();
		
		try {
			sql = "select * from artMember limit ?, ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(1, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ArtVO();
				
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
				vo.setPoint(rs.getInt("point"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setLevel(rs.getInt("level"));
				vo.setMemDelete(rs.getInt("memDelete"));
				vo.setTodayVisitCnt(rs.getInt("todayVisitCnt"));
				
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}
	public void setWriterLevel(String mid) {
		
		try {
			sql = "update artMember set level = 3 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
	
	public ArtVO getmemIdx(String mid) {
		vo = new ArtVO();
		try {
			sql = "select * from artMember where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
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
				vo.setPoint(rs.getInt("point"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setLevel(rs.getInt("level"));
				vo.setMemDelete(rs.getInt("memDelete"));
			  vo.setReportCnt(rs.getInt("reportCnt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}
	
	
	public void setArtmemberInforUpdate(ArtVO vo) {
		
		try {
			sql = "update artMember set name = ?, gender = ?, email = ?, tel = ?, birthday = ?, address = ? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getGender());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getTel());
			pstmt.setString(5, vo.getBirthday());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getMid());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
	}
	public String setNewPwdUpdate(String nPwd, String mid) {
		String res = "0";
		try {
			sql = "update artMember set pwd = ? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nPwd);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}
	public void setMemberDeleteSw(String dMid) {
		
		try {
			sql = "update artMember set memDelete = 0 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dMid);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}
	public void setWorkJudgeContent(String workJudgeContent, String work, String ipChalPrice, String mid) {
		int wIdx = 0;
		int mIdx = 0;
		
		try {
			sql = "select w.idx as wIdx,m.idx as mIdx from artWork w,artMember m,artWorkIpchal i "
					+ "where i.workIdx = w.idx and i.memberIdx = m.idx and w.work = ? and m.mid = ?"
					+ "order by i.idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, work);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				wIdx = rs.getInt("wIdx");
				mIdx = rs.getInt("mIdx");
			}
			getConn.rsClose();
			
			sql = "insert into artWorkJudge values(default,?,?,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wIdx);
			pstmt.setInt(2, mIdx);
			pstmt.setString(3, workJudgeContent);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.pstmtClose();
		} 
	}
	
	public void setCardNum(String cardNum, String mid, String work, int sw) {
		
		try {
			if(sw == 1) {
				sql = "update artMember m,artWorkIpchal i,artWork w "
						+ "set m.cardNum = ?,i.cancelSw = '직접수령' "
						+ "	where w.work = ? and m.mid = ? and w.idx = i.workidx "
						+ "and m.idx = i.memberidx and i.cancelSw != '경매 진행중' ";
			}
			else {
				sql = "update artMember m,artWorkIpchal i,artWork w "
						+ "set m.cardNum = ?,i.cancelSw = '배달수령' "
						+ "where w.work = ? and m.mid = ? and w.idx = i.workidx "
						+ "and m.idx = i.memberidx and i.cancelSw != '경매 진행중' ";
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cardNum);
			pstmt.setString(2, work);
			pstmt.setString(3, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}
	
	public void setMemberLevleUp(String mid) {
		
		try {
			sql = "update artmember set level = 2 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : "+ e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}

	
	
	
}