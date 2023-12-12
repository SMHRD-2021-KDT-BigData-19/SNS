package boardController;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import boardVO.BoardVo;

public class BoardDAO {
	private JdbcUtil ju; //database 접근
	
	public BoardDAO() {
		ju = JdbcUtil.getInstance();
	}
	
	//삽입(Create)
	public int insertboard(BoardVo vo) {
		//데이터 베이스 접근 객체
		Connection con = null;
		
		PreparedStatement pstmt = null; //select이외 insert update delete는 prepared. ? 바인딩 변수
		String query = "INSERT INTO board (num, title, userid, nick, content, regdate, cnt)\r\n"
				+ "VALUES (board_seq.nextval, ?, ?, ?, ?, SYSDATE, 0)";
		int ret = -1; //실패시 -1
		try {
			con = ju.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getUserid());
			pstmt.setString(3, vo.getNick());
			pstmt.setString(4, vo.getContent());
			ret = pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			if(con != null) {
				try{
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}if(pstmt != null) {
					try{
						pstmt.close();
					}catch(SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return ret;
	}
	
	//조회(Read)
	public List<BoardVo> selectAll(){
		System.out.println("list 실행");
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query="SELECT num, title, userid, nick, content, regdate, cnt from board order by num desc";
		ArrayList<BoardVo> list = new ArrayList<BoardVo>();	
		try {
			con = ju.getConnection(); //db연결
			stmt = con.createStatement();
			rs = stmt.executeQuery(query); //입력결과
			
			while(rs.next()) {
				BoardVo vo = new BoardVo( //값을 하나씩 넣기 위해 생성자 호출
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getString(5),
				new Date(rs.getDate(6).getTime()),
				rs.getInt(7)
				);
				list.add(vo); //vo객체가 하나씩 모두 담김
			System.out.println("db값 가져오기");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(stmt != null) {
				try{
					stmt.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}if(con != null) {
				try{
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}if(rs != null) {
				try{
					rs.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}

		System.out.println("정상 작동");
		return list;
	} 
	
	//한가지만 조회
	public BoardVo selectone(int num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVo vo = null;
		String query="SELECT num, title, userid, nick, content, regdate, cnt from board where num = ?";
		try {
			updatecnt(num); //조회수 증가
			con = ju.getConnection(); //연결
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery(); //결과
			if(rs.next()) {
				vo = new BoardVo( //값을 하나씩 넣기 위해 생성자 호출
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getString(5),
				new Date(rs.getDate(6).getTime()),
				rs.getInt(7)+1
				);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try{
					pstmt.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}if(con != null) {
				try{
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}if(rs != null) {
				try{
					rs.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return vo;
	} 
	//수정(Update) (insert문과 거진 동일)
	public int update(BoardVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null; //select이외 insert update delete는 prepared. ? 바인딩 변수
		String query = "update board set title=?, content=? where num=?";
		//String query = "update board set cnt=cnt+1, title=?, content=? where num=?";
		int ret = -1; //실패시 -1
		try {
			System.out.println("conn");
			con = ju.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getNum());
			ret = pstmt.executeUpdate();
			System.out.println("update");
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			if(con != null) {
				try{
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}if(pstmt != null) {
					try{
						pstmt.close();
					}catch(SQLException e) {
						e.printStackTrace();
					}
				}
			}
			System.out.println("성공");
		}
		return ret;
		
	
	}
	
	//updatecnt 조회수
	public int updatecnt(int num) {
		Connection con = null;
		PreparedStatement pstmt = null; //select이외 insert update delete는 prepared. ? 바인딩 변수
		String query = "update board set cnt=cnt+1 where num=?";
		int ret = -1; //실패시 -1
		try {
			con = ju.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			ret = pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			if(con != null) {
				try{
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}if(pstmt != null) {
					try{
						pstmt.close();
					}catch(SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return ret;
	
	}
	
	
	//삭제(Delete)
	public int delete(int num) {
		Connection con = null;
		PreparedStatement pstmt = null; //select이외 insert update delete는 prepared. ? 바인딩 변수
		String query = "delete from board where num=?";
		//String query = "update board set cnt=cnt+1, title=?, content=? where num=?";
		int ret = -1; //실패시 -1
		try {
			con = ju.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			ret = pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			if(con != null) {
				try{
					con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}if(pstmt != null) {
					try{
						pstmt.close();
					}catch(SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return ret;
	
	}
	

}
