package springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import springmvc.model.Patient;

public class rowMapperImplPatient implements RowMapper<Patient> {

	public Patient mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Patient p = new Patient();
		
	
		p.setP_ID(rs.getInt(1));
		p.setName(rs.getString(2));
		p.setSex(rs.getString(3));		
		p.setP_district(rs.getString(4));
		p.setP_state(rs.getString(5));
		p.setHospitalOPNumber(rs.getInt(6));
		p.setDOB(rs.getDate(7));
		p.setT_district(rs.getString(8));
		p.setT_state(rs.getString(9));
		p.setContactNumber(rs.getLong(10));
		return p;
	}
	
}	
