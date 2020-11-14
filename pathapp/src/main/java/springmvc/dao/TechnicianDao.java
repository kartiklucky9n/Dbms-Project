package springmvc.dao;



import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import springmvc.model.Technicians;

@Repository
public class TechnicianDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	public 	List<Technicians> getTechnicianList(int TId) {
		System.out.println(TId);
		String query ="select * from Technicians where T_ID!=?";
		RowMapper<Technicians> rm =new rowMapperImplTechnicians();
		

			List<Technicians> tech = this.jdbcTemplate.query(query, rm, TId);
			return tech;
		
		
	}
	
	public int deleteTechnician(int TId) {
		RowMapper<Technicians> rm =new rowMapperImplTechnicians();
		String query ="delete from Technicians where T_ID=?";
		
		int r=0;
		r= this.jdbcTemplate.update(query, TId);
		return r;
	}

	
}
