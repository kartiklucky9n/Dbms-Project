package springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import springmvc.model.Test;

public class rowMapperImplTests implements RowMapper<Test> {

	public Test mapRow(ResultSet rs, int rowNum) throws SQLException {
		Test t = new Test();
		t.setTestId(rs.getInt(1));
		t.setTestType(rs.getString(2));
		t.setT_ID(rs.getInt(3));
		return t;
	}

}
