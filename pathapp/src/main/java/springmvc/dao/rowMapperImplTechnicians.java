package springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import springmvc.model.Technicians;

public class rowMapperImplTechnicians implements RowMapper<Technicians>  {

	public Technicians mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Technicians tech = new Technicians();
		tech.setT_ID(rs.getInt(1));
		tech.setName(rs.getString(2));
		tech.setDegree(rs.getString(3));
		tech.setYearOfPassing(rs.getInt(4));
		tech.setEmailId(rs.getString(5));
		tech.setPhoneNumber(rs.getLong(6));
		return tech;
		
	}

}
