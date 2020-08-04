package brand;

import java.sql.*;
import java.util.ArrayList;

public class BrandDAO {

	private Connection conn; // connection:db에접근하게 해주는 객체
	private PreparedStatement pstmt;
	private ResultSet rs;

public BrandDAO() { // 생성자 실행될때마다 자동으로 db연결이 이루어 질 수 있도록함

	try {

		String dbURL = "jdbc:mysql://localhost:3306/fasion?serverTimezone=UTC"; // localhost:3306 포트는 컴퓨터설치된 mysql주소
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, "root", "admin1234");

	} catch (Exception e) {

		e.printStackTrace(); // 오류가 무엇인지 출력

	}

}


// 순위 대로 나열해서 list로 만들기
public ArrayList<Brand> getlist(){
	String SQL = "SELECT * FROM brand  ORDER BY brand_follwer DESC";
	ArrayList<Brand> list = new ArrayList<Brand>();
	try {
		pstmt =conn.prepareStatement(SQL);
		rs =pstmt.executeQuery();
		while(rs.next())
		{
			Brand brand = new Brand();
			brand.brand_index = rs.getInt(1);
			brand.Brandname = rs.getString(2);
			brand.brand_follwer = rs.getInt(7);
			brand.brand_rank = rs.getInt(5);
			brand.link = rs.getString(4);
			brand.brand_image = rs.getString(6);
			list.add(brand);
		}
		
	}catch (Exception e) {

		e.printStackTrace();

	}

	return list;
}


//검색시 나타나는 순위
public ArrayList<Brand> getlist_with_name(String name){
	String SQL = "SELECT * FROM brand where Brandname like '%"+ name+ "%' ORDER BY brand_follwer DESC";
	ArrayList<Brand> list = new ArrayList<Brand>();
	try {
		pstmt =conn.prepareStatement(SQL);
		rs =pstmt.executeQuery();
		while(rs.next())
		{
			Brand brand = new Brand();
			brand.brand_index = rs.getInt(1);
			brand.Brandname = rs.getString(2);
			brand.brand_follwer = rs.getInt(7);
			brand.brand_rank = rs.getInt(5);
			brand.link = rs.getString(4);
			brand.brand_image = rs.getString(6);
			list.add(brand);
		}
		
	}catch (Exception e) {

		e.printStackTrace();

	}

	return list;
}

//브랜드 추가 기능
public int write(String brand_name, String brand_link,String brand_image) { 
	String SQL = "INSERT INTO brand VALUES(?, ?, ?, ?, ?, ?, ?)";
	try {

		PreparedStatement pstmt = conn.prepareStatement(SQL);

		pstmt.setString(1, null);
		pstmt.setString(2, brand_name);
		pstmt.setString(3, null);
		pstmt.setString(4, brand_link);
		pstmt.setString(5, null);
		pstmt.setNString(6, brand_image);
		pstmt.setNString(7, null);

		return pstmt.executeUpdate();
	} catch (Exception e) {

		e.printStackTrace();
	}
	return -1; //데이터베이스 오류
}

//브랜드 삭제 기능
public int delete(String brand_name)
{
	String SQL = "delete from brand where Brandname= ?";
	try {

		PreparedStatement pstmt = conn.prepareStatement(SQL);

		pstmt.setString(1, brand_name);

		return pstmt.executeUpdate();
	} catch (Exception e) {

		e.printStackTrace();
	}
	return -1; //데이터베이스 오류
}

//brand_count 업데이트 기능
public int count_update() {
	String SQL ="update brand set brand_count = (select count(*) from post where brand.brand_index = post.brand_index)";
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		return pstmt.executeUpdate();
	}catch (Exception e) {

		e.printStackTrace();
	}
	return -1; //데이터베이스 오류
}

//팔로워 수 업데이트! 후 SQL에 저장
public int follwer_update(int follwer,String link) {
	String SQL ="update brand set brand_follwer = ? where Brand_link = ?";
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, follwer);
		pstmt.setString(2, link);
		return pstmt.executeUpdate();
	}catch (Exception e) {

		e.printStackTrace();
	}
	return -1; //데이터베이스 오류
}


//저장된 brand_count 바탕으로 순위 업데이트
public int rank_update0() {
	String SQL ="SELECT @rank:=0";
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		rs =pstmt.executeQuery();
		return 1;
	}catch (Exception e) {

		e.printStackTrace();
	}
	return -1; //데이터베이스 오류
}

public int rank_update() 
{
	String SQL ="UPDATE brand SET brand_rank=@rank:=@rank+1 ORDER BY brand_follwer DESC";
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		return pstmt.executeUpdate();
	}catch (Exception e) {

		e.printStackTrace();
	}
	return -1; //데이터베이스 오류
}

}










