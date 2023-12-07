package com.member.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	private MemberDAO() {
	}

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance; //싱글톤 패턴
	}
	
	
	public Connection getConnection() throws Exception {
		
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
		conn = ds.getConnection();
		return conn;
	}
	
	
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql="";
	
	
	
	// 아이디로 로그인
	public int login(String id, String pw) {
		int result = -1;
		sql = "select pw from member where id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);	
			//System.out.println(pstmt.toString());
			rs = pstmt.executeQuery(); //실행한 결과 객체에 저장
			if (rs.next()) {
				if (rs.getString(1) != null
						&& rs.getString(1).equals(pw)) {
					System.out.println("일치함");
					result = 1;	//회원존재 1 로그인 성공
					
				} else {
					result = 0; //비밀번호 불일치
				}
			} 
			else {
				result = -1;	//값(아이디)이 없음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("리턴함");
		return result;
	}

	// 아이디로 회원 정보 가져오는 메소드
	public MemberVO getMember(String id) {
		MemberVO vo = null;
		sql = "select * from member where id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new MemberVO();
				vo.setName(rs.getString(1));
				vo.setNick(rs.getString(2));
				vo.setId(rs.getString(3));
				vo.setPw(rs.getString(4));
				vo.setEmail(rs.getString(5));
				vo.setPhone(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return vo;
	}

	
	//아이디 중복 체크
	public int confirmID(String id) {
		int result = -1;
		sql = "select id from member where id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1;
			} else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	//회원가입
	public int insertMember(MemberVO vo) {
		int result = -1;
		sql = "insert into member values(?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, vo.getName());
			//pstmt.setString(2, vo.getNick());
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getEmail());
			//pstmt.setString(6, vo.getPhone());
			result = pstmt.executeUpdate(); //insert문 0이상의 숫자 반환
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
	//업데이트
	public int updateMember(MemberVO mVo) {
		int result = -1;
		sql = "update member set name=?, nick=?,"
				+ " pw=?, email=?, phone=? where id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getPw());
			pstmt.setString(2, mVo.getNick());
			pstmt.setString(3, mVo.getPw());
			pstmt.setString(4, mVo.getEmail());
			pstmt.setString(5, mVo.getPhone());
			pstmt.setString(6, mVo.getId());
			System.out.println(mVo.getId());
			//pstmt.setInt(4, mVo.getAdmin());
			//pstmt.setString(5, mVo.getUserid());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
