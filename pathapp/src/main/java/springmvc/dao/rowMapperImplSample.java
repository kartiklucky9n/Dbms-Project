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
		samp.setReportingDate(rs.getDate(3));
		samp.setRecievingDate(rs.getDate(4));
		samp.setDateOfAllotment(rs.getDate(5));
		samp.setP_ID(rs.getInt(6));
		samp.setBoxId(rs.getInt(7));
		return samp;
	}
	
}
