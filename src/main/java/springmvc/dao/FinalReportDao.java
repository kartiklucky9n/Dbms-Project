package springmvc.dao;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import springmvc.model.FinalReport;
import springmvc.model.RequestedTests;


@Repository
public class FinalReportDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int addfinalreport(int sampleId, String resultOfReport, int tid) {

		// get the patient
		
		

		try {
			
			String qq = "insert into finalreport(sampleId, T_ID, resultOfReport, reportingDate) values(?,?,?,?)";
			// dependent query, nested try catch
			// set the reporting date
			java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
			System.out.println(sampleId+" "+ tid+" "+ resultOfReport+" "+ date);
			this.jdbcTemplate.update(qq, sampleId, tid, resultOfReport, date);
		}	
		catch(Exception e) {
			return 0;
		}
		return 1;
	}
	
	public FinalReport viewReports( int sampleId){
		String q = "select * from finalreport where sampleId=?";
		System.out.println("sample"+sampleId);
		RowMapper<FinalReport> IT = new rowMapperImplFinalReport();
		try {
			FinalReport p = this.jdbcTemplate.queryForObject(q, IT, sampleId);
			
			return p;
		} catch (Exception e) {
			return null;
		}
		
	}
	
	public List<FinalReport> searchreports(Date start, Date end) {
		String q = "select * from finalreport where reportingDate>=? and reportingDate<=?";
		//System.out.println("sample"+sampleId);
		RowMapper<FinalReport> IT = new rowMapperImplFinalReport();
		try {
			List<FinalReport> p = this.jdbcTemplate.query(q, IT, start, end);
			
			return p;
		} catch (Exception e) {
			return null;
		}
	}
	
	public List<RequestedTests> searchreports2(Date start, Date end, int testId, String val) {
		String q = "select rt.sampleId, rt.testId, rt.isCompleted, rt.testReport, rt.verdict, rt.reportDate from requestedtests as rt where "
				+ " rt.reportDate>=? and reportDate<=? and rt.testId=? and rt.isCompleted=true and rt.verdict=? ";
		//System.out.println("sample"+sampleId);
		RowMapper<RequestedTests> IT = new rowMapperImplRequestedTests();
		Boolean k=false;
		System.out.println(val);
		if(val=="Positive")
			k=true;
		try {
			List<RequestedTests> p = this.jdbcTemplate.query(q, IT, start, end, testId, k);
			
			return p;
		} catch (Exception e) {
			return null;
		}
	}
}
