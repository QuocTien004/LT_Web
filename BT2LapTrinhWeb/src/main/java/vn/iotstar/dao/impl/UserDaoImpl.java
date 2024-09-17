package vn.iotstar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.configs.DBConnectMySQL;
import vn.iotstar.dao.IUserDao;
import vn.iotstar.models.UserModel;

public class UserDaoImpl extends DBConnectMySQL implements IUserDao {

	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;

	@Override
	public List<UserModel> findAll() {

		String sql = "SELECT * FROM users ";

		List<UserModel> list = new ArrayList<UserModel>();
		
		try {
			conn = new DBConnectMySQL().getDatabaseConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {

				list.add(new UserModel(
					rs.getInt("id"),
					rs.getString("username"),
					rs.getString("password"),
					rs.getString("images"),
					rs.getString("fullname"),
					rs.getString("email"),
					rs.getString("phone"),
					rs.getInt("roleid"),
					rs.getDate("createDate")));
				return list;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public UserModel findOne(int id) {
		String sql = "SELECT * FROM users WHERE id = ? ";

		try {
			conn = new DBConnectMySQL().getDatabaseConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserModel user = new UserModel();
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setUsername(rs.getString("username"));
				user.setFullname(rs.getString("fullname"));
				user.setPassword(rs.getString("password"));
				user.setImages(rs.getString("images"));
				user.setRoleid(rs.getInt("roleid"));
				user.setPhone(rs.getString("phone"));
				user.setCreatedate(rs.getDate("createDate"));
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public UserModel findByUsername(String username) {
		String sql = "SELECT * FROM users WHERE username = ? ";

		try {
			conn = new DBConnectMySQL().getDatabaseConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserModel user = new UserModel();
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setUsername(rs.getString("username"));
				user.setFullname(rs.getString("fullname"));
				user.setPassword(rs.getString("password"));
				user.setImages(rs.getString("images"));
				user.setRoleid(rs.getInt("roleid"));
				user.setPhone(rs.getString("phone"));
				user.setCreatedate(rs.getDate("createDate"));
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void insert(UserModel user) {
		String sql = "INSERT INTO users(id, username, password, images, fullname, roleid, phone, createDate, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			//conn = new DBConnectSQL().getConnection(); //kết nối database 
			ps = conn.prepareStatement(sql);//ném câu sql vào cho thực thi
			
			ps.setInt(1, user.getId());
			ps.setString(2, user.getUsername());
			ps.setString(3,user.getPassword());
			ps.setString(4,user.getImages());
			ps.setString(5, user.getFullname());
			ps.setInt(6,user.getRoleid());
			ps.setString(7,user.getPhone());
			ps.setDate(8,user.getCreatedate());
			ps.setString(9,user.getEmail());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		try {
			UserDaoImpl userDao = new UserDaoImpl();
			new DBConnectMySQL();
			System.out.println(userDao.findAll());
		   }catch(Exception e) {
			   e.printStackTrace();
		   }
	}
}
