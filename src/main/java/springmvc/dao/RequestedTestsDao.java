package springmvc.dao;


import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import springmvc.model.RequestedTests;
import springmvc.model.singlesample;

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
		String q ="select s.sampleId, s.testId, s.isCompleted, s.testReport, s.verdict, s.reportDate from requestedtests as s, test as t where t.T_ID=? "
				+ "and s.testId=t.testId and s.isCompleted=false ";
		RowMapper<RequestedTests> r = new rowMapperImplRequestedTests();
		try {
			List<RequestedTests> T = this.jdbcTemplate.query(q,r,tid);
			return T;
		}
		catch(Exception e) {
			return null;
		}
	}
	
	public List<RequestedTests> recievedSample(int tid) {
		String q="select rt.sampleId, rt.testId, rt.isCompleted, rt.testReport, rt.verdict, rt.reportDate  from requestedtests as rt, test as t, sample as s "
				+ "where t.T_ID=? and rt.testId=t.testId and rt.isCompleted=false and s.sampleId=rt.sampleId"
				+ " and s.recievingDate is not null and rt.testReport is null";
		RowMapper<RequestedTests> IT= new rowMapperImplRequestedTests();
		try{
			List<RequestedTests> it = this.jdbcTemplate.query(q, IT, tid);
			return it;
		}
		catch(Exception e) {
			return null;
		}
	}
	
	public List<singlesample> doneSamples() {
		String q="select distinct s.sampleId from requestedtests as s where s.sampleId not in \r\n"
				+ "(select distinct rt.sampleId from requestedtests as rt where isCompleted=0) and s.sampleId not in(select distinct f.sampleId from finalreport as f where f.resultOfReport is not null) ;";
		RowMapper<singlesample> IT= new rowMapperImplsinglesample();
		try {
			List<singlesample> it = this.jdbcTemplate.query(q, IT);
			return it;
		}
		catch(Exception e) {
			return null;
		}
	}
	public int doTest(int sampleId, int testId)
	{
		String q="insert into requestedtests(sampleId, testId) values(?,?)";
		
		
		try {
			this.jdbcTemplate.update(q,sampleId, testId);
			 
			return 1;
		}
		catch(Exception e){
			return 0;
		}
	}
	
	public int addtestreport(int sampleId, int testId, String testReport, String val)
	{
		String q="update requestedtests set testReport=?, isCompleted=true, verdict=?, reportDate=? where sampleId=? and testId=?";
		Boolean k=false;
		java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
		if(val=="Positive")
			k=true; 
		try {
			this.jdbcTemplate.update(q,testReport, k, date, sampleId, testId );
		}
		catch(Exception e) {
			return 0;
		}
			return 1;
	}
	
	public List<RequestedTests> viewallreport(int sampleId) {
		String q="select * from requestedtests where sampleId=?";
		RowMapper<RequestedTests> rt = new rowMapperImplRequestedTests();
		try {
			List<RequestedTests> r=this.jdbcTemplate.query(q, rt,  sampleId);
			return r;
		}
		catch(Exception e) {
			return null;
		}
	}
	
	
	
}
