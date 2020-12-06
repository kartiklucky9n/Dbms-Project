package springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import springmvc.model.RequestedTests;

public class rowMapperImplRequestedTests implements RowMapper<RequestedTests>{

	public RequestedTests mapRow(ResultSet rs, int rowNum) throws SQLException {
		RequestedTests rt = new RequestedTests();
		rt.setSampleId(rs.getInt(1));
		rt.setTestId(rs.getInt(2));
		
		rt.setCompleted(rs.getBoolean(3));
		rt.setTestReport(rs.getString(4));
		rt.setVerdict(rs.getBoolean(5));
		rt.setReportDate(rs.getDate(6));
		return rt;
	} 

}
