package springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import springmvc.model.UserSystem;

public class rowMapperImplUser implements RowMapper<UserSystem> {

	public UserSystem mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		UserSystem user = new UserSystem();
		user.setTechnicianUId(rs.getInt(1));
		user.setT_ID(rs.getInt(2));
		user.setPassword(rs.getString(3));
		user.setAdmin(rs.getBoolean(4));
		return user;
	}
	
}
