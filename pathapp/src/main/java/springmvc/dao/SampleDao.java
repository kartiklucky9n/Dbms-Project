package springmvc.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import springmvc.model.IncompletedTests;
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
	
	public int addSample(Sample sample) {
		String q="insert into sample(sampleType, reportingDate, recievingDate, dateOfAllotment, P_ID, boxId)";
		
		try {
			this.jdbcTemplate.update(q, sample.getSampleType(), sample.getReportingDate(), sample.getRecievingDate(), sample.getDateOfAllotment(), sample.getP_ID(), sample.getBoxId());
			return 1;
		}
		catch( Exception e) {
			return 0;
		}
	}
	public List<IncompletedTests> getAllIncompletedSamples() {
		String q="select  t.T_ID, s.sampleId, p.P_ID, rt.testId from sample as s, requestedtests as rt, patient as p, test as t where s.sampleId=rt.sampleId and rt.isCompleted=false and s.P_ID=p.P_ID and rt.testId=t.testId";
		RowMapper<IncompletedTests> IT= new rowMapperImplIncompletedTests();
		try{
			List<IncompletedTests> it = this.jdbcTemplate.query(q, IT);
			return it;
		}
		catch(Exception e) {
			return null;
		}
		
		
	}
	
//	public String getAllSamples() {
		
//	}
	
//	public String getSamplesByTechnicians() {
		
//	}
	
//	public String allotSample() {
		
//	}
	
	
}
