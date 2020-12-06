package springmvc.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import org.springframework.stereotype.Repository;

import springmvc.model.Patient;


@Repository
public class PatientDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public Patient addPatient(Patient P) {
		String q="insert into Patient(name, sex, p_district, p_state, hospitalOPNumber, DOB,"
				+ "  t_district, t_state, contactNumber) values(?,?,?,?,?,?,?,?,?)";
		//String qq="insert into Region(pincode, district, state)";
		
		try {
			this.jdbcTemplate.update(q, P.getName(), P.getSex(), P.getP_district(), P.getP_state(),
					P.getHospitalOPNumber(), P.getDOB(), P.getT_district(), P.getP_state(), P.getContactNumber() );
		}
		catch(Exception e) {
			return null;
		}
		
		
		
		RowMapper<Patient> rm =new rowMapperImplPatient();
		q="select * from patient where hospitalOPNumber=?";
		Patient r = this.jdbcTemplate.queryForObject(q,rm, P.getHospitalOPNumber());
		return  r;
		
	}
	public Patient onePatient(int pid) {
		String query ="select * from Patient where Patient.P_ID=?";
		RowMapper<Patient> rm =new rowMapperImplPatient();
		try {
			Patient P= this.jdbcTemplate.queryForObject(query, rm, pid);
			return P;
		}
		catch(Exception e) {
			return null;
		}
		
		
	}
	
	public Patient checkPatient(int pid, long hopn) {
		String query ="select * from Patient where Patient.P_ID=? and Patient.hospitalOPNumber=?";
		RowMapper<Patient> rm =new rowMapperImplPatient();
		try {
			Patient P= this.jdbcTemplate.queryForObject(query, rm, pid, hopn);
			return P;
		}
		catch (Exception e) {return null;}
		
		
	}
	
	public List<Patient> allPatients() {
		//System.out.println(TId);
		String query ="select * from Patient";
		RowMapper<Patient> rm =new rowMapperImplPatient();
		
		try {
			List<Patient> pat = this.jdbcTemplate.query(query, rm);
			return pat;
		}
		catch(Exception e) {
			return null;
		}
	}
	public List<Patient> leftPatients() {
		String query= "select * from patient as p , sample as s where p.P_ID=s.P_ID and s.sampleId not IN\r\n"
				+ "(select sm.sampleId from sample as sm, requestedtests as r where s.sampleId = r.sampleId and r.isCompleted=false)";
		RowMapper<Patient> rm =new rowMapperImplPatient();
		try {
			List<Patient> pat = this.jdbcTemplate.query(query, rm);
			return pat;
		}
		catch(Exception e) {
			return null;
		}
	}
	
	
	
	
}
