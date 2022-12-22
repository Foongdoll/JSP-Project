package artMyPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.event.AncestorEvent;

import artAuction.ArtWorkIpchalVO;
import conn.GetConn;

public class ArtMyPageDAO {
//싱글톤을 이용한 DB연결 객체 연결하기...
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ArtMyPageVO vo = null;

	public int totIpChalListRecCnt(String mid) {
		int totIpchalRecCnt = 0;
		
		try {
			sql = "select count(*) as cnt "
					+ "from artWorkIpchal i,artMember m "
					+ "where i.memberidx = m.idx and m.mid = ? "
					+ "order by i.idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
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

	public ArrayList<ArtWorkIpchalVO> getIpchalMyList(int startIndexNo, int pageSize, String mid) {
		ArrayList<ArtWorkIpchalVO> vos = new ArrayList<>();
		
		try {
			sql = "select w.work as workName,m.name as ipchalName,i.wDate as wDate,i.cancelSw as cancelSw,i.ipchalprice as ipchalprice,w.workLastDate as workLastDate"
					+ "	from artWorkIpchal i,artMember m, artWork w "
					+ "	where i.memberIdx = m.idx and i.workIdx = w.idx and m.mid = ?"
					+ "	order by i.idx desc"
					+ "	limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, startIndexNo); 
			pstmt.setInt(3, pageSize);
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

	public String getCancelSw(String mid) {
		String cancelSw = "";
		
		try {
			sql = "select i.cancelSw as cancelSw from artWorkIpchal i,artMember m,artwork w "
					+ "		where w.idx = i.workidx and m.idx = i.memberIdx and m.mid = ? and datediff(now(), w.workLastDate) > 0 "
					+ "		group by i.workidx"
					+ "		order by i.idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
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

	public int totMyNackChalListRecCnt(String mid) {
	int totRecCnt = 0;
		
		try {
			sql = "select count(*) as cnt from artworkipchal i,artmember m,artwork w "
					+ "	where i.memberidx = m.idx and i.workidx = w.idx and m.mid = ? and i.cancelsw != '경매 진행중' "
					+ "	group by w.work "
					+ "	order by i.idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
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

	public ArrayList<ArtNackChalVO> getMyNackChalList(String mid) {
		ArrayList<ArtNackChalVO> vos = new ArrayList<>();
		
		try {
			sql = "select w.work as work,w.workwriter as workwriter,"
					+ "	w.worksize as worksize,i.ipchalPrice as ipchalPrice,"
					+ "	i.cancelSw as cancelSw from artWork w,artmember m,artworkipchal i"
					+ "	where i.memberidx = m.idx and i.workidx = w.idx and  m.mid = ? and i.cancelSw = '배송 완료'"
					+ "	order by i.idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArtNackChalVO nakVo = new ArtNackChalVO();
				
				nakVo.setWork(rs.getString("work"));
				nakVo.setWorkWriter(rs.getString("workWriter"));
				nakVo.setWorkSize(rs.getString("workSize"));
				nakVo.setIpchalPrice(rs.getInt("ipchalPrice"));
				nakVo.setCancelSw(rs.getString("cancelSw"));
				
				vos.add(nakVo);
			}
			
			} catch (SQLException e) {
				System.out.println("sql 에러 : "+e.getMessage());
			}finally {
				getConn.rsClose();
			}
		
		return vos;
	}
	
	

	public ArrayList<ArtNackChalVO> getNackChalWorkInfor(String mid) {
		ArrayList<ArtNackChalVO> vos = new ArrayList<>();
		
		try {
			sql = "select i.cancelSw as cancelSw,w.idx as wIdx,w.work as work,w.workWriter as workWriter,w.workSize as workSize,i.ipchalPrice as ipchalPrice,m.nickName as nickName,m.name as name "
					+ "		from  artWork w,artWorkIpchal i,artMember m "
					+ "		where i.memberIdx = m.idx  and i.workIdx = w.idx and m.mid = ? and i.cancelSw != '경매 진행중'"
					+ "		order by i.idx desc	";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ArtNackChalVO nackVo = new ArtNackChalVO();
					
					nackVo.setIdx(rs.getInt("wIdx"));
					nackVo.setIpchalPrice(rs.getInt("ipchalPrice"));
					nackVo.setName(rs.getString("name"));
					nackVo.setNickName(rs.getString("nickName"));
					nackVo.setWork(rs.getString("work"));
					nackVo.setWorkSize(rs.getString("workSize"));
					nackVo.setWorkWriter(rs.getString("workWriter"));
					nackVo.setCancelSw(rs.getString("cancelSw"));
					vos.add(nackVo);
				}
				
		} catch (SQLException e) {
			System.out.println("sql 에러 : "+e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		return vos;
	}

}