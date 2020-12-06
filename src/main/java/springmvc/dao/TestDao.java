package springmvc.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import springmvc.model.Test;

@Repository
public class TestDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public Test singleTest(int testId) {
		String q="select * from test where testId=?";
		RowMapper<Test> r = new rowMapperImplTests();
		try {
			Test T = this.jdbcTemplate.queryForObject(q,r, testId);
			return T;
		}
		catch(Exception e) {
			return null;
		}
	}
	public List<Test> getAllTests(){
		String q ="select * from test";
		RowMapper<Test> r = new rowMapperImplTests();
		try {
			List<Test> T = this.jdbcTemplate.query(q,r);
			return T;
		}
		catch(Exception e) {
			return null;
		}
	}
	
	
	public int updateTechInTest (int testId, int T_ID) {
		String Q="update Test set T_ID=? where testId=?";
		try {
			this.jdbcTemplate.update(Q, T_ID, testId);
			return 1;
		}
		catch (Exception e) {
			return 0;
		}
	}
	
	public int addTest (Test test) {
		String Q="insert into test(testType, T_ID) values(?,?)";
		try {
			this.jdbcTemplate.update(Q, test.getTestType(), test.getT_ID());
			return 1;
		}
		catch (Exception e) {
			return 0;
		}
	}
	public int deleteTest (String testType) {
		testType=testType.toUpperCase();
		String Q="delete from test where testType=?";
		try {
			this.jdbcTemplate.update(Q, testType);
			return 1;
		}
		catch (Exception e) {
			return 0;
		}
	}
	


}
