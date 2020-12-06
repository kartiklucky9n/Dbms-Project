package springmvc.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import springmvc.model.StorageBox;

@Repository
public class StorageBoxDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public List<StorageBox> getBoxes(){
		String q="select * from storagebox";
		RowMapper<StorageBox> rm =new rowMapperImplStorageBox();
		try {
			List<StorageBox> sb = this.jdbcTemplate.query(q,rm);
			return sb;
		}
		catch (Exception e) {
			return null;
		}
		
		
	}
	
	public int addBox(String boxType) {
		String q="insert into storagebox(boxCapacity, containerType, noOfSampleStored) values(?, ? , ?)";
		try {
			this.jdbcTemplate.update(q, 99, boxType, 0);
			return 1;
		}
		catch(Exception e) {
			return 0;
		}
		
	}
	

}
