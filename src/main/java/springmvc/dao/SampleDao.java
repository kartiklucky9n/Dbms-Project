package springmvc.dao;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import springmvc.model.IncompletedTests;
import springmvc.model.RequestedTests;
import springmvc.model.Sample;



@Repository
public class SampleDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public Sample getSample(int sampleId) {
		String q="select * from sample as s where s.sampleId=?";
		RowMapper<Sample> IT= new rowMapperImplSample();
		try{
			Sample it = this.jdbcTemplate.queryForObject(q, IT, sampleId);
			return it;
		}
		catch(Exception e) {
			return null;
		}
	}
	public int addSample(String sampleType, int pid) {
		String q="insert into sample(sampleType,P_ID,dateOfAllotment) values(?,?,?)";
		
		java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
		
		try {
			this.jdbcTemplate.update(q, sampleType, pid, date);
			return 1;
		}
		catch( Exception e) {
			return 0;
		}
	}
	
	public List<Sample> viewMySample(int pid) {
		String q="select * from sample as s where s.P_ID=?";
		RowMapper<Sample> IT= new rowMapperImplSample();
		try{
			List<Sample> it = this.jdbcTemplate.query(q, IT, pid);
			return it;
		}
		catch(Exception e) {
			return null;
		}
	}
	public List<IncompletedTests> getAllIncompletedSamples() {
		String q="select  t.T_ID, s.sampleId, p.P_ID, rt.testId, s.dateOfAllotment from sample as s, requestedtests as rt, patient as p, test as t where s.sampleId=rt.sampleId and rt.isCompleted=false and s.P_ID=p.P_ID and rt.testId=t.testId";
		RowMapper<IncompletedTests> IT= new rowMapperImplIncompletedTests();
		try{
			List<IncompletedTests> it = this.jdbcTemplate.query(q, IT);
			return it;
		}
		catch(Exception e) {
			return null;
		}
		
		
	}
	
	
	public List<Sample> notRecievedSample() {
		String q="select * from sample where recievingDate is null";
		RowMapper<Sample> IT= new rowMapperImplSample();
		try{
			List<Sample> it = this.jdbcTemplate.query(q, IT);
			return it;
		}
		catch(Exception e) {
			return null;
		}
	}
	
	
	public int recievesample(int sampleId, int boxId) {
		String q="update sample set recievingDate=?,boxId=? where sampleId=?";
		String qq="update storagebox set noOfSampleStored=noOfSampleStored+1 where boxId=? ";
		System.out.println(sampleId+"->samplid");
		java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
		
		try {
			this.jdbcTemplate.update(q, date, boxId, sampleId);
			this.jdbcTemplate.update(qq, boxId);
			return 1;
		}
		catch( Exception e) {
			return 0;
		}
	}
	
//	public String getAllSamples() {
		
//	}
	
//	public String getSamplesByTechnicians() {
		
//	}
	
//	public String allotSample() {
		
//	}
	
	
}
