package springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import springmvc.model.FinalReport;

public class rowMapperImplFinalReport implements RowMapper<FinalReport>{

	public FinalReport mapRow(ResultSet rs, int rowNum) throws SQLException {
		FinalReport fr = new FinalReport();
		fr.setReportId(rs.getInt(1));
		fr.setSampleId(rs.getInt(2));
		fr.setT_ID(rs.getInt(3));
		fr.setResultOfReport(rs.getString(4));
		fr.setReportingDate(rs.getDate(5));
		return fr;
	}

}
