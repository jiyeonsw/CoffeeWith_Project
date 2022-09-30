package bit.data.dao;

import bit.data.dto.CfdDbInsertDto;
import util.DbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CfdDbInsertDao {
    DbConnect db=new DbConnect();
    public void insertCf(CfdDbInsertDto dto){
        String sql="insert into cf values (null,?,?,?,?,?,?,?,?,? ,0,0,?,?)";
        Connection conn=null;
        PreparedStatement pstmt=null;
        conn=db.getMysqlConnection();
        try {
            pstmt=conn.prepareStatement(sql);
            //바인딩
            pstmt.setString(1,dto.getCf_nm());
            pstmt.setString(2,dto.getCf_tel());
            pstmt.setString(3,dto.getOpen_time());
            pstmt.setString(4,dto.getOff_day());
            pstmt.setString(5, dto.getLoc_addr());
            pstmt.setInt(6,dto.getLoc_ar());
            pstmt.setInt(7,dto.getLoc_sigu());
            pstmt.setDouble(8,dto.getLoc_x());
            pstmt.setDouble(9,dto.getLoc_y());
            pstmt.setString(10,dto.getMenu());
            pstmt.setString(11,dto.getCf_txt());
            //실행
            pstmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            db.dbClose(conn,pstmt);
        }
    }
}
