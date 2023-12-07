package boardController;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcUtil {
	private JdbcUtil() {}
	
	private static JdbcUtil instance = new JdbcUtil();
	
	//context.xml datasource 임포트
	private static DataSource ds;
	
	public static JdbcUtil getInstance() {
		return instance;
	}
	
	static {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("드라이버 로딩 성공!");
			
			InitialContext ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
													//jdbc/myOracle을 찾아라
									//톰캣이 web.xml의 ref-name, context.xml resource참조
			System.out.println("Connection Pool 생성!");
			
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	public Connection getConnection() throws SQLException{
		//connectin이 필요할때 DataSource ds를 통해
		return ds.getConnection(); //풀에서 커넥션 반환
	}

}
