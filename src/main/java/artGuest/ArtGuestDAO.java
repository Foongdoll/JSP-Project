package artGuest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class ArtGuestDAO {
//싱글톤을 이용한 DB연결 객체 연결하기...
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ArtGuestVO vo = null;

	public int totRecCnt(String cateGory, String searChContent, int sw) {
		int totRecCnt = 0;
		
		try {
			if(sw == 1 && cateGory.equals("nickName")) {
				sql = "select count(*) as cnt from guest where nickName like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searChContent+"%");
			}
			else if(sw == 1 && cateGory.equals("content")){
				sql = "select count(*) as cnt from guest where content like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searChContent+"%");
			}
			else if(sw == 0) {
				sql = "select count(*) as cnt from guest";
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

	public ArrayList<ArtGuestVO> getGuestList(int startIndexNo, int pageSize, String cateGory, String searChContent, int su) {
    ArrayList<ArtGuestVO> vos = new ArrayList();
    
    try {
        if(su == 1 && cateGory.equals("nickName")) {
            sql ="select *, "
            		+ "datediff(now(), wDate) as day_diff,"
            		+ "timestampdiff(hour, wDate, now()) as hour_diff from guest"
            		+ " where nickName like ? order by idx desc limit ?,?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%"+searChContent+"%");
            pstmt.setInt(2, startIndexNo);
            pstmt.setInt(3, pageSize);
        }
        else if(su == 1 && cateGory.equals("content")) {
            sql ="select *,"
            		+ "datediff(now(), wDate) as day_diff,"
            		+ "timestampdiff(hour, wDate, now()) as hour_diff  from guest  "
            		+ "where content like ? order by idx desc limit ?,?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%"+searChContent+"%");
            pstmt.setInt(2, startIndexNo);
            pstmt.setInt(3, pageSize);
        }
        else if(su != 1){
            sql ="select *,"
            		+ "datediff(now(), wDate) as day_diff,"
            		+ "timestampdiff(hour, wDate, now()) as hour_diff from guest order by  "
            		+ "idx desc limit ?,?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, startIndexNo);
            pstmt.setInt(2, pageSize);
        }
        
        rs = pstmt.executeQuery();
        
        while(rs.next()) {
            vo = new ArtGuestVO();
            vo.setIdx(rs.getInt("idx"));
            vo.setNickName(rs.getString("nickName"));
            vo.setContent(rs.getString("content"));
            vo.setHostIp(rs.getString("hostIp"));
            vo.setGood(rs.getInt("good"));
            vo.setwDate(rs.getString("wDate"));
            
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

	public void setGood(int idx) {
		
		try {
			sql = "update guest set good = good + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
		  pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		 } catch (SQLException e) {
       System.out.println("sql 에러 : "+e.getMessage());
	   }finally {
	       getConn.pstmtClose();
	   }
	}

	public String setGuestInput(ArtGuestVO vo) {
		String res = "0";
		
		try {
			sql = "insert into guest values (default,?,?,default,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getHostIp());
			pstmt.executeUpdate();
			res = "1";
		 } catch (SQLException e) {
       System.out.println("sql 에러 : "+e.getMessage());
	   }finally {
	       getConn.pstmtClose();
	   }
		
		return res;
	}

	public void setGuestDelete(int idx) {
		
		try {
			sql = "delete from guest where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		 } catch (SQLException e) {
       System.out.println("sql 에러 : "+e.getMessage());
	   }finally {
	       getConn.pstmtClose();
	   }
		
	}



	

	
}