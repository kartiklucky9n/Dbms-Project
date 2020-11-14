package springmvc.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import springmvc.model.RequestedTests;

@Repository
public class RequestedTestsDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public List<RequestedTests> getMySamples(int tid){
		String q ="select s.sampleId, s.testId, s.isCompleted, s.testReport from requestedtests as s, test as t where t.T_ID=? and s.testId=t.testId and s.isCompleted=false; ";
		RowMapper<RequestedTests> r = new rowMapperImplRequestedTests();
		List<RequestedTests> T = this.jdbcTemplate.query(q,r,tid);
		return T;
	}
}
