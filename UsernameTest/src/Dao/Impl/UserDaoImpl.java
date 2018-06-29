package Dao.Impl;

import Dao.UserDao;
import Util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDaoImpl implements UserDao {
    public boolean Login(String username,String password) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            String sql = "SELECT * FROM t_user WHERE USERNAME=? AND PASSWORD=?";

            conn = JDBCUtil.getconn();

            ps = conn.prepareStatement(sql);

            ps.setString(1,username);
            ps.setString(2,password);

            rs = ps.executeQuery();

            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.release(conn,ps,rs);
        }
        return false;
    }

    @Override
    public int UsernameSame(String username) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            String sql = "SELECT COUNT(*) FROM t_user WHERE username =?";

            conn = JDBCUtil.getconn();

            ps = conn.prepareStatement(sql);

            ps.setString(1,username);

            rs = ps.executeQuery();

            while (rs.next()){
              return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.release(conn,ps,rs);
        }
        return 0;
    }
}
