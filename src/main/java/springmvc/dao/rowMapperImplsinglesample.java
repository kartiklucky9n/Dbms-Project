package springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import springmvc.model.singlesample;

public class rowMapperImplsinglesample implements RowMapper<singlesample>{

	public singlesample mapRow(ResultSet rs, int rowNum) throws SQLException {
		singlesample sing =new singlesample();
		sing.setSampleId(rs.getInt(1));
		return sing;
	}

}
