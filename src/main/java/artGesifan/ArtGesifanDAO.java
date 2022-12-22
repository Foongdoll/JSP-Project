package artGesifan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class ArtGesifanDAO {
//싱글톤을 이용한 DB연결 객체 연결하기...
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ArtGesifanVO vo = null;

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
				sql = "select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff,"
						+ "(select count(*)	from artComment where gesifanIdx=g.idx) as comcnt "
						+ "from artGesifan g order by idx desc limit ?,?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else if(sw == 1) {
				sql = "select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff,"
						+ "(select count(*)	from artComment where gesifanIdx=g.idx) as comcnt "
						+ "from artGesifan g where part='공지사항' order by idx desc limit ?,?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else if(sw == 2) {
				sql = "select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff,"
						+ "(select count(*)	from artComment where gesifanIdx=g.idx) as comcnt "
						+ "from artGesifan g where part='그림 잡담' order by idx desc limit ?,?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else if(sw == 3) {
				sql = "select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff,"
						+ "(select count(*)	from artComment where gesifanIdx=g.idx) as comcnt "
						+ "from artGesifan g where part='그림 문의' order by idx desc limit ?,?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else if(sw == 4) {
				sql = "select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff,"
						+ "(select count(*)	from artComment where gesifanIdx=g.idx) as comcnt "
						+ "from artGesifan g where part='자유' order by idx desc limit ?,?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
				
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ArtGesifanVO();
				
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
				vo.setComcnt(rs.getInt("comcnt"));
				vos.add(vo);
			}
				
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		return vos;
	}

	public void setGesifanInputUpdateOk(ArtGesifanVO vo, int idx, int sw) {
		
		try {
			if(sw == 0) {
				sql = "insert into artGesifan values(default,?,?,?,default,?,?,?,?,default,default,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getNickName());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getContent());
				pstmt.setString(4, vo.getHostIp());
				pstmt.setString(5, vo.getPart());
				pstmt.setString(6, vo.getfName());
				pstmt.setString(7, vo.getfSName());
				pstmt.setInt(8, vo.getGesifanPwd());
				pstmt.setString(9, vo.getHashTag());
				pstmt.setString(10, vo.getSecretSw());
			}
			else if(sw == 1) {
				sql = "update artGesifan set nickName = ?, title = ?, content = ?, "
						+ "hostIp = ?, part = ?, fName = ?, fSName = ?, gesifanPwd = ?, hashtag = ?,secretSw = ? where idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getNickName());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getContent());
				pstmt.setString(4, vo.getHostIp());
				pstmt.setString(5, vo.getPart());
				pstmt.setString(6, vo.getfName());
				pstmt.setString(7, vo.getfSName());
				pstmt.setInt(8, vo.getGesifanPwd());
				pstmt.setString(9, vo.getHashTag());
				pstmt.setString(10, vo.getSecretSw());
				pstmt.setInt(11, idx);
			}
				pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		
	}

	public ArtGesifanVO getGesifanContent(int idx) {
		vo = new ArtGesifanVO();
		
		try {
			sql = "select * from artGesifan where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(idx);
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setwDate(rs.getString("wDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setPart(rs.getString("part"));
				vo.setfName(rs.getString("fName"));;
				vo.setfSName(rs.getString("fSName"));;
				vo.setReadNum(rs.getInt("readNum"));
				vo.setGood(rs.getInt("good"));
				vo.setGesifanPwd(rs.getInt("gesifanPwd"));
				vo.setHashTag(rs.getString("hashtag"));
				vo.setSecretSw(rs.getString("secretSw"));
			}
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		return vo;
	}

	public int totGesifanSearchRecCnt(String cateGory, String searChContent) {
		int totRecCnt = 0;
			
		try {
				sql = "select count(*) as cnt from artGesifan where "+cateGory+" like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searChContent+"%");
			
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

	public ArrayList<ArtGesifanVO> getGesifanSearchList(int startIndexNo, int pageSize, String cateGory,String searChContent) {
		ArrayList<ArtGesifanVO> vos = new ArrayList<>();
		try {
			if(cateGory.equals("") && searChContent.equals("")) {
				sql = "select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff from artGesifan "
						+ "order by idx desc limit ?,?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else {
				sql = "select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff from artGesifan "
						+ "where "+cateGory+" like ?   order by idx desc limit ?,?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searChContent+"%");
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, pageSize);
			}
				rs = pstmt.executeQuery();
			
				while(rs.next()) {
					vo = new ArtGesifanVO();
					
					vo.setIdx(rs.getInt("idx"));
					vo.setNickName(rs.getString("nickName"));
					vo.setTitle(rs.getString("title"));
					vo.setContent(rs.getString("content"));
					vo.setwDate(rs.getString("wDate"));
					vo.setHostIp(rs.getString("hostIp"));
					vo.setReadNum(rs.getInt("readNum"));
					vo.setGood(rs.getInt("good"));
					vo.setGesifanPwd(rs.getInt("gesifanPwd"));
					vo.setfName(rs.getString("fName"));
					vo.setfSName(rs.getString("fSName"));
					
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

	public String getSecretSwSearchPwd(int idx, int sw) {
	  String data = "0";
		try {
			sql = "select * from artGesifan where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			if(sw==0) {
				data = rs.getString("secretSw");
			}
			else if(sw==1) {
				data = String.valueOf(rs.getInt("gesifanPwd"));
			}
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		
		return data;
	}

	public String getsecretContentNickName(int idx) {
		String nickName = "";
		
		try {
			sql = "select * from artGesifan where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			rs.next();
			nickName = rs.getString("nickName");
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		
		return nickName;
	}

	public void setReadNum(int idx) {
		
		try {
			sql = "update artGesifan set readNum = readNum + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
		
	}

	public void setGoodPlus(int idx) {
		
		try {
			sql = "update artGesifan set good = good + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
	}

	public void setGesifanCommentInput(ArtGesifanCommentVO vo) {
		
		try {
			sql = "insert into artcomment values(default,?,?,default,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getGesifanIdx());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getHostIp());
			pstmt.setString(4, vo.getComment());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.pstmtClose();
		}
	}

	public ArrayList<ArtGesifanCommentVO> getGesifanComment(int gesifanIdx) {
		ArrayList<ArtGesifanCommentVO> vos = new ArrayList<>();
		
		try {
			sql = "select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff from artcomment where gesifanIdx = ? order by idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gesifanIdx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			 ArtGesifanCommentVO vo = new ArtGesifanCommentVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setGesifanIdx(rs.getInt("gesifanIdx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setwDate(rs.getString("wDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setComment(rs.getString("comment"));
				
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

	public ArtGesifanVO getPreNextSearch(String str, int idx) {
		vo = new ArtGesifanVO();
		try {
			if(str.equals("pre")) {
				sql = "select * from artGesifan where idx < ? order by idx desc limit 1";
			}
			else {
				sql = "select * from artGesifan where idx > ? limit 1";				
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(str.equals("pre") && rs.next()) {
				vo.setPreIdx(rs.getInt("idx"));
				vo.setPreTitle(rs.getString("title"));
			}
			else if(str.equals("next") && rs.next()) {
				vo.setNextIdx(rs.getInt("idx"));
				vo.setNextTitle(rs.getString("title"));				
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	public void setGesifanDelete(int idx) {
		
		try {
			sql = "delete from artGesifan where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public void setCommentUpdate(int idx, String comUp) {
		String res = "0";
		try {
			sql = "update artComment set comment = ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comUp);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public void setCommentDelete(int idx) {
		String res = "0";
		
		try {
			sql = "delete from artComment where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
				
	}

	public String getFname(int idx) {
		String fSName = "";
		
		try {
			sql = "select * from artGesifan where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				fSName = rs.getString("fSName");
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return fSName;
	}

	public void setGesifanCommentAllDelete(int idx) {

		try {
			sql = "delete from artComment c,artGesifan g where c.gesifanIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}

	public void setReportInput(ArtReportVO arvo) {
		
		try {
			sql = "insert into artGesifanReport values(default,?,?,?,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, arvo.getGesifanidx());
			pstmt.setString(2, arvo.getReporter());
			pstmt.setString(3, arvo.getContent());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}

	
	
}