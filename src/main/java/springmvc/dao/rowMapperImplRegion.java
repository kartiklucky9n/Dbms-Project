package springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;


import org.springframework.jdbc.core.RowMapper;

import springmvc.model.Region;

public class rowMapperImplRegion implements RowMapper<Region> {

	public Region mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Region r = new Region();
		r.setPincode(rs.getInt(1));
		r.setDistrict(rs.getString(2));
		r.setState(rs.getString(3));
		
		return r;
	}

}
