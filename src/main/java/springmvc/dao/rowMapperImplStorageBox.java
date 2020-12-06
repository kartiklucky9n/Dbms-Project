package springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import springmvc.model.StorageBox;

public class rowMapperImplStorageBox implements RowMapper<StorageBox> {

	public StorageBox mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		StorageBox sb = new StorageBox();
		sb.setBoxId(rs.getInt(1));
		sb.setBoxCapacity(rs.getInt(2));
		sb.setContainerType(rs.getString(3));
		sb.setNoOfSample(rs.getInt(4));
		return sb;
	}

}
