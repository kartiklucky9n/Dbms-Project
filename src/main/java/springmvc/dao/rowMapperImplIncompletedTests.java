package springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import springmvc.model.IncompletedTests;

public class rowMapperImplIncompletedTests implements RowMapper<IncompletedTests> {

	public IncompletedTests mapRow(ResultSet rs, int rowNum) throws SQLException {
		IncompletedTests it = new IncompletedTests();
		it.setT_ID(rs.getInt(1));
		it.setSampleId(rs.getInt(2));
		it.setP_ID(rs.getInt(3));
		it.setTestId(rs.getInt(4));
		it.setDateOfAllotment(rs.getDate(5));
		return it;
	}

}
