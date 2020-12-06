package springmvc.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import springmvc.model.Patient;
import springmvc.model.Technicians;
import springmvc.model.UserSystem;

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
	public int setattendance(int tid, int v) {
		String query = "update technicians set isApproved=? where T_ID=?   ";
		int r;
		System.out.println(v);
		try {
			if(v==1)
				r = this.jdbcTemplate.update(query, true, tid);
			else 
				r = this.jdbcTemplate.update(query, false, tid);

		} catch (Exception e) {
			return 0;
		}
		return r;
	}
	public List<Technicians> getTechnicianList(int TId) {
		System.out.println(TId);
		String query = "select * from Technicians where T_ID!=?";
		RowMapper<Technicians> rm = new rowMapperImplTechnicians();
		try {
			List<Technicians> tech = this.jdbcTemplate.query(query, rm, TId);
			return tech;
		} catch (Exception e) {
			return null;
		}
	}

	public Technicians getTechnician(int t) {

		String query = "select * from Technicians where T_ID=?";
		RowMapper<Technicians> rm = new rowMapperImplTechnicians();

		try {
			Technicians tech = this.jdbcTemplate.queryForObject(query, rm, t);
			//System.out.println(tech);
			return tech;
		} catch (Exception e) {
			return null;
		}

	}

	public List<Technicians> getHeads() {

		// System.out.println(TId);
		String query = "select u.T_ID, name ,degree, yearOfPassing, emailId, phoneNumber, isApproved from UserSystem as u, technicians as t where t.T_ID=u.T_ID and u.admin=1 ";
		RowMapper<Technicians> rm = new rowMapperImplTechnicians();
		try {
			List<Technicians> tech = this.jdbcTemplate.query(query, rm);
			return tech;
		} catch (Exception e) {
			return null;
		}

	}

	public int editTechnician(Technicians t) {

		System.out.println(t);
		String query = "update technicians set name=?, degree=?, yearOfPassing=?, emailId=?, phoneNumber=? where T_ID=?   ";
		int r;
		try {
			r = this.jdbcTemplate.update(query, t.getName(), t.getDegree(), t.getYearOfPassing(), t.getEmailId(),
					t.getPhoneNumber(), t.getT_ID());

		} catch (Exception e) {
			return 0;
		}
		return r;

	}

	public int deleteTechnician(int TId) {

		String query = "delete from Technicians where T_ID=?";

		int r = 0;
		try {
			r = this.jdbcTemplate.update(query, TId);
			return r;
		} catch (Exception e) {
			return 0;
		}
	}

	public int addTechnician(Technicians technician) {

		String query = "insert into Technicians(name,degree, yearOfPassing, emailId, phoneNumber) values(?,?,?,?,?)";

		try {
			this.jdbcTemplate.update(query, technician.getName(), technician.getDegree(), technician.getYearOfPassing(),
					technician.getEmailId(), technician.getPhoneNumber());

			RowMapper<Technicians> rm = new rowMapperImplTechnicians();
			String q = "select * from technicians where phoneNumber=?";
			Technicians r = this.jdbcTemplate.queryForObject(q, rm, technician.getPhoneNumber());

			query = "insert into UserSystem(T_ID) values(?)";

			this.jdbcTemplate.update(query, r.getT_ID());

			RowMapper<UserSystem> rs = new rowMapperImplUser();
			q = "select * from UserSystem where T_ID=?";
			UserSystem US = this.jdbcTemplate.queryForObject(q, rs, r.getT_ID());
			return US.getTechnicianUId();
		} catch (Exception e) {
			return 0;
		}
	}

}
