package springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import springmvc.model.Sample;


public class rowMapperImplSample implements RowMapper<Sample> {

	public Sample mapRow(ResultSet rs, int rowNum) throws SQLException {
		Sample samp= new Sample();
		samp.setSampleId(rs.getInt(1));
		samp.setSampleType(rs.getString(2));
		
		samp.setRecievingDate(rs.getDate(3));
		samp.setDateOfAllotment(rs.getDate(4));
		samp.setP_ID(rs.getInt(5));
		samp.setBoxId(rs.getInt(6));
		return samp;
	}
	
}
