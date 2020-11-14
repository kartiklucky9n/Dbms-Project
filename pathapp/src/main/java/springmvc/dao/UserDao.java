package springmvc.dao;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import springmvc.model.UserSystem;

@Repository
public class UserDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public UserSystem checkUser(int UId, String password)
	{
		String query = "select * from UserSystem where technicianUId=? and password=?";
		RowMapper<UserSystem> rm = new rowMapperImplUser();
		
		try {
			UserSystem us = this.jdbcTemplate.queryForObject(query, rm, UId, password);
			return us;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
	
	public UserSystem checkHead(int UId)
	{
		String query = "select * from UserSystem where technicianUId=?";
		RowMapper<UserSystem> rm = new rowMapperImplUser();
		try {
			UserSystem us = this.jdbcTemplate.queryForObject(query, rm, UId);
			return us;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
}
